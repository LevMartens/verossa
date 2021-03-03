import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/User_Auth/Presentation/User_Provider.dart';
import '../../Check_Out_Provider.dart';

class ShippingTextFormFields extends StatefulWidget {
  @override
  _ShippingTextFormFieldsState createState() => _ShippingTextFormFieldsState();
}

class _ShippingTextFormFieldsState extends State<ShippingTextFormFields> {
  final validate = ValidationBuilder().minLength(5, 'This field can\'t be empty').maxLength(20).build();
  final textControllerForShipAddress = TextEditingController();
  final textControllerForShipApartment = TextEditingController();
  final textControllerForShipSuburb = TextEditingController();
  final textControllerForShipCountry = TextEditingController();
  final textControllerForShipState = TextEditingController();
  final textControllerForShipPostcode = TextEditingController();
  final textControllerForShipEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String,String> currentUserDetailsMap = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;

    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 13),
        child: Row(
          children: [
            Text('Ship to', style: TextStyle(fontWeight: FontWeight.w300),),
            Spacer(),
            GestureDetector(
              onTap: () {
                Provider.of<CheckOutProvider>(context, listen: false).setAllFormsAreCompleted(false);
                currentUserDetailsMap['address'] = null;
                Provider.of<UserProvider>(context, listen: false).temporaryChangeInUserDetails(currentUserDetailsMap);
                Provider.of<CheckOutProvider>(context, listen: false).notifyCheckOutListeners();
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
                           if (validate(textControllerForShipAddress.text) == null && validate(textControllerForShipCountry.text) == null) {
                             Provider.of<CheckOutProvider>(context, listen: false)
                                 .setAllFormsAreCompleted(true);
                             Provider.of<CheckOutProvider>(context, listen: false)
                                 .setContainerHeightWhenUserLoggedInAndFormShowing(620);
                             currentUserDetailsMap['address'] =
                                 textControllerForShipAddress.text;
                             currentUserDetailsMap['apartment'] =
                                 textControllerForShipApartment.text;
                             currentUserDetailsMap['place'] =
                                 textControllerForShipSuburb.text;
                             currentUserDetailsMap['country'] =
                                 textControllerForShipCountry.text;
                             currentUserDetailsMap['state'] =
                                 textControllerForShipState.text;
                             currentUserDetailsMap['state'] =
                                 textControllerForShipPostcode.text;
                             currentUserDetailsMap['email'] =
                                 textControllerForShipEmail.text;
                             Provider.of<UserProvider>(context, listen: false)
                                 .temporaryChangeInUserDetails(
                                 currentUserDetailsMap);
                             Provider.of<UserProvider>(context, listen: false)
                                 .setCurrentUserDetailsToFB(
                                 currentUserDetailsMap);
                             Provider.of<CheckOutProvider>(context, listen: false)
                                 .notifyCheckOutListeners();
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
            )
        ),
      ),
    ],
    );
  }
}
