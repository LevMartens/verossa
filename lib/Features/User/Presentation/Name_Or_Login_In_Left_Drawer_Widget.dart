import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/User/Presentation/User_Provider.dart';

class NameOrLogin extends StatefulWidget {
  @override
  _NameOrLoginState createState() => _NameOrLoginState();
}

class _NameOrLoginState extends State<NameOrLogin> {
  @override
  Widget build(BuildContext context) {


    User currentUser = Provider.of<UserProvider>(context, listen: true).currentUser;
    Map<String,String> currentUserDetails = Provider.of<UserProvider>(context, listen: true).currentUserDetailsMap;
    String  _fullName = currentUserDetails['fullName'];


    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 5),
          child: GestureDetector(
            onTap: () async {
              if (currentUser != null) {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed('personalPage');

              } else {
                Navigator.pop(context);
                Navigator.of(context).pushReplacementNamed('customerLogin');
              }
            },
            child: Container(
              height: 40,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(_fullName == null ? 'Log in' : _fullName,

                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(height: 0, indent: 20, color: Colors.black26,),
        Container(
          child: currentUser == null ? Container() : Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: GestureDetector(
                onTap: () async {

                  var response = await Provider.of<UserProvider>(context, listen: false).logOutUser();

                  if (response == 'Great Success') {
                    Navigator.pop(context);
                    Navigator.of(context)
                        .pushReplacementNamed('/');
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Successfully logged out ', textAlign: TextAlign.center,)));


                  } else {
                    print('response $response');
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(response, textAlign: TextAlign.center,)));
                  }


                },
                child: Container(
                  height: 40,

                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(

                      'Log Out',
                      style: TextStyle(

                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
