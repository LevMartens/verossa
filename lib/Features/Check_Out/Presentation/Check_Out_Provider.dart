import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:verossa/Core/Util/DialogToDismiss.dart';
import 'dart:async';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/Features/Items/Presentation/Item_Provider.dart';
import 'package:verossa/Features/Prices/Domain/Use_Cases/Get_Exchange_Rates.dart';
import 'package:verossa/Features/Items/Presentation/Item_Factory.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';



class CheckOutProvider extends ChangeNotifier {

  final ItemFactory factory;
  final InputConverter inputConverter;
  bool discountApplied;
  bool freeShipping;
  bool standardShipping;
  bool expressShipping;
  double extentSliver;
  bool allFormsAreCompleted = false;
  double containerHeightWhenUserLoggedInAndFormShowing = 620;


  CheckOutProvider({
    @required this.factory,
    @required this.inputConverter,
  })  : assert(factory != null),
        assert(inputConverter != null);


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
    Provider.of<PricesProvider>(context, listen: false).setTotalPriceForCheckOutSummary(freeShipping, standardShipping, expressShipping);
  }

  void extendSliverWith(double height) {
    extentSliver = height;
  }
  void notifyCheckOutListeners() {
    notifyListeners();
  }

  Future<String> payWithCreditCard(String cardNumber, String expMonth, String expYear, String cvc, String nameOnCard) async {
    var card = CreditCard(
        number: cardNumber,
        expMonth: int.parse(
            expMonth),
        expYear: int.parse(
            expYear),
        cvc: cvc,
      );
    return await createPaymentMethodWithCard(card);
  }

  Future<String> createPaymentMethodWithCard(CreditCard card) async {
    PaymentMethod paymentMethod = PaymentMethod();

    paymentMethod = await StripePayment.createPaymentMethod(PaymentMethodRequest(card: card)).then((paymentMethod) {
      return paymentMethod;
    }).catchError((e) {
      print('Error Card: ${e.toString()}');
    });

    if (paymentMethod != null) {
      processPaymentAsDirectCharge(paymentMethod);
      return 'Great Success';
    } else {
      return 'Error';
    }
  }

  Future<void> processPaymentAsDirectCharge(PaymentMethod paymentMethod) async {
    setState(() {
      showSpinner = true;
    });
    var u = subtotalForCheckout.substring(1, cartSubtotal.length - 4);
    var p = u.replaceAll('.', '');


    Map<String, dynamic> body = {
      'amount': '$p',
      'currency': 'AUD',
      'payment_method_types[]': 'card'

    };


    final http.Response response = await http
        .post(Uri.https('$paymentApiUrl', '/v1/payment_intents'), body: body, headers: headers
    );




    if (response.body != null && response.body != 'error') {
      final paymentIntentX = jsonDecode(response.body);
      print('$paymentIntentX');

      final status = paymentIntentX['status'];
      print('$status');

      final strAccount = paymentIntentX['stripeAccount'];
      // check if payment is successfully confirmed
      if (status == 'succeeded') {
        //payment was confirmed by the server without need for further authentication
        StripePayment.completeNativePayRequest();

        var date = DateTime.now().toString();

        setState(() {
          text =
          'Payment completed. ${paymentIntentX['paymentIntent']['amount'].toString()}p successfully charged';
          showSpinner = false;


          firestore.collection("Orders").doc('$orderNumber - $date ').set({
            'Name': fullName,
            'totalPrice': subtotalForCheckout,
            'standardShipping': standardShipping,
            'Items': itemListForCheckout,
            'email': email,
            'orderDate': date,
            'Address': '$apartment $street',
            'Suburb': place,
            'Country': country,
            'State': state,
            'OrderNote': orderNotes,


          });

          updateStockAndCartAfterOrderConfirmation();
          Navigator.of(context).pushReplacementNamed('orderConfirmationPage');
        });
      } else {

        // there is a need to authenticate
        StripePayment.setStripeAccount(strAccount);
        await StripePayment.confirmPaymentIntent(PaymentIntent(
            paymentMethodId: paymentMethod.id,
            clientSecret: paymentIntentX['client_secret']))
            .then(
              (PaymentIntentResult paymentIntentResult) async {
            //This code will be executed if the authentication is successful.
            //Request the server to confirm the payment with.
            final statusFinal = paymentIntentResult.status;
            print(statusFinal);
            if (statusFinal == 'succeeded') {
              StripePayment.completeNativePayRequest();
              setState(() {
                showSpinner = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ShowDialogToDismiss(
                      title: 'Payment Succeeded',
                      content:
                      'Great Success',
                      buttonText: 'CLOSE'));

              var date = DateTime.now().toString();
              firestore.collection("Orders").doc('$orderNumber - $date ').set({
                'Name': fullName,
                'totalPrice': subtotalForCheckout,
                'standardShipping': standardShipping,
                'Items': itemListForCheckout,
                'email': email,
                'orderDate': date,
                'Address': '$apartment $street',
                'Suburb': place,
                'Country': country,
                'State': state,
                'OrderNote': orderNotes,


              });
              updateStockAndCartAfterOrderConfirmation();
              Navigator.of(context).pushReplacementNamed('orderConfirmationPage');
            } else if (statusFinal == 'processing') {
              StripePayment.cancelNativePayRequest();
              setState(() {
                showSpinner = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ShowDialogToDismiss(
                      title: 'Warning',
                      content:
                      'The payment is still in \'processing\' state. This is unusual. Please contact us',
                      buttonText: 'CLOSE'));
            } else {
              StripePayment.cancelNativePayRequest();
              setState(() {
                showSpinner = false;
              });
              showDialog(
                  context: context,
                  builder: (BuildContext context) => ShowDialogToDismiss(
                      title: 'Error',
                      content:
                      'There was an error to confirm the payment. Details: $statusFinal',
                      buttonText: 'CLOSE'));
            }

          },


          //If Authentication fails, a PlatformException will be raised which can be handled here
        ).catchError((e) {
          print('this is error $e');
          //case B1
          StripePayment.cancelNativePayRequest();
          setState(() {
            showSpinner = false;
          });
          showDialog(
              context: context,
              builder: (BuildContext context) => ShowDialogToDismiss(
                  title: 'Error',
                  content:
                  'There was an error to confirm the payment. Please try again with another card',
                  buttonText: 'CLOSE'));
        });
      }
    } else {
      //case A
      print('${response.body}');
      StripePayment.cancelNativePayRequest();
      setState(() {
        showSpinner = false;
      });
      showDialog(
          context: context,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: 'Error',
              content:
              'There was an error in creating the payment. Please try again with another card',
              buttonText: 'CLOSE'));
    }
  }



}