import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'AppBar+Drawers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Create_Account_Screen.dart';
import '../Model/Global_Variables.dart';
import '../Controller/Global_Methods.dart';
import 'Personal_Page.dart';
import '../Model/Progress_Indicator.dart';
import 'package:verossa/Old_Architecture/Model/NewsLetterForms.dart';
import 'ContactUs_Page.dart';
import 'ReturnsPolicy_Page.dart';
import 'Shipping_Page.dart';
import 'AboutUs_Page.dart';

import 'package:verossa/Features/App_Bar/Presentation/App_Bar_Widget.dart';



class CustomerLogin extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<CustomerLogin>
     {
final _auth = FirebaseAuth.instance;
String email;
String password;
bool currentlyOnResetPassword = false;
final _scrollController = ScrollController(keepScrollOffset: false);
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    contextForBadgeProv = context;
  }

  @override
  Widget build(BuildContext context) {

    Widget getResetPassword(BuildContext context) {
      if(currentlyOnResetPassword == false) {


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
                    email = value;
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
                          currentlyOnResetPassword = true;

                          setState(() {

                          });
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
                    password = value;
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
                  child: FlatButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProgressIndi()),);

                      try {
                        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if (user != null) {
                          await getUserDetails();

                          Navigator.pop(context);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => PersonalPage()),);


                        } } catch (e){
                        Navigator.pop(context);
                        _scaffoldKey.currentState
                            .showSnackBar(SnackBar(content: Text('$e', textAlign: TextAlign.center,)));
                        print(e);}


                    },
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 120.0, top: 20, bottom: 40),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccount()),
                  );
                },
                child: Text('New Customer? Sign up →'),
              ),
            ),


          ],
        );
      } else {
        final _formKey1 = GlobalKey<FormState>();
        final textControllerEmail = TextEditingController();

        return Form(
          key: _formKey1,
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

                      return 'Please enter your email';

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
                child: FlatButton(
                  onPressed: () async {
                    // final User user = await auth.currentUser;
                    // final uid = user.uid;
                    if (_formKey1.currentState.validate()) {
                      
                      auth.sendPasswordResetEmail(email: textControllerEmail.text);







                      currentlyOnResetPassword = false;


                      setState(() {


                      });




                      _scaffoldKey.currentState
                          .showSnackBar(SnackBar(content: Text('Password reset email sent, please check your inbox', textAlign: TextAlign.center,)));
                      _formKey1.currentState.reset();

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
                    currentlyOnResetPassword = false;

                    setState(() {

                    });
                  },
                  child: Text('or Cancel', style: TextStyle(),),
                ),
              ),
            ],
          ),
        );

      }
    }
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;
    return  Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VerossaAppBar(aScaffoldKey: _scaffoldKey,),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 1550,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: startScroll,),
                  Container(
                    child: Center(
                      child: Text(
                        'FREE SHIPPING ON ORDERS OVER \$150',
                        style: TextStyle(
                            color: Colors.white60, fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Colors.black,
                    height: 25,
                    width: 900,
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Container(
                        child: Center(
                          child: Text('VERØSSA', textAlign: TextAlign.center, style: TextStyle(letterSpacing: 4,fontFamily: 'Cormorant',fontWeight: FontWeight.w600, fontSize: 35),),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text('VALLEY', textAlign: TextAlign.center, style: TextStyle(letterSpacing: 4,fontFamily: 'Cormorant',fontWeight: FontWeight.w600, fontSize: 35),),
                        ),
                      ),
                      Container(

                        child: Center(
                          child: Text('PHOTOGRAPHY', textAlign: TextAlign.center, style: TextStyle(letterSpacing: 4,fontFamily: 'Cormorant',fontWeight: FontWeight.w600, fontSize: 20),),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  getResetPassword(context),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 58.0),
                      child: Text('MORE INFO', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 58 ,
                    endIndent: 58,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {

                              Navigator.of(context).pushReplacement(PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 200),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                      ContactUs()));
                              _scrollController.jumpTo(0);
                            },
                            child: Container(
                              child: Text(
                                'Contact Us',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              height: 25,
                              width: 100,

                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {

                              Navigator.of(context).pushReplacement(PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 200),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                      AboutUs()));
                              _scrollController.jumpTo(0);
                            },
                            child: Container(
                              child: Text(
                                'About Us',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              height: 25,
                              width: 100,

                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {

                              Navigator.of(context).pushReplacement(PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 200),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                      ReturnsPolicy()));
                              _scrollController.jumpTo(0);
                            },
                            child: Container(
                              child: Text(
                                'Returns Policy',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              height: 25,
                              width: 100,

                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {

                              Navigator.of(context).pushReplacement(PageRouteBuilder(
                                  transitionDuration: Duration(milliseconds: 200),
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) =>
                                      Shipping()));
                              _scrollController.jumpTo(0);
                            },
                            child: Container(
                              child: Text(
                                'Shipping',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              height: 25,
                              width: 100,

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 58.0),
                      child: Text('FOLLOW US', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 58 ,
                    endIndent: 58,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Container(

                          alignment: Alignment.centerLeft,

                          child: GestureDetector(

                            onTap: () {

                              launchURL('https://www.instagram.com/levmartens/');
                            },
                            child: Container(



                              child: Text(
                                'Instagram',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              height: 25,
                              width: 100,

                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Container(
                          alignment:  Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {


                              launchURL('https://www.linkedin.com/in/levmartens/?locale=en_US');

                            },
                            child: Container(
                              child: Text(
                                'Linkedin',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              height: 25,
                              width: 100,

                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              launchURL('https://www.facebook.com/lcmartens');
                            },
                            child: Container(
                              child: Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Colors.black87,
                                ),
                              ),
                              height: 25,
                              width: 100,

                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 14.0, left: 45.0),
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                launchURL('https://www.facebook.com/lcmartens');
                              },
                              child: Container(
                                child: Icon(MdiIcons.facebook),
                                height: 25,
                                width: 50,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                launchURL('https://www.instagram.com/levmartens/');
                              },
                              child: Container(
                                child: Icon(MdiIcons.instagram),
                                height: 25,
                                width: 50,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Container(
                      child: Center(
                        child: Image(
                          image: AssetImage('images/IMG_1368.jpg'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  NewsLetterFormForLogIn(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 57.0, bottom: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                'Pick a currency',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 300,
                            child: CupertinoPicker(
                              itemExtent: 32,

                              onSelectedItemChanged: (selectedIndex) async {


                                await getCurrencyData(selectedIndex);

                                setState(() {

                                });

                              },
                              children: [
                                Text('AUD'),
                                Text('USD'),
                                Text('CAD'),
                                Text('INR'),
                                Text('GBP'),
                                Text('EUR'),
                                Text('JPY'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Container(
                      child: Center(
                        child: Image(
                          image: AssetImage('images/IMG_1394.jpg'),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ]),
          ),
        ],
      ),
      drawer: MyDrawer(aScaffoldKey: _scaffoldKey,),
      endDrawer: MyEndDrawer(),
    );
  }


}