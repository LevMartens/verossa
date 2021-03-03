//import 'dart:html';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Features/Check_Out/Presentation/Check_Out_Provider.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Drop_Down_Summary_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Discount_Applied_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Summary_Discount_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Summary_Subtotal_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Summary_Total_Widget.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'package:verossa/Old_Architecture/Controller/Global_Methods.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';
import '../Model/Global_Variables.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:verossa/Old_Architecture/Model/Global_Variables.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:verossa/Old_Architecture/Controller/PaypalPayment.dart';
import 'Thank_You_For_Order_Page.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import 'package:verossa/Features/User_Auth/Presentation/User_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';



final textControllerForCredNumber = TextEditingController();
final textControllerForCredName = TextEditingController();
final textControllerForCredExp = TextEditingController();
final textControllerForCredSec = TextEditingController();


AnimationController rotationController;
bool orderSummaryIsClosed;
String showOrHideSummary;
double containerHeightForSummary;
String text = 'Click the button to start the payment';
double totalCost = 10.0;
double tip = 1.0;
double tax = 0.0;
double taxPercent = 0.2;
String secret = 'sk_test_51HaWL0DNMiEsQiX2ERExuL0FP0OuhH60LKA3sY9lxxZBd0XGJFzoINrc5oe6lDN8BdEVicpNpugmo8Aww86pdGIn00RnjKb1yU';
int amount = 0;
bool showSpinner = false;
String url ='https://us-central1-demostripe-b9557.cloudfunctions.net/StripePI';
String apiBase = 'https://api.stripe.com';
String paymentApiUrl = '$apiBase';
Map<String, String> headers = {
  'Authorization': 'Bearer $secret',
  'Content_Type': 'application/x-www-form-urlencoded'
};


 CreditCard testCard;



class PreCheckOut extends StatefulWidget {
  final List<Widget> summaryDDItems;
  final bool userIsLoggedIn;

  PreCheckOut({this.summaryDDItems, this.userIsLoggedIn}); //

  @override
  _InputPageState createState() =>
      _InputPageState(summaryDDItems: summaryDDItems, userIsLoggedIn: userIsLoggedIn ); //
}

class _InputPageState extends State<PreCheckOut> with SingleTickerProviderStateMixin {
  List<Widget> summaryDDItems;
  bool contactDetailsAreNull;


  bool userIsLoggedIn;
  double changeHeightWithDiscount = 60;
  //double containerHeightWhenUserLoggedInAndFormShowing = 620;
  Row showDiscountApplied = Row();
  bool creditCardSelected = false;
  bool applePaySelected = false;
  bool googlePaySelected = false;
  bool paypalSelected = false;
  bool containerHeight200 = true;
  double extentSliver = 0;
  bool standardShipping = true;

  bool allFormsAreCompleted = false;


  _InputPageState({this.summaryDDItems, this.userIsLoggedIn }); //



  ModalRoute _mountRoute;


  @override
  void didChangeDependencies() {
    _mountRoute ??= ModalRoute.of(context);
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();




    rotationController = AnimationController(duration: const Duration(milliseconds: 100), vsync: this);
    orderSummaryIsClosed = true;
    showOrHideSummary = 'Show order summary';
    containerHeightForSummary = 234 + (summaryDDItems.length).toDouble() * 86;
    StripePayment.setOptions(
        StripeOptions(publishableKey: "pk_test_51HaWL0DNMiEsQiX2n4CvTKCETWVV84wnqWRwbEeQ4kM4ai4DAEGaTngq5iwhQhVZXAniX3mTMmFyJ2JouWf2C2T400x7SVZmUw", merchantId: "Test", androidPayMode: 'test'));
  }

@override
  void dispose() {
    super.dispose();
    _formKeyForDiscount.currentState?.dispose();
    _formKeyForShip.currentState?.dispose();
    _formKeyForCred.currentState?.dispose();
    _emailFormKey.currentState?.dispose();
    rotationController.dispose();
  }




  static final _formKeyForDiscount = GlobalKey<FormState>();
  static final _formKeyForShip = GlobalKey<FormState>();
  static final _emailFormKey = GlobalKey<FormState>();
  static final _formKeyForCred = GlobalKey<FormState>();

  final _textControllerForDiscount = TextEditingController();
  final textControllerForShipEmail = TextEditingController();
  final textControllerForShipFistName = TextEditingController();
  final textControllerForShipLastName = TextEditingController();
  final textControllerForShipAddress = TextEditingController();
  final textControllerForShipApartment = TextEditingController();
  final textControllerForShipSuburb = TextEditingController();
  final textControllerForShipCountry = TextEditingController();
  final textControllerForShipState = TextEditingController();
  final textControllerForShipPostcode = TextEditingController();

