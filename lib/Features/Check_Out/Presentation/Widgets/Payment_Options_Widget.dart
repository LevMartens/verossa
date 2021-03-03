import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Core/Util/DialogToDismiss.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Injection_Container.dart' as di;

import '../Check_Out_Provider.dart';

class PaymentOptions extends StatefulWidget {
  @override
  _PaymentOptionsState createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();
  final _textControllerForCredNumber = TextEditingController();
  final _textControllerForCredName = TextEditingController();
  final _textControllerForCredExpM = TextEditingController();
  final _textControllerForCredExpY = TextEditingController();
  final _textControllerForCredSec = TextEditingController();
  bool creditCardSelected = false;
  bool applePaySelected = false;
  bool googlePaySelected = false;
  bool paypalSelected = false;
  @override
  Widget build(BuildContext context) {
    double extendSliver = Provider.of<CheckOutProvider>(context, listen: true).extentSliver;
    bool allFormsAreCompleted = Provider.of<CheckOutProvider>(context, listen: true).allFormsAreCompleted;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          height: creditCardSelected == true ? 540 : 280,
          width: di.sl<DidFinishLaunchingWithOptions>().screenWidth -30,
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
                        Provider.of<CheckOutProvider>(context, listen: false).extendSliverWith(extendSliver + 235);
                        Provider.of<CheckOutProvider>(context, listen: false).notifyCheckOutListeners();
                      } else {
                        Provider.of<CheckOutProvider>(context, listen: false).extendSliverWith(extendSliver - 235);
                        Provider.of<CheckOutProvider>(context, listen: false).notifyCheckOutListeners();
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
                  key: _form,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                        child: Container(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            controller: _textControllerForCredNumber,
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
                            controller: _textControllerForCredName,
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
                                return 'Please enter your name here';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: TextFormField(
                                controller: _textControllerForCredExpM,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                  ),
                                  labelText: 'Expiration month (MM)',
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your expiration month here';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                            child: Container(
                              width: 50,
                              height: 50,
                              child: TextFormField(
                                controller: _textControllerForCredExpY,
                                decoration: const InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(7)),
                                    borderSide: BorderSide(
                                      color: Colors.black12,
                                    ),
                                  ),
                                  labelText: 'Expiration year (YY)',
                                  labelStyle: TextStyle(
                                    color: Colors.black38,
                                    fontSize: 14,
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your expiration year here';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5),
                        child: Container(
                          width: 300,
                          height: 50,
                          child: TextFormField(
                            controller: _textControllerForCredSec,
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
              ),),
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
        SizedBox(height: 20),
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
            child: TextButton(
              onPressed: () async {
                if (allFormsAreCompleted == true) {
                  if (creditCardSelected == true) {
                    if (_form.currentState.validate()) {
                      var cardNumber = _textControllerForCredNumber.text;
                      var expMonth = _textControllerForCredExpM.text;
                      var expYear = _textControllerForCredExpY.text;
                      var cvc = _textControllerForCredSec.text;
                      var nameOnCard = _textControllerForCredName.text;
                      var response = await Provider.of<CheckOutProvider>(context, listen: false).payWithCreditCard(cardNumber, expMonth, expYear, cvc, nameOnCard);

                      if (response == 'Error') {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => ShowDialogToDismiss(
                                title: 'Error',
                                content:
                                'It is not possible to pay with this card. Please try again with a different card',
                                buttonText: 'CLOSE'));
                      }
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
      ],
    );
  }
}
