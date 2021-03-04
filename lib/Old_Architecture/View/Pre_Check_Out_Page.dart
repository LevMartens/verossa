//import 'dart:html';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Util/DialogToDismiss.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Features/Check_Out/Presentation/Check_Out_Provider.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Drop_Down_Summary_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Payment_Options_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Discount_Applied_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Discount_Field_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Summary_Subtotal_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Summary_Total_Widget.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/CheckOut_Details_From_Widget.dart';
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

int amount = 0;
bool showSpinner = false;
String url ='https://us-central1-demostripe-b9557.cloudfunctions.net/StripePI';
String apiBase = 'https://api.stripe.com';
String paymentApiUrl = '$apiBase';



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
    double extendSliver = Provider.of<CheckOutProvider>(context, listen: true).extentSliver;
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
            itemExtent: street != null ? 1080 + extendSliver : 1680 + extendSliver,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    VerossaLogo(),
                    SizedBox(height: 25),
                    DDSummary(summaryDDItems: summaryDDItems),
                    SizedBox(height: 20),
                    CheckOutDetailsForm(),
                    SizedBox(height: 20),
                    Container(
                      width: di.sl<DidFinishLaunchingWithOptions>().screenWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Gift card or discount code', style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                        )),
                    SizedBox(height: 10),
                    DiscountField(),
                    SizedBox(height: 20),
                    Container(
                        width: di.sl<DidFinishLaunchingWithOptions>().screenWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('Payment', style: TextStyle(fontSize: 20),textAlign: TextAlign.left,),
                        )),
                    Container(
                        width: di.sl<DidFinishLaunchingWithOptions>().screenWidth,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text('All transactions are secure and encrypted', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),textAlign: TextAlign.left,),
                        )),
                    SizedBox(height: 20,),
                    PaymentOptions(),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(left: 130.0),
                      child: Container(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed('/');
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


