import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Create_PayPal_Payment.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Finalise_PayPal_Payment.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Get_Access_Token.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Save_Order_To_FireStore.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/SendGrid_Email_Sender.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Stripe_Payment_Processor.dart';
import 'dart:async';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Factory.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import 'package:verossa/Features/User/Presentation/User_Provider.dart';
import 'dart:math';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';


class CheckOutProvider extends ChangeNotifier {
  final CreatePayPalPayment createPayPalPayment;
  final FinalisePayPalPayment finalisePayPalPayment;
  final SendGridEmailSender sendGridEmailSender;
  final GetAccessToken getAccessToken;
  final StripePaymentProcessor stripePaymentProcessor;
  final SaveOrderToFireStore saveOrderToFireStore;
  final ItemFactory factory;
  final InputConverter inputConverter;
  final RemoteConfig remoteConfig;
  bool discountApplied;
  bool freeShipping;
  bool standardShipping;
  bool expressShipping;
  double extentSliver = 0;
  bool allFormsAreCompleted = false;
  double containerHeightWhenUserLoggedInAndFormShowing = 620;
  String orderNote;
  String cancelURL = "levsportfolio.web.app";
  String returnURL = "levsportfolio.web.app";
  String checkoutUrlPP;
  String executeUrlPP;
  String accessTokenPP;
  String itemNamePP;
  String pricePP;
  int itemQuantityPP;

  CheckOutProvider({
    @required this.factory,
    @required this.inputConverter,
    @required this.sendGridEmailSender,
    @required this.stripePaymentProcessor,
    @required this.remoteConfig,
    @required this.getAccessToken,
    @required this.saveOrderToFireStore,
    @required this.finalisePayPalPayment,
    @required this.createPayPalPayment,
  })  : assert(factory != null),
        assert(getAccessToken != null),
        assert(sendGridEmailSender != null),
        assert(remoteConfig != null),
        assert(stripePaymentProcessor != null),
        assert(saveOrderToFireStore != null),
        assert(createPayPalPayment != null),
        assert(finalisePayPalPayment != null),
        assert(inputConverter != null);

  void setPricePP(BuildContext context) {
    String totalAmount = Provider.of<PricesProvider>(context, listen: false)
        .totalPriceForCheckOutSummary;
    pricePP = totalAmount.substring(1, totalAmount.length - 4);
  }

  Future<Map<String, dynamic>> getOrderParams(BuildContext context) async {
    Map<int, int> cartContents =
        Provider.of<ItemProvider>(context, listen: false).cartContentMap;
    setPricePP(context);

    for (var i = 1; i < cartContents.length; i++) {
      itemQuantityPP = itemQuantityPP + cartContents[i];
    }

    final List items = [
      {
        "name": "Verossa Prints",
        "quantity": itemQuantityPP,
        "price": pricePP,
        "currency": "AUD"
      }
    ];

    final orderParams = {
      "intent": "sale",
      "payer": {"payment_method": "paypal"},
      "transactions": [
        {
          "amount": {
            "total": pricePP,
            "currency": "AUD",
            "details": {
              "subtotal": pricePP,
            }
          },
          "description": "Verossa Valey",
          "payment_options": {
            "allowed_payment_method": "INSTANT_FUNDING_SOURCE"
          },
          "item_list": {
            "items": items,
          }
        }
      ],
      "note_to_payer": "Contact us for any questions on your order.",
      "redirect_urls": {
        "return_url": "levsportfolio.web.app",
        "cancel_url": "levsportfolio.web.app"
      }
    };

    return orderParams;
  }

  Future<void> createPaypalPayment(BuildContext context) async {

    try {
      final transaction = await getOrderParams(context);

      final failureOrAccessToken = await getAccessToken(NoParams());

      accessTokenPP = failureOrAccessToken.fold(
              (failure) => 'Failure', (newAccessToken) =>
      newAccessToken.accessToken);

      final failureOrPayPalPaymentIntent =
      await createPayPalPayment(
          Params(transaction: transaction, accessToken: accessTokenPP));

      final checkoutUrl = failureOrPayPalPaymentIntent.fold(
              (failure) => 'Failure', (paymentIntent) =>
      paymentIntent.checkoutUrl);

      final executeUrl = failureOrPayPalPaymentIntent.fold(
              (failure) => 'Failure', (paymentIntent) =>
      paymentIntent.executeUrl);

      if (accessTokenPP != 'Failure' && checkoutUrl != 'Failure') {
        checkoutUrlPP = checkoutUrl;
        executeUrlPP = executeUrl;
      }

      notifyListeners();
    } catch (e) {
      print('PayPal exception: ' + e.toString());
    }

  }

