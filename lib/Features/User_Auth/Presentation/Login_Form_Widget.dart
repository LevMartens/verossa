import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'User_Provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String _email;
  String _password;
  bool circularProgressIVisible = false;
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
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
        Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Container(
              width: 300,
              child: Text('Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 40,
            width: 300,
            child: TextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                _email = value;
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Padding(
            padding: const EdgeInsets.only(left: 57.0),
            child: Row(
              children: [
                Container(

                    child: Text('Password', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                Padding(
                  padding: const EdgeInsets.only(left: 75.0),
                  child: GestureDetector(
                    onTap: () {
                      Provider.of<UserProvider>(context, listen: false).setCurrentlyOnResetPasswordTo(true);
                    },
                    child: Text('Forgot your password?', style: TextStyle(fontStyle: FontStyle.italic),),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            height: 40,
            width: 300,
            child: TextFormField(
              obscureText: true,
              onChanged: (value) {
                _password = value;
              },
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Opacity(
            opacity: 0.75,
            child: Container(
              height: 40,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: TextButton(
                onPressed: () async {
                  setState(() {
                    circularProgressIVisible = true;
                  });

                  final response = await Provider.of<UserProvider>(context, listen: false).loginUser(_email, _password);

                  if (response != 'Great Success') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$response', textAlign: TextAlign.center,)));
                    setState(() {
                      circularProgressIVisible = false;
                    });
                  } else {
                    Navigator.of(context)
                        .pushReplacementNamed('personalPage');
                  }
                },
                child: circularProgressIVisible == false ? Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                ) : CircularProgressIndicator(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 120.0, top: 20, bottom: 40),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed('createAccount');
            },
            child: Text('New Customer? Sign up →'),
          ),
        ),
      ],
    );
  }
}
