import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:provider/provider.dart';
import 'User_Provider.dart';

class PasswordResetForm extends StatefulWidget {
  @override
  _PasswordResetFormState createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends State<PasswordResetForm> {
  final validate = ValidationBuilder().email('please enter a valid email').build();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0, bottom: 0.0),
            child: Opacity(
              opacity: 0.9,
              child: Container(
                width: 300,

                child: Text('CUSTOMER LOGIN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87), ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
            child: Opacity(
              opacity: 0.9,
              child: Container(
                width: 300,

                child: Text('RESET PASSWORD', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87), ),
              ),
            ),
          ),
          Divider(
            indent: 58 ,
            endIndent: 58,
            color: Colors.black,
            thickness: 0.75,
          ),
          SizedBox(height: 10),
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
              controller: _textController,
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
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 40,
            width: 300,
            child: Text(
              'We will send you an email to reset your password.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
                color: Colors.black87,
              ),
            ),),
          SizedBox(height: 15),
          Container(
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

                // null, means value is correct
                if (validate(_textController.text) == null) {
                  
                  Provider.of<UserProvider>(context, listen: false).resetPassword(_textController.text);
                  _textController.text = '';

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Password reset email sent, please check your inbox', textAlign: TextAlign.center,)));
                  
                  Provider.of<UserProvider>(context, listen: false).setCurrentlyOnResetPasswordTo(false);
                }
              },
              child: Text(
                'SUBMIT',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            height: 30,
            width: 300,
            child: GestureDetector(
              onTap: () {
                Provider.of<UserProvider>(context, listen: false).setCurrentlyOnResetPasswordTo(false);
              },
              child: Text('or Cancel', style: TextStyle(),),
            ),
          ),
        ],
      ),
    );
  }
}
