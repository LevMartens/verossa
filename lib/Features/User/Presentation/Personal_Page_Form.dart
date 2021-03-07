import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/User/Presentation/User_Provider.dart';
import 'User_Provider.dart';

class PersonalPageForm extends StatefulWidget {
  @override
  _PersonalPageFormState createState() => _PersonalPageFormState();
}

class _PersonalPageFormState extends State<PersonalPageForm> {

  double containerHeight = 580;

  final textControllerStreet = TextEditingController();
  final textControllerPlace = TextEditingController();
  final textControllerPostcode = TextEditingController();
  final textControllerCountry = TextEditingController();
  final textControllerApartment = TextEditingController();
  final textControllerState = TextEditingController();

  final validate = ValidationBuilder().minLength(5, 'not valid').maxLength(30).build();
  @override
  Widget build(BuildContext context) {
    Map<String,String> currentUserDetails = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;
    containerHeight = Provider.of<UserProvider>(context, listen: true).containerHeightForPersonalPage;
    return Container(
      height: containerHeight,
      width: 400,
      color: Colors.transparent,
      child: Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Container(
                height: 30,
                width: 300,
                child: Text(
                  'Address',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    height: 2,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Center(
            child: Container(
              height: 40,
              width: 300,
              child: TextFormField(
                maxLines: 1,
                controller: textControllerStreet,
                autofillHints: [AutofillHints.fullStreetAddress],
                decoration: const InputDecoration(
                  hintText: 'Address',
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Container(
                height: 30,
                width: 300,
                child: Text(
                  'Apartment',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    height: 2,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Container(
              height: 40,
              width: 300,
              child: TextFormField(
                maxLines: 1,
                controller: textControllerApartment,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  hintText: 'Apartment, suite, etc.(optional)',
                  hintStyle: TextStyle(fontSize: 12,  color: Colors.black26), //height: 0.5,
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Container(
                height: 30,
                width: 300,
                child: Text(
                  'Place/Suburb',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    height: 2,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Container(
              height: 40,
              width: 300,
              child: TextFormField(
                maxLines: 1,
                controller: textControllerPlace,
                autofillHints: [AutofillHints.addressCity],
                decoration: const InputDecoration(
                  hintText: 'Suburb',
                  hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Container(
                height: 30,
                width: 300,
                child: Text(
                  'Postcode',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    height: 2,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Container(
              height: 40,
              width: 300,
              child: TextFormField(
                maxLines: 1,
                controller: textControllerPostcode,
                autofillHints: [AutofillHints.postalCode],
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  hintText: 'Postcode',
                  hintStyle: TextStyle(fontSize: 12, color: Colors.black26),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Container(
                height: 30,
                width: 300,
                child: Text(
                  'Country',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    height: 2,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Container(
              height: 40,
              width: 300,
              child: TextFormField(
                maxLines: 1,
                controller: textControllerCountry,
                autofillHints: [AutofillHints.countryName],
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  hintText: 'Country/Region',
                  hintStyle: TextStyle(fontSize: 12,  color: Colors.black26),
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Container(
                height: 30,
                width: 300,
                child: Text(
                  'State',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    height: 2,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: Container(
              height: 40,
              width: 300,
              child: TextFormField(
                maxLines: 1,
                controller: textControllerState,
                autofillHints: [AutofillHints.addressState],
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  hintText: 'State/territory',
                  hintStyle: TextStyle(fontSize: 12,  color: Colors.black26),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
          Center(
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
                onPressed: () async {

                  if (validate(textControllerStreet.text) == null &&
                      validate(textControllerPostcode.text) == null &&
                      validate(textControllerPlace.text) == null &&
                      validate(textControllerCountry.text) == null) {

                    currentUserDetails['address'] = textControllerStreet.text;
                    currentUserDetails['place'] = textControllerPlace.text;
                    currentUserDetails['postcode'] = textControllerPostcode.text;
                    currentUserDetails['apartment'] = textControllerApartment.text;
                    currentUserDetails['country'] = textControllerCountry.text;
                    currentUserDetails['state'] = textControllerState.text;
                    await Provider.of<UserProvider>(context, listen: false).setCurrentUserDetailsToFB(currentUserDetails);
                    Provider.of<UserProvider>(context, listen: false).temporaryChangeInUserDetails(currentUserDetails);
                    Provider.of<UserProvider>(context, listen: false).setContainerHeightPersonalPage(300);
                    Provider.of<UserProvider>(context, listen: false).setCurrentlyOnChangeDetailsTo(true);

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Address saved', textAlign: TextAlign.center,)));
                  }
                },
                child: Text(
                  'SAVE',
                  style: TextStyle(
                      color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    );
  }
}
