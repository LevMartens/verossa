import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Features/Check_Out/Presentation/Widgets/Small_Widgets/Contact_TextFormFields_Widget.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import 'package:verossa/Features/User_Auth/Presentation/User_Provider.dart';
import 'package:verossa/Injection_Container.dart' as di;

import '../Check_Out_Provider.dart';

class UserIsLoggedInForm extends StatefulWidget {
  @override
  _UserIsLoggedInFormState createState() => _UserIsLoggedInFormState();
}

class _UserIsLoggedInFormState extends State<UserIsLoggedInForm> {



  static final _formKeyContact = GlobalKey<FormState>();
  static final _formKeyShip = GlobalKey<FormState>();


  final textControllerForShipEmail = TextEditingController();
  final textControllerForShipFistName = TextEditingController();
  final textControllerForShipLastName = TextEditingController();
  final textControllerForShipAddress = TextEditingController();
  final textControllerForShipApartment = TextEditingController();
  final textControllerForShipSuburb = TextEditingController();
  final textControllerForShipCountry = TextEditingController();
  final textControllerForShipState = TextEditingController();
  final textControllerForShipPostcode = TextEditingController();

  @override
  Widget build(BuildContext context) {

    Map<String,String> currentUserDetailsMap = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;
    bool freeShipping = Provider.of<CheckOutProvider>(context, listen: true).freeShipping;
    bool standardShipping = Provider.of<CheckOutProvider>(context, listen: true).standardShipping;
    String totalPriceForSummary = Provider.of<PricesProvider>(context, listen: true).totalPriceForCheckOutSummary;
    bool allFormsAreCompleted = Provider.of<CheckOutProvider>(context, listen: true).allFormsAreCompleted;
    double containerHeightWhenUserLoggedInAndFormShowing = Provider.of<CheckOutProvider>(context, listen: true).containerHeightWhenUserLoggedInAndFormShowing;

    return Container(
      height: currentUserDetailsMap['address'] != null ? 200 : containerHeightWhenUserLoggedInAndFormShowing,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ContactTextFormFields(),
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
                      allFormsAreCompleted = false;
                      currentUserDetailsMap['address'] = null;
                      Provider.of<UserProvider>(context, listen: false).temporaryChangeInUserDetails(currentUserDetailsMap);
                  },
                  child: currentUserDetailsMap['address'] != null ? Text('Change') : Container(),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 6, right: 15),
            child: GestureDetector(
                child: currentUserDetailsMap['address'] != null ?
                Text('${currentUserDetailsMap['apartment']} ${currentUserDetailsMap['address']}, ${currentUserDetailsMap['place']}, ${currentUserDetailsMap['postcode']}, ${currentUserDetailsMap['state']}')
                    : Container(
                  height: 440,
                  width: 400,
                  color: Colors.transparent,
                  child: Form(
                    key: _formKeyShip,
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
                            child: TextButton(
                              onPressed: () {
                                if (_formKeyShip.currentState.validate()) {
                                    allFormsAreCompleted = true;
                                    containerHeightWhenUserLoggedInAndFormShowing = 620;
                                    currentUserDetailsMap['address'] = textControllerForShipAddress.text;
                                    currentUserDetailsMap['apartment'] = textControllerForShipApartment.text;
                                    currentUserDetailsMap['place'] = textControllerForShipSuburb.text;
                                    currentUserDetailsMap['country'] = textControllerForShipCountry.text;
                                    currentUserDetailsMap['state'] = textControllerForShipState.text;
                                    currentUserDetailsMap['state'] = textControllerForShipPostcode.text;
                                    currentUserDetailsMap['email'] = textControllerForShipEmail.text;
                                    Provider.of<UserProvider>(context, listen: false).temporaryChangeInUserDetails(currentUserDetailsMap);
                                    Provider.of<UserProvider>(context, listen: false).setCurrentUserDetailsToFB(currentUserDetailsMap);
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
                    if (standardShipping == true ){
                      Provider.of<CheckOutProvider>(context, listen: false).setStandardShippingTo(false);
                      Provider.of<CheckOutProvider>(context, listen: false).setExpressShippingTo(true);
                      Provider.of<CheckOutProvider>(context, listen: false).setTotalPriceForSummary(context);
                    } else {
                      Provider.of<CheckOutProvider>(context, listen: false).setStandardShippingTo(true);
                      Provider.of<CheckOutProvider>(context, listen: false).setExpressShippingTo(false);
                      Provider.of<CheckOutProvider>(context, listen: false).setTotalPriceForSummary(context);
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
      ),);
  }
}
