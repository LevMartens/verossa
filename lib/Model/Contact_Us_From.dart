import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Global_Variables.dart';

class ContactUsForm extends StatefulWidget {
  @override
  ContactUsFormState createState() {
    return ContactUsFormState();
  }
}

class ContactUsFormState extends State<ContactUsForm> {



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textControllerEmail = TextEditingController();
    final textControllerName = TextEditingController();
    final textControllerMessage = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: Container(
              height: 30,
              width: 300,

              child: Text(
                'Name'

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
              controller: textControllerName,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Name',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                ),
              ),

              validator: (value) {

                if (value.isEmpty) {

                  return 'Please enter your name';

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
                'Email'

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
              controller: textControllerEmail,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                ),
              ),

              validator: (value) {

                if (value.isEmpty) {

                  return 'Please enter your Email';

                }

                if (value.contains('@') == false) {

                  return 'Email not valid';

                }
                if (value.contains('.') == false) {

                  return 'Email not valid';

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
                'Message'

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
              height: 120,
              width: 300,
              child: TextFormField(

                textAlignVertical: TextAlignVertical.top,
                maxLines: 3,
                controller: textControllerMessage,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    ),
                  ),
                  hintText: 'Message',
                  hintStyle: TextStyle(fontSize: 14, height: 0.5, color: Colors.black38),

                  ),
                ),

              ),
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
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firestore.collection("ClientMessages").add({
                    textControllerName.text: 'From ${textControllerEmail.text} : ${textControllerMessage.text} '

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey.currentState.reset();

                }
              },
              child: Text(
                'SEND',
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