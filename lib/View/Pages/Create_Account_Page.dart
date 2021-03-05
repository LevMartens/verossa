import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/User_Auth/Presentation/User_Provider.dart';
import 'package:verossa/View/Widgets/Bottom_Section_Widget.dart';
import 'package:verossa/View/Widgets/Left_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Right_Drawer_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Small_Widgets/Verossa_Logo.dart';
import 'package:verossa/View/Widgets/App_Bar_Widget.dart';

class CreateAccount extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<CreateAccount> {

  final _scrollController = ScrollController(keepScrollOffset: false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String _firstName;
  String _lastName;
  String _email;
  String _password;
  bool circularProgressIVisible = false;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;
    return  Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VerossaAppBar(aScaffoldKey: _scaffoldKey,),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 1700,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: startScroll,),
                  FreeShippingBanner(),
                  SizedBox(height: 20,),
                  VerossaLogo(),
                  SizedBox(height: 10),

                   Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0, bottom: 0.0),
                        child: Opacity(
                          opacity: 0.9,
                          child: Container(
                            width: 300,

                            child: Text('CREATE ACCOUNT', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87), ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 50.0),
                        child: Container(
                            width: 300,
                            child: Text('First Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          height: 40,
                          width: 300,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              _firstName = value;
                            },
                            autofillHints: [AutofillHints.givenName],
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
                                  child: Text('Last Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)),
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
                            onChanged: (value) {
                              _lastName = value;
                            },
                            autofillHints: [AutofillHints.familyName],
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
                            autofillHints: [AutofillHints.email],
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
                                var response = await Provider.of<UserProvider>(context, listen: false).createNewUser(_email, _password, _firstName, _lastName);

                                if (response == 'Great Success') {

                                  Navigator.of(context)
                                      .pushReplacementNamed('personalPage');
                                  
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$response', textAlign: TextAlign.center,)));
                                  setState(() {
                                    circularProgressIVisible = false;
                                  });
                                }
                              },
                              child: circularProgressIVisible == false ? Text(
                                'SIGN UP',
                                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                              ) :  CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 120.0, top: 20, bottom: 40),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed('customerLogin');
                          },
                          child: Text('Returning Customer? Sign In →'),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  BottomSection(),
                ]),
              ),
            ]),
          ),
        ],
      ),
      drawer: RightDrawer(),
      endDrawer: LeftDrawer(),
    );
  }
}