import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Controller/Global_Methods.dart';
import 'Global_Variables.dart';
import 'package:verossa/Model/Global_Variables.dart';








class PersonalForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> aScaffoldKey;
  PersonalForm({this.aScaffoldKey});
  @override
  PersonalFormState createState() {
    return PersonalFormState(aScaffoldKey: aScaffoldKey);
  }
}

class PersonalFormState extends State<PersonalForm> {
  final GlobalKey<ScaffoldState> aScaffoldKey;
  PersonalFormState({this.aScaffoldKey});
  bool apartmentIsNull = true;
  double containerHeight = 580;
  double apartmentHeight() {
    if (apartmentIsNull == false) {return 30;} else {return 0;}

  }
  double apartmentHeightForSizedBox() {
    if (apartmentIsNull == false) {return 8;} else {return 0;}

  }
  static final _formKey112 = GlobalKey<FormState>();
  final textControllerStreet = TextEditingController();
  final textControllerPlace = TextEditingController();
  final textControllerPostcode = TextEditingController();
  final textControllerCountry = TextEditingController();
  final textControllerApartment = TextEditingController();
  final textControllerState = TextEditingController();
  ModalRoute _mountRoute;


  @override
  void didChangeDependencies() {
    _mountRoute ??= ModalRoute.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _formKey112.currentState?.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final formKey = _mountRoute == ModalRoute.of(context)
        ? _formKey112
        : GlobalKey<FormState>();//Key('hack-to-dispose-of-will-pop-callback');






    return Container(
      height: containerHeight,
      width: 400,
      color: Colors.transparent,
      child: street != null ? Column(
        children: [
          SizedBox(height: apartmentHeightForSizedBox()),
          Container(
              height: apartmentHeight(),
              width: 300,

              child: Text(
                '$apartment'
                , textAlign: TextAlign.left,
                style: TextStyle(
                  height: 2,
                  color: Colors.black87,
                    fontSize: 17,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),

          SizedBox(height: 8),
          Container(
            height: 30,
            width: 300,

            child: Text(
              '$street'
              , textAlign: TextAlign.left,
              style: TextStyle(
                height: 2,
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 30,
            width: 300,

            child: Text(
              '$place'
              , textAlign: TextAlign.left,
              style: TextStyle(
                height: 2,
                color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 30,
            width: 300,

            child: Text(
              '$postcode'
              , textAlign: TextAlign.left,
              style: TextStyle(
                height: 2,
                color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 30,
            width: 300,

            child: Text(
              '$country'
              , textAlign: TextAlign.left,
              style: TextStyle(
                height: 2,
                color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            height: 30,
            width: 300,

            child: Text(
              '$state'
              , textAlign: TextAlign.left,
              style: TextStyle(
                height: 2,
                color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
          SizedBox(height: 30),


          Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: FlatButton(
              onPressed: () async {




                setState(() {
                  street = null;
                  place = null;
                  postcode = null;
                  country = null;
                  state = null;
                  apartment = null;
                  containerHeight = 580;


                });

              },
              child: Text(
                'CHANGE ADDRESS',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ),
          ),

        ],
      ) : Form(
        key: formKey,
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
                    'Address'

                    ,
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

                  validator: (value) {

                    if (value.isEmpty) {

                      return 'Please enter your address here';

                    }


                    return null;
                  },
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
                    'Apartment'

                    ,
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

                  //textAlignVertical: TextAlignVertical.top,
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
                    'Suburb'

                    ,
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

                  validator: (value) {

                    if (value.isEmpty) {

                      return 'Please enter your suburb here';

                    }


                    return null;
                  },
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
                    'Postcode'

                    ,
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

                  //textAlignVertical: TextAlignVertical.top,
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
                  validator: (value) {

                    if (value.isEmpty) {

                      return 'Please enter your postcode here';

                    }


                    return null;
                  },
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
                    'Country'

                    ,
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

                  //textAlignVertical: TextAlignVertical.top,
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
                  validator: (value) {

                    if (value.isEmpty) {

                      return 'Please enter your country here';

                    }


                    return null;
                  },
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
                    'State'

                    ,
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

                  //textAlignVertical: TextAlignVertical.top,
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
                  validator: (value) {

                    if (value.isEmpty) {

                      return 'Please enter your state here';

                    }


                    return null;
                  },
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
                child: FlatButton(
                  onPressed: () async {

                    if (_formKey112.currentState.validate()) {
                      street = textControllerStreet.text;
                      place = textControllerPlace.text;
                      postcode = textControllerPostcode.text;
                      apartment = textControllerApartment.text;
                      country = textControllerCountry.text;
                      state = textControllerState.text;
                      containerHeight = 300;



                      setState(() {
                        street = textControllerStreet.text;
                        place = textControllerPlace.text;
                        postcode = textControllerPostcode.text;
                        apartment = textControllerApartment.text;
                        country = textControllerCountry.text;
                        state = textControllerState.text;
                        containerHeight = 300;
                      });

                      addShippingDetailsToFireStore();


                      aScaffoldKey.currentState
                          .showSnackBar(SnackBar(content: Text('Address saved', textAlign: TextAlign.center,)));
                      _formKey112.currentState.reset();

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