  final _scrollController = ScrollController(keepScrollOffset: false);



  @override
  Widget build(BuildContext context) {

    bool discountApplied = Provider.of<CheckOutProvider>(context, listen: true).discountApplied;
    bool freeShipping = Provider.of<CheckOutProvider>(context, listen: true).freeShipping;
    bool standardShipping = Provider.of<CheckOutProvider>(context, listen: true).standardShipping;
    String totalPrice = Provider.of<PricesProvider>(context, listen: true).totalPrice;
    String totalPriceForSummary = Provider.of<PricesProvider>(context, listen: true).totalPriceForCheckOutSummary;
    User currentUser = Provider.of<UserProvider>(context, listen: true).currentUser;
    Map<String,String> currentUserDetailsMap = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;




    double width = MediaQuery.of(context).size.width;
    //bool discountApplied = false;

    Container discount() {
      final formKeyDiscount = _mountRoute == ModalRoute.of(context)
          ? _formKeyForDiscount
          : GlobalKey<FormState>();//Key('hack-to-dispose-of-will-pop-callback');

      return Container(
        height: 60,
        width: 800,
        color: Colors.transparent,
        child: Form(
          key: formKeyDiscount,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                child: Container(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    maxLines: 1,
                    controller: _textControllerForDiscount,
                    decoration: const InputDecoration(
                      hintText: 'Gift card or discount code',
                      hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        borderSide: BorderSide(
                          color: Colors.black12,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value != 'Discount') {
                        return 'Enter a valid discount code or gift card';
                      }

                      return null;
                    },
                  ),
                ),
              ),
              Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                ),
                height: 48,
                width: 70,
                child: FlatButton(
                  onPressed: () {
                    if (_formKeyForDiscount.currentState.validate()) {
                      var u = cartSubtotal.substring(1, cartSubtotal.length - 4);
                      var t = double.parse(u);
                      double y = 0.00;
                       y = t * 0.9;


                      setState(() {
                        discountApplied = true;
                        subtotalForCheckout = '$currencySymbolInUse${y.toStringAsFixed(2)} $currencyInUse';
                        changeHeightWithDiscount = 80;
                        showDiscountApplied = Row(
                          children: [
                            Text('Discount'),
                            Spacer(),
                            Text('-10%', style: TextStyle(fontWeight: FontWeight.w600),),
                            SizedBox(width: 15,)
                          ],
                        );
                      });
                    }
                  },
                  child: Icon(Icons.arrow_forward, color: Colors.white,),
                ),
              ),
              SizedBox(width: 15,)
            ],
          ),
        ),
      );
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
    Future<void> createPaymentMethod() async {
      StripePayment.setStripeAccount(null);
      tax = ((totalCost * taxPercent) * 100).ceil() / 100;
      amount = ((totalCost + tip + tax) * 100).toInt();
      print('amount in pence/cent which will be charged = $amount');
      //step 1: add card
      PaymentMethod paymentMethod = PaymentMethod();

      paymentMethod = await StripePayment.paymentRequestWithCardForm(
        CardFormPaymentRequest(),
      ).then((PaymentMethod paymentMethod) {
        return paymentMethod;
      }).catchError((e) {
        print('Errore Card: ${e.toString()}');
      });
      paymentMethod != null
          ? processPaymentAsDirectCharge(paymentMethod)
          : showDialog(
          context: context,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: 'Error',
              content:
              'It is not possible to pay with this card. Please try again with a different card',
              buttonText: 'CLOSE'));
    }
    Future<void> createPaymentMethodNative() async {
      print('started NATIVE payment...');

      StripePayment.setStripeAccount(null);

      var u = subtotalForCheckout.substring(1, cartSubtotal.length - 4);


      List<ApplePayItem> items = [];

      items.add(ApplePayItem(
        label: 'Demo Order',
        amount: '$u',
      ));

      // if (tip != 0.0)
      //   items.add(ApplePayItem(
      //     label: 'Tip',
      //     amount: tip.toString(),
      //   ));
      // if (taxPercent != 0.0) {
      //   tax = ((totalCost * taxPercent) * 100).ceil() / 100;
      //   items.add(ApplePayItem(
      //     label: 'Tax',
      //     amount: tax.toString(),
      //   ));
      //}

      items.add(ApplePayItem(
        label: 'Verossa Valey',
        amount: '$u',
      ));


      print('amount which will be charged = $u');

      // Add card.
      PaymentMethod paymentMethod = PaymentMethod();

      Token token = await StripePayment.paymentRequestWithNativePay(
        androidPayOptions: AndroidPayPaymentRequest(
          totalPrice: '$u',
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


      paymentMethod != null
          ? processPaymentAsDirectCharge(paymentMethod)
          : showDialog(
          context: context,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: 'Error',
              content:
              'It is not possible to pay with this card. Please try again with a different card',
              buttonText: 'CLOSE'));
    }
    Future<void> createPaymentMethodWithCard() async {
      PaymentMethod paymentMethod = PaymentMethod();

      paymentMethod = await StripePayment.createPaymentMethod(
        PaymentMethodRequest(
          card: testCard,
        ),
      ).then((paymentMethod) {




        return paymentMethod;

      }).catchError((e) {
        print('Error Card: ${e.toString()}');
      });
      paymentMethod != null
          ? processPaymentAsDirectCharge(paymentMethod)
          : showDialog(
          context: context,
          builder: (BuildContext context) => ShowDialogToDismiss(
              title: 'Error',
              content:
              'It is not possible to pay with this card. Please try again with a different card',
              buttonText: 'CLOSE'));
    }
    void checkIfNativePayReady() async {
      print('started to check if native pay ready');
      bool deviceSupportNativePay = await StripePayment.deviceSupportsNativePay();
      bool isNativeReady = await StripePayment.canMakeNativePayPayments(
          ['american_express', 'visa', 'maestro', 'master_card']
      );
      deviceSupportNativePay && isNativeReady ? createPaymentMethodNative() : createPaymentMethod();  }

    final formKeyShip = _mountRoute == ModalRoute.of(context)
        ? _formKeyForShip
        : GlobalKey<FormState>();//Key('hack-to-dispose-of-will-pop-callback');

    final formKeyContact = _mountRoute == ModalRoute.of(context)
        ? _emailFormKey
        : GlobalKey<FormState>();//Key('hack-to-dispose-of-will-pop-callback')

    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: street != null ? 1080 + extentSliver : 1680 + extentSliver,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    VerossaLogo(),
                    SizedBox(height: 25),
                    DDSummary(),
                    SizedBox(height: 20),

                    ///CONTACT AND SHIPPING FORM
                    Container(
                      child: currentUser != null ? Container(
                        height: currentUserDetailsMap['address'] != null ? 200 : containerHeightWhenUserLoggedInAndFormShowing,
                        width: width -30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border(
                            right: BorderSide(
                              color: Colors.brown[100],
                              width: 1,
                            ),
                            left: BorderSide(
                              color: Colors.brown[100],
                              width: 1,
                            ),
                              bottom: BorderSide(
                                color: Colors.brown[100],
                                width: 1,
                              ),
                              top: BorderSide(
                                color: Colors.brown[100],
                                width: 1,
                              )
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
                              child: Row(
                                children: [
                                  Text('Contact', style: TextStyle(fontWeight: FontWeight.w300),),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      currentUserDetailsMap['address'] = null;
                                      currentUserDetailsMap['email'] = null;
                                      allFormsAreCompleted = false;
                                      containerHeightWhenUserLoggedInAndFormShowing = 800;
                                      Provider.of<UserProvider>(context, listen: false).temporaryChangeInUserDetails(currentUserDetailsMap);
                                    },
                                    child: currentUserDetailsMap['email'] != null ? Text('Change') : Container(),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 6, right: 15),
                              child: GestureDetector(
                                  child: currentUserDetailsMap['email'] != null ? Text('${currentUserDetailsMap['firstName']} ${currentUserDetailsMap['lastName']} / ${currentUserDetailsMap['email']}') : Form(
                                    key: formKeyContact,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                          child: Container(
                                            width: 300,
                                            height: 50,
                                            child: TextFormField(
                                              maxLines: 1,
                                              controller: textControllerForShipFistName,
                                              autofillHints: [AutofillHints.givenName],
                                              decoration: const InputDecoration(
                                                hintText: 'First name',
                                                hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                fillColor: Colors.white,
                                                filled: true,
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {

                                                if (value.isEmpty) {
                                                  return 'Please enter your first name here';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                          child: Container(
                                            width: 300,
                                            height: 50,
                                            child: TextFormField(
                                              maxLines: 1,
                                              controller: textControllerForShipLastName,
                                              autofillHints: [AutofillHints.familyName],
                                              decoration: const InputDecoration(
                                                hintText: 'Last name',
                                                hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                fillColor: Colors.white,
                                                filled: true,
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                              ),
                                              validator: (value) {

                                                if (value.isEmpty) {
                                                  return 'Please enter your last name here';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                          child: Container(
                                            width: 300,
                                            height: 50,
                                            child: TextFormField(
                                              maxLines: 1,
                                              controller: textControllerForShipEmail,
                                              autofillHints: [AutofillHints.email],
                                              decoration: const InputDecoration(
                                                hintText: 'Email',
                                                hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                fillColor: Colors.white,
                                                filled: true,
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.all(Radius.circular(7)),
                                                  borderSide: BorderSide(
                                                    color: Colors.black12,
                                                  ),
                                                ),

                                              ),
                                              validator: (value) {
                                                if (value.contains('@') == false) {

                                                  return 'Email not valid';

                                                }
                                                if (value.contains('.') == false) {

                                                  return 'Email not valid';

                                                }
                                                if (value.isEmpty) {
                                                  return 'Please enter your email here';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ),
                              ),
                            ),


                            Divider(
                              indent: 15 ,
                              endIndent: 15,
                              color: Colors.brown[100],
                              thickness: 1,
                            ),
                            ///ship to, user logged in
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
                              child: Row(
                                children: [
                                  Text('Ship to', style: TextStyle(fontWeight: FontWeight.w300),),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        street = null;
                                        allFormsAreCompleted = false;
                                      });
                                    },
                                    child: street != null ? Text('Change') : Container(),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 6, right: 15),
                              child: GestureDetector(
                                  child: street != null ? Text('$apartment $street, $place, $postcode, $state') : Container(
                                    height: 440,
                                    width: 400,
                                    color: Colors.transparent,
                                    child: Form(
                                      key: formKeyShip,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[

                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipAddress,
                                                autofillHints: [AutofillHints.fullStreetAddress],
                                                decoration: const InputDecoration(
                                                  hintText: 'Address',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please enter your address here';
                                                  }

                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipApartment,
                                                decoration: const InputDecoration(
                                                  hintText: 'Apartment, suite, etc.(optional)',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),
                                                ),
                                                validator: (value) {


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipSuburb,
                                                autofillHints: [AutofillHints.addressCity],
                                                decoration: const InputDecoration(
                                                  hintText: 'Suburb',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {

                                                  if (value.isEmpty) {
                                                    return 'Please enter your suburb here';
                                                  }


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipCountry,
                                                autofillHints: [AutofillHints.countryName],
                                                decoration: const InputDecoration(
                                                  hintText: 'Country/Region',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {

                                                  if (value.isEmpty) {
                                                    return 'Please enter your Country/Region here';
                                                  }


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipState,
                                                autofillHints: [AutofillHints.addressState],
                                                decoration: const InputDecoration(
                                                  hintText: 'State/territory',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {

                                                  if (value.isEmpty) {
                                                    return 'Please enter your State/territory here';
                                                  }


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipPostcode,
                                                autofillHints: [AutofillHints.postalCode],
                                                decoration: const InputDecoration(
                                                  hintText: 'Postcode',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {

                                                  if (value.isEmpty) {
                                                    return 'Please enter your Postcode here';
                                                  }


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0),
                                            child: Container(
                                              height: 40,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[800],
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0),
                                                ),
                                              ),
                                              child: FlatButton(
                                                onPressed: () {
                                                  if (formKeyShip.currentState.validate()) {
                                                    setState(() {
                                                      street = textControllerForShipAddress.text;
                                                      apartment = textControllerForShipApartment.text;
                                                      place = textControllerForShipSuburb.text;
                                                      country = textControllerForShipCountry.text;
                                                      state = textControllerForShipState.text;
                                                      postcode = textControllerForShipPostcode.text;
                                                      email = textControllerForShipEmail.text;
                                                      allFormsAreCompleted = true;
                                                      containerHeightWhenUserLoggedInAndFormShowing = 620;
                                                    });




                                                  }
                                                },
                                                child: Text(
                                                  'ADD',
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            Divider(
                              indent: 15 ,
                              endIndent: 15,
                              color: Colors.brown[100],
                              thickness: 1,
                            ),

                            ///method, user logged in
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
                              child: Row(
                                children: [
                                  Text('Method', style: TextStyle(fontWeight: FontWeight.w300),),
                                  Spacer(),
                                  freeShipping == false ? GestureDetector(
                                    onTap: () {
                                      var u = subtotalForCheckout.substring(1, cartSubtotal.length - 4);
                                      var t = double.parse(u);
                                      double y = 0.00;

                                      if (standardShipping == true ){
                                        y = t + 6;

                                      setState(() {
                                        subtotalForCheckout = '$currencySymbolInUse${y.toStringAsFixed(2)} $currencyInUse';
                                        standardShipping = false;
                                      }); } else {
                                        y = t - 6;

                                        setState(() {
                                          subtotalForCheckout = '$currencySymbolInUse${y.toStringAsFixed(2)} $currencyInUse';
                                          standardShipping = true;
                                        });
                                      }
                                    },
                                    child: Text('Change'),
                                  ) : Container(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 6, right: 15),
                              child: GestureDetector(
                                  child: freeShipping == true ? Row(
                                    children: [
                                      Text('Free Shipping:'),
                                      SizedBox(width: 5,),
                                      Text('\$0.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),)
                                    ],
                                  ) : standardShipping == true ? Row(
                                    children: [
                                      Text('Standard Shipping:'),
                                      SizedBox(width: 5,),
                                      Text('\$9.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),)
                                    ],
                                  ) : Row(
                                    children: [
                                      Text('Express Shipping'),
                                      SizedBox(width: 5,),
                                      Text('\$15.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),)
                                    ],
                                  )

                              ),
                            ),

                          ],
                        ),) : Container(
                        height: street != null ? 200 : 800,
                        width: width -30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            border: Border(
                                right: BorderSide(
                                  color: Colors.brown[100],
                                  width: 1,

                                ),
                                left: BorderSide(
                                  color: Colors.brown[100],
                                  width: 1,

                                ),
                                bottom: BorderSide(
                                  color: Colors.brown[100],
                                  width: 1,

                                ),
                                top: BorderSide(
                                  color: Colors.brown[100],
                                  width: 1,

                                )
                            )

                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
                              child: Row(
                                children: [
                                  Text('Contact', style: TextStyle(fontWeight: FontWeight.w300),),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        street = null;
                                        email = null;
                                        allFormsAreCompleted = false;
                                      });

                                    },
                                    child: email != null ? Text('Change') : Container(),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 6, right: 15),
                              child: Container(
                                child: email != null ? Text('$firstName $lastName / $email') : Form(
                                  key: formKeyContact,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                        child: Container(
                                          width: 300,
                                          height: 50,
                                          child: TextFormField(
                                            maxLines: 1,
                                            controller: textControllerForShipFistName,
                                            autofillHints: [AutofillHints.givenName],
                                            decoration: const InputDecoration(
                                              hintText: 'First name',
                                              hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                              fillColor: Colors.white,
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(

                                                borderRadius: BorderRadius.all(Radius.circular(7)),
                                                borderSide: BorderSide(
                                                  color: Colors.black12,
                                                ),
                                              ),

                                            ),
                                            validator: (value) {

                                              if (value.isEmpty) {
                                                return 'Please enter your first name here';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                        child: Container(
                                          width: 300,
                                          height: 50,
                                          child: TextFormField(
                                            maxLines: 1,
                                            controller: textControllerForShipLastName,
                                            autofillHints: [AutofillHints.familyName],
                                            decoration: const InputDecoration(
                                              hintText: 'Last name',
                                              hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                              fillColor: Colors.white,
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(7)),
                                                borderSide: BorderSide(
                                                  color: Colors.black12,
                                                ),
                                              ),

                                            ),
                                            validator: (value) {

                                              if (value.isEmpty) {
                                                return 'Please enter your last name here';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                        child: Container(
                                          width: 300,
                                          height: 50,
                                          child: TextFormField(
                                            maxLines: 1,
                                            controller: textControllerForShipEmail,
                                            autofillHints: [AutofillHints.email],
                                            decoration: const InputDecoration(
                                              hintText: 'Email',
                                              hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                              fillColor: Colors.white,
                                              filled: true,
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(7)),
                                                borderSide: BorderSide(
                                                  color: Colors.black12,
                                                ),
                                              ),

                                            ),
                                            validator: (value) {
                                              if (value.contains('@') == false) {

                                                return 'Email not valid';

                                              }
                                              if (value.contains('.') == false) {

                                                return 'Email not valid';

                                              }
                                              if (value.isEmpty) {
                                                return 'Please enter your email here';
                                              }

                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),

                                ),
                              ),
                            ),
                            Divider(
                              indent: 15 ,
                              endIndent: 15,
                              color: Colors.brown[100],
                              thickness: 1,
                            ),
                            ///ship to, user logged out
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
                              child: Row(
                                children: [
                                  Text('Ship to', style: TextStyle(fontWeight: FontWeight.w300),),
                                  Spacer(),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 6, right: 15),
                              child: GestureDetector(
                                  child: street != null ? Text('$apartment $street, $place, $postcode, $state') : Container(
                                    height: 440,
                                    width: 400,
                                    color: Colors.transparent,
                                    child: Form(
                                      key: formKeyShip,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[

                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipAddress,
                                                autofillHints: [AutofillHints.fullStreetAddress],
                                                decoration: const InputDecoration(
                                                  hintText: 'Address',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    return 'Please enter your address here';
                                                  }

                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipApartment,
                                                decoration: const InputDecoration(
                                                  hintText: 'Apartment, suite, etc.(optional)',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipSuburb,
                                                autofillHints: [AutofillHints.addressCity],
                                                decoration: const InputDecoration(
                                                  hintText: 'Suburb',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {

                                                  if (value.isEmpty) {
                                                    return 'Please enter your suburb here';
                                                  }


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipCountry,
                                                autofillHints: [AutofillHints.countryName],
                                                decoration: const InputDecoration(
                                                  hintText: 'Country/region',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {

                                                  if (value.isEmpty) {
                                                    return 'Please enter your Country/Region here';
                                                  }


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipState,
                                                autofillHints: [AutofillHints.addressState],
                                                decoration: const InputDecoration(
                                                  hintText: 'State/territory',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {

                                                  if (value.isEmpty) {
                                                    return 'Please enter your State/territory here';
                                                  }


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                            child: Container(
                                              width: 300,
                                              height: 50,
                                              child: TextFormField(
                                                maxLines: 1,
                                                controller: textControllerForShipPostcode,
                                                autofillHints: [AutofillHints.postalCode],
                                                decoration: const InputDecoration(
                                                  hintText: 'Postcode',
                                                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                                                  fillColor: Colors.white,
                                                  filled: true,
                                                  enabledBorder: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                                    borderSide: BorderSide(
                                                      color: Colors.black12,
                                                    ),
                                                  ),

                                                ),
                                                validator: (value) {

                                                  if (value.isEmpty) {
                                                    return 'Please enter your Postcode here';
                                                  }


                                                  return null;
                                                },
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 15.0),
                                            child: Container(
                                              height: 40,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[800],
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0),
                                                ),
                                              ),
                                              child: FlatButton(
                                                onPressed: () {


                                                  if (formKeyShip.currentState.validate() &&  formKeyContact.currentState.validate()) {
                                                    setState(() {
                                                      street = textControllerForShipAddress.text;
                                                      apartment = textControllerForShipApartment.text;
                                                      place = textControllerForShipSuburb.text;
                                                      country = textControllerForShipCountry.text;
                                                      state = textControllerForShipState.text;
                                                      postcode = textControllerForShipPostcode.text;
                                                      email = textControllerForShipEmail.text;
                                                      firstName = textControllerForShipFistName.text;
                                                      lastName = textControllerForShipLastName.text;
                                                      allFormsAreCompleted = true;


                                                    });




                                                  }
                                                },
                                                child: Text(
                                                  'ADD',
                                                  style: TextStyle(
                                                      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Center(
                                            child: Container(
                                              height: 15,

                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pushReplacementNamed('createAccount');
                                                },
                                                child: Text('Or create account'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ),
                            Divider(
                              indent: 15 ,
                              endIndent: 15,
                              color: Colors.brown[100],
                              thickness: 1,
                            ),
                            ///method, user logged out
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
                              child: Row(
                                children: [
                                  Text('Method', style: TextStyle(fontWeight: FontWeight.w300),),
                                  Spacer(),
                                  freeShipping == false ? GestureDetector(
                                    onTap: () {
                                      var u = subtotalForCheckout.substring(1, cartSubtotal.length - 4);
                                      var t = double.parse(u);
                                      double y = 0.00;

                                      if (standardShipping == true ){
                                        y = t + 6;

                                        setState(() {
                                          subtotalForCheckout = '$currencySymbolInUse${y.toStringAsFixed(2)} $currencyInUse';
                                          standardShipping = false;
                                        }); } else {
                                        y = t - 6;

                                        setState(() {
                                          subtotalForCheckout = '$currencySymbolInUse${y.toStringAsFixed(2)} $currencyInUse';
                                          standardShipping = true;
                                        });
                                      }
                                    },
                                    child: Text('Change'),
                                  ) : Container(),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 6, right: 15),
                              child: GestureDetector(
                                  child: freeShipping == true ? Row(
                                    children: [
                                      Text('Free Shipping:'),
                                      SizedBox(width: 5,),
                                      Text('\$0.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),)
                                    ],
                                  ) : standardShipping == true ? Row(
                                    children: [
                                      Text('Standard Shipping:'),
                                      SizedBox(width: 5,),
                                      Text('\$9.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),)
                                    ],
                                  ) : Row(
                                    children: [
                                      Text('Express Shipping'),
                                      SizedBox(width: 5,),
                                      Text('\$15.00 AUD', style: TextStyle(fontWeight: FontWeight.w600),)
                                    ],
                                  )

                              ),
                            ),

                          ],
                        ),),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Gift card or discount code', style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                        )),
                    SizedBox(height: 10),
                    discount(),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: width,

                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Payment', style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                        )),
                    Container(
                        width: width,

                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('All transactions are secure and encrypted', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: creditCardSelected == true ? 540 : 280,
                      width: width -30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          border: Border(
                              right: BorderSide(
                                color: Colors.brown[100],
                                width: 1,

                              ),
                              left: BorderSide(
                                color: Colors.brown[100],
                                width: 1,

                              ),
                              bottom: BorderSide(
                                color: Colors.brown[100],
                                width: 1,

                              ),
                              top: BorderSide(
                                color: Colors.brown[100],
                                width: 1,

                              )
                          )

                      ),
                      child: Column(
                        //crossAxisAlignment:  CrossAxisAlignment.start,
                        children: [
                          CheckboxListTile(
                            title: Text('Credit card', style: TextStyle(fontWeight: FontWeight.w500)),
                              value: creditCardSelected,
                              activeColor: Colors.black54,
                              onChanged: (value) {
                            setState(() {
                              googlePaySelected = false;
                              applePaySelected = false;
                              paypalSelected = false;
                              creditCardSelected = value;
                              if (value == true) {
                                extentSliver = extentSliver + 235;
                              } else {
                                extentSliver = extentSliver - 235;
                              }

                            });

                          }

                          ),
                          Divider(
                            color: Colors.brown[100],
                            thickness: 1,
                          ),
                          Container(child: creditCardSelected == false ? Container() : Container(
                            height: 260,
                            width: 800,
                            color: Colors.transparent,
                            child: Form(
                              key: _formKeyForCred,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[

                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      child: TextFormField(
                                        controller: textControllerForCredNumber,
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                            borderSide: BorderSide(
                                              color: Colors.black12,
                                            ),
                                          ),
                                          labelText: 'Card number',
                                          labelStyle: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 14,
                                          ),
                                        ),
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter your card number here';
                                          }

                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      child: TextFormField(
                                        controller: textControllerForCredName,
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                            borderSide: BorderSide(
                                              color: Colors.black12,
                                            ),
                                          ),
                                          labelText: 'Name on card',
                                          labelStyle: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 14,
                                          ),
                                        ),
                                        validator: (value) {

                                          if (value.isEmpty) {
                                            return 'Please enter the card name here';
                                          }


                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      child: TextFormField(
                                        controller: textControllerForCredExp,
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                            borderSide: BorderSide(
                                              color: Colors.black12,
                                            ),
                                          ),
                                          labelText: 'Expiration date (MM / YY)',
                                          labelStyle: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 14,
                                          ),
                                        ),
                                        validator: (value) {

                                          if (value.isEmpty) {
                                            return 'Please enter your expiration date here';
                                          }


                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                                    child: Container(
                                      width: 300,
                                      height: 50,
                                      child: TextFormField(
                                        controller: textControllerForCredSec,
                                        decoration: const InputDecoration(
                                          fillColor: Colors.white,
                                          filled: true,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                            borderSide: BorderSide(
                                              color: Colors.black12,
                                            ),
                                          ),
                                          labelText: 'Security code',
                                          labelStyle: TextStyle(
                                            color: Colors.black38,
                                            fontSize: 14,
                                          ),
                                        ),
                                        validator: (value) {

                                          if (value.isEmpty) {
                                            return 'Please enter your security code here';
                                          }


                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 4,),
                                  Divider(
                                    color: Colors.brown[100],
                                    thickness: 1,
                                  ),



                                ],
                              ),
                            ),
                          ),
                          ),
                          CheckboxListTile(

                              title: Container(
                                alignment: Alignment.centerLeft,

                                height: 40,
                                  width: 70,
                                  child: SvgPicture.asset('images/Apple_Pay_Mark_RGB_041619.svg', alignment: Alignment.centerLeft,)),
                              value: applePaySelected,
                              activeColor: Colors.black54,
                              onChanged: (value) {
                                setState(() {
                                  googlePaySelected = false;
                                  creditCardSelected = false;
                                  paypalSelected = false;
                                  applePaySelected = value;
                                });
                              }),
                          Divider(
                            color: Colors.brown[100],
                            thickness: 1,
                          ),
                          CheckboxListTile(
                            contentPadding: EdgeInsets.only(left: 6, right: 16),

                              title: Container(

                                  alignment: Alignment.centerLeft,

                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset('images/Google_Pay-Logo.wine.svg', alignment: Alignment.centerLeft,)),
                              value: googlePaySelected,
                              activeColor: Colors.black54,
                              onChanged: (value) {
                                setState(() {

                                  creditCardSelected = false;
                                  applePaySelected = false;
                                  paypalSelected = false;
                                  googlePaySelected = value;

                                });
                              }),
                          Divider(
                            color: Colors.brown[100],
                            thickness: 1,
                          ),
                          CheckboxListTile(
                              contentPadding: EdgeInsets.only(left: 15, right: 16),

                              title: Container(

                                  alignment: Alignment.centerLeft,

                                  height: 40,
                                  width: 40,
                                  child: SvgPicture.asset('images/PayPal.svg', alignment: Alignment.centerLeft,)),
                              value: paypalSelected,
                              activeColor: Colors.black54,
                              onChanged: (value) {
                                setState(() {

                                  creditCardSelected = false;
                                  applePaySelected = false;
                                  googlePaySelected = false;
                                  paypalSelected = value;
                                });
                              }),






                        ],
                      ),),
                    SizedBox(
                      height: 20,
                    ),

                    ///PAY NOW
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Container(
                        height: 60,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        child: FlatButton(
                          onPressed: () async {
                            if (allFormsAreCompleted == true) {
                              if (creditCardSelected == true) {
                                if (_formKeyForCred.currentState.validate()) {
                                  ///start payment with card
                                  var t = CreditCard(
                                    number: textControllerForCredNumber.text,
                                    expMonth: int.parse(
                                        textControllerForCredExp.text),
                                    expYear: int.parse(
                                        textControllerForCredExp.text) + 9,
                                    cvc: textControllerForCredSec.text,
                                  );

                                  testCard = t;
                                  print('this is testCard = $testCard');

                                  createPaymentMethodWithCard();
                                }
                              }
                              if (paypalSelected == true) {
                                var u = subtotalForCheckout.substring(
                                    1, cartSubtotal.length - 4);
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        PaypalPayment(
                                          itemName: 'Verossa Prints',
                                          itemPrice: '$u',
                                          itemQuantity: 1,
                                          standardShipping: standardShipping,
                                          onFinish: (number) async {
                                            // payment done
                                            print('order id: ' + number);
                                          },
                                        ),
                                  ),
                                );
                              }
                              if (applePaySelected == true) {
                                checkIfNativePayReady();
                              }
                              if (googlePaySelected == true) {
                                checkIfNativePayReady();
                              }
                              orderNumber = randomNumber.nextInt(10000);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => ShowDialogToDismiss(
                                      title: 'Please fill in the shipping details',
                                      content:
                                      '',
                                      buttonText: 'CLOSE'));


                            }




                          },
                          child: Text(
                            'PAY NOW',
                            style: TextStyle(
                                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 130.0),
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('homePage');
                          },
                          child: Row(
                            children: [
                              Icon(Icons.keyboard_arrow_left),
                              Text('Return to home')

                            ],
                          ),
                        ),
                      ),
                    ),





                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ShowDialogToDismiss extends StatelessWidget {
  final String content;
  final String title;
  final String buttonText;
  ShowDialogToDismiss({this.title, this.buttonText, this.content});
  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return AlertDialog(
        title: new Text(
          title,
        ),
        content: new Text(
          this.content,
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text(
              buttonText,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    } else {
      return CupertinoAlertDialog(
          title: Text(
            title,
          ),
          content: new Text(
            this.content,
          ),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: new Text(
                buttonText[0].toUpperCase() +
                    buttonText.substring(1).toLowerCase(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ]);
    }
  }
}
