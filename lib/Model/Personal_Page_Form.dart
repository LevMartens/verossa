import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Global_Variables.dart';
import 'package:verossa/Model/Global_Variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalForm extends StatefulWidget {
  @override
  PersonalFormState createState() {
    return PersonalFormState();
  }
}

class PersonalFormState extends State<PersonalForm> {



  @override
  Widget build(BuildContext context) {
    final _formKey1 = GlobalKey<FormState>();
    final textControllerStreet = TextEditingController();
    final textControllerPlace = TextEditingController();
    final textControllerPostcode = TextEditingController();
    return Form(
      key: _formKey1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Container(
              height: 30,
              width: 300,

              child: Text(
                'Street'

                ,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  height: 2,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
          SizedBox(height: 6),
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textControllerStreet,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Street',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                ),
              ),

              validator: (value) {

                if (value.isEmpty) {

                  return 'Please enter your street name';

                }


                return null;
              },
            ),
          ),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Container(
              height: 30,
              width: 300,

              child: Text(
                'Place'

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
          SizedBox(height: 12),
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textControllerPlace,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Place',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                ),
              ),

              validator: (value) {

                if (value.isEmpty) {

                  return 'Please enter your place';

                }


                return null;
              },
            ),
          ),
          SizedBox(height: 6),
          Padding(
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
          SizedBox(height: 8),
          Container(
            height: 40,
            width: 300,
            child: TextFormField(

              textAlignVertical: TextAlignVertical.top,
              maxLines: 1,
              controller: textControllerPostcode,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                hintText: 'Postcode',
                hintStyle: TextStyle(fontSize: 14, height: 0.5, color: Colors.black38),

              ),
            ),

          ),
          SizedBox(height: 20),
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
                final User user = await auth.currentUser;
                final uid = user.uid;
                if (_formKey1.currentState.validate()) {
                  street = textControllerStreet.text;
                  place = textControllerPlace.text;
                  postcode = textControllerPostcode.text;



                  firestore.collection("$uid").add({
                    'Street': street,
                    'Place': place,
                    'Postcode': postcode,
                  });

                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('street', street);
                  await prefs.setString('place', place);
                  await prefs.setString('postcode', postcode);

                  setState(() {

                  });






                  scaffoldKey.currentState
                      .showSnackBar(SnackBar(content: Text('Address saved', textAlign: TextAlign.center,)));
                  _formKey1.currentState.reset();

                }
              },
              child: Text(
                'SAVE',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}