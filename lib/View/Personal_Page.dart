import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Model/NewsLetterForms.dart';
import 'package:verossa/Model/Personal_Page_Form.dart';
import 'AppBar+Drawers.dart';
import '../Model/Global_Variables.dart';
import '../Controller/Global_Methods.dart';
import 'ContactUs_Page.dart';
import 'ReturnsPolicy_Page.dart';
import 'Shipping_Page.dart';
import 'AboutUs_Page.dart';
import 'package:verossa/Model/Global_Variables.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';




class PersonalPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<PersonalPage> {
  @override
  void initState() {
    super.initState();
    contextForBadgeProv = context;
    currentlyOnPersonalPage = true;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    currentlyOnPersonalPage = false;
  }

  @override
  Widget build(BuildContext context) {
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;

    Widget getStreet(BuildContext context) {




      if(street != null) {

        print('street != null');
        return Column(
          children: [
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
                ),
              ),
            ),
            SizedBox(height: 8),
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
                  street = null;
                  place = null;
                  postcode = null;

                  final prefs = await SharedPreferences.getInstance();

                  await prefs.setString('street', null);
                  await prefs.setString('place', null);
                  await prefs.setString('postcode', null);

                    setState(() {

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
        );
      } else {

        return PersonalForm();

      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: VerossaAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
            itemExtent: 1750,
            delegate: SliverChildListDelegate([

              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: startScroll),
                  Container(
                    child: Center(
                      child: Text(
                        'FREE SHIPPING ON ORDERS OVER \$150',
                        style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold),
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
                          child: Text('VALEY', textAlign: TextAlign.center, style: TextStyle(letterSpacing: 4,fontFamily: 'Cormorant',fontWeight: FontWeight.w600, fontSize: 35),),
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
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 0.0),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: 300,

                        child: Text('ACCOUNT DETAILS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87), ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: 300,

                        child: Text(fullName.toUpperCase(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87), ),
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
                  Container(
                    height: 30,
                    width: 300,

                    child: Text(
                      '$email'
                      , textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  getStreet(context),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 0.0),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: 300,

                        child: Text('ORDER HISTORY', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87), ),
                      ),
                    ),
                  ),
                  Divider(
                    indent: 58 ,
                    endIndent: 58,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 30,
                    width: 300,

                    child: Text(
                      'You haven\'t placed any orders yet'
                      , textAlign: TextAlign.left,
                      style: TextStyle(
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
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
                  NewsLetterFormForPersonal(),
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
      drawer: MyDrawer(),
      endDrawer: MyEndDrawer(),
    );


  }
}