  Future<String> executePayPalPayment(
      NavigationRequest request, BuildContext context) async {
    var returnMessage;

    if (request.url.contains(returnURL)) {
      final uri = Uri.parse(request.url);
      final payerID = uri.queryParameters['PayerID'];

      if (payerID != null) {

        final failureOrPaymentConfirmation = await finalisePayPalPayment(Params(executeUrl: executeUrlPP,payerID: payerID, accessToken: accessTokenPP));
        final paymentConfirmation = failureOrPaymentConfirmation.fold(
                (failure) => 'Failure', (confirmation) =>
        confirmation.confirmationID);

        if (paymentConfirmation != 'Failure') {
          Provider.of<ItemProvider>(context, listen: false).updateCartAfterOrderConfirmation();
          addOrderToFireStore(pricePP, context);
          returnMessage = 'Great Success';
        }
      }
    } else {
      returnMessage = 'Payment Failed';
    }
    if (request.url.contains(cancelURL)) {
      returnMessage = 'Payment Failed';
    }
    return '$returnMessage';
  }

  Future<String> payWithApplePay(BuildContext context) async {
    setPricePP(context);

    bool deviceSupportNativePay = await StripePayment.deviceSupportsNativePay();
    bool isNativeReady = await StripePayment.canMakeNativePayPayments(
        ['american_express', 'visa', 'maestro', 'master_card']
    );
    if (deviceSupportNativePay && isNativeReady == true) {
      return await createPaymentMethodNative(context);
    } else {return await createPaymentMethod(context);}

  }
  Future<String> createPaymentMethod(BuildContext context) async {
    var responseMessage;
    StripePayment.setStripeAccount(null);
    PaymentMethod paymentMethod = PaymentMethod();

    paymentMethod = await StripePayment.paymentRequestWithCardForm(
      CardFormPaymentRequest(),
    ).then((PaymentMethod paymentMethod) async {
      return paymentMethod;
    }).catchError((e)  {
      print('Error Card: ${e.toString()}');
    });

    if (paymentMethod != null) {
      responseMessage = await processPaymentAsDirectCharge(paymentMethod, pricePP, context);
    }
    else {
      responseMessage = 'It is not possible to pay with this card. Please try again with a different card';
    }
    return await responseMessage;
  }
  Future<String> createPaymentMethodNative(BuildContext context) async {

    StripePayment.setStripeAccount(null);

    List<ApplePayItem> items = [];

    items.add(ApplePayItem(
      label: 'Verossa Valey Order',
      amount: '$pricePP',
    ));

    PaymentMethod paymentMethod = PaymentMethod();

    Token token = await StripePayment.paymentRequestWithNativePay(
      androidPayOptions: AndroidPayPaymentRequest(
        totalPrice: '$pricePP',
        currencyCode: 'AUD',
      ),

      applePayOptions: ApplePayPaymentOptions(
        countryCode: 'AU',
        currencyCode: 'AUD',
        items: items,
      ),
    );

    paymentMethod = await StripePayment.createPaymentMethod(
      PaymentMethodRequest(
        card: CreditCard(
          token: token.tokenId,
        ),
      ),
    );

    if (paymentMethod != null) {
      return await processPaymentAsDirectCharge(paymentMethod, pricePP, context);
    } else {
      return 'It is not possible to pay with this card. Please try again with a different card';
    }

  }

  void setDiscountApplied(bool bool) {
    discountApplied = bool;
  }

  void setContainerHeightWhenUserLoggedInAndFormShowing(double double) {
    containerHeightWhenUserLoggedInAndFormShowing = double;
  }

  void setAllFormsAreCompleted(bool bool) {
    allFormsAreCompleted = bool;
  }

  void setFreeShippingTo(bool bool) {
    freeShipping = bool;
  }

  void setStandardShippingTo(bool bool) {
    standardShipping = bool;
  }

  void setExpressShippingTo(bool bool) {
    expressShipping = bool;
  }

  void setTotalPriceForSummary(BuildContext context) {
    Provider.of<PricesProvider>(context, listen: false)
        .setTotalPriceForCheckOutSummary(
            freeShipping, standardShipping, expressShipping);
  }

  void extendSliverWith(double height) {
    extentSliver = height;
  }

  void notifyCheckOutListeners() {
    notifyListeners();
  }

  Future<String> payWithCreditCard(
      String cardNumber,
      String expMonth,
      String expYear,
      String cvc,
      String nameOnCard,
      String totalPrice,
      BuildContext context) async {
    var card = CreditCard(
      number: cardNumber,
      expMonth: int.parse(expMonth),
      expYear: int.parse(expYear),
      cvc: cvc,
    );

    var a = totalPrice.substring(1, totalPrice.length - 4);
    var totalPricePrepped = a.replaceAll('.', '');

    return await createPaymentMethodWithCard(card, totalPricePrepped, context);
  }

  Future<String> createPaymentMethodWithCard(
      CreditCard card, String totalPrice, BuildContext context) async {
    PaymentMethod paymentMethod = PaymentMethod();

    paymentMethod = await StripePayment.createPaymentMethod(
            PaymentMethodRequest(card: card))
        .then((paymentMethod) {
      return paymentMethod;
    }).catchError((e) {
      print('Error Card: ${e.toString()}');
    });

    if (paymentMethod != null) {
      return await processPaymentAsDirectCharge(
          paymentMethod, totalPrice, context);
    } else {
      print('paymentMethod == null');
      return 'Error';
    }
  }

  Future<String> processPaymentAsDirectCharge(PaymentMethod paymentMethod,
      String totalPrice, BuildContext context) async {
    final failureOrPaymentIntent =
        await stripePaymentProcessor(Params(totalPrice: totalPrice));

    final paymentIntentStatus = failureOrPaymentIntent.fold(
        (failure) => 'Failure', (newPaymentIntent) => newPaymentIntent.status);
    final stripeAccount = failureOrPaymentIntent.fold((failure) => 'Failure',
        (newPaymentIntent) => newPaymentIntent.stripeAccount);
    final clientSecret = failureOrPaymentIntent.fold((failure) => 'Failure',
        (newPaymentIntent) => newPaymentIntent.clientSecret);

    if (paymentIntentStatus == 'Failure') {
      print('paymentIntentStatus == Failure');
      return 'Failure';
    } else {
      if (paymentIntentStatus == 'Succeeded') {
        StripePayment.completeNativePayRequest();
        addOrderToFireStore(totalPrice, context);
        return 'Great Success';
      } else {
        StripePayment.setStripeAccount(stripeAccount);

        final paymentIntentResult = await StripePayment.confirmPaymentIntent(
                PaymentIntent(
                    paymentMethodId: paymentMethod.id,
                    clientSecret: clientSecret))
            .catchError((e) {
          print('Error StripePayment: $e');
          StripePayment.cancelNativePayRequest();
        });

        final finalStatus = paymentIntentResult.status;

        if (finalStatus == 'succeeded') {
          StripePayment.completeNativePayRequest();
          addOrderToFireStore(totalPrice, context);
          return 'Great Success';
        } else if (finalStatus == 'processing') {
          StripePayment.cancelNativePayRequest();
          return 'The payment process is taking longer than expected, please contact your bank';
        } else {
          StripePayment.cancelNativePayRequest();
          return 'Error processing payment. Details: $finalStatus';
        }
      }
    }
  }

  void addOrderToFireStore(String totalPrice, BuildContext context) {
    var date = DateTime.now().toString();
    var orderNumber = new Random().nextInt(1000).toString();
    var items =
        Provider.of<ItemProvider>(context, listen: false).returnCartContent();
    var userDetailsMap = Provider.of<UserProvider>(context, listen: false)
        .returnCurrentUserDetailsMap();
    Map<String, dynamic> map = {
      'totalPrice': totalPrice,
      'orderNote': orderNote,
      'freeShipping': freeShipping,
      'standardShipping': standardShipping,
      'items': items,
      'userDetails': userDetailsMap
    };

    saveOrderToFireStore(
        Params(map: map, orderNumber: orderNumber, date: date));
  }
  void setupStripe() {
    StripePayment.setOptions(
        StripeOptions(publishableKey: remoteConfig.getString('Stripe_Publishable_Key'), merchantId: "Test", androidPayMode: 'test'));
  }

  void sendEmail(String name, String email) {
    final emailBody = remoteConfig.getString('Payment_Confirmation_Email_Body');
    sendGridEmailSender(Params(fullName: name, email: email, emailBody: emailBody));
  }
}
