import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:verossa/Model/Contact_Us_From.dart';
import 'package:verossa/Model/NewsLetterForms.dart';
import 'AppBar+Drawers.dart';
import '../Model/Global_Variables.dart';
import '../Controller/Global_Methods.dart';
import 'ReturnsPolicy_Page.dart';
import 'Shipping_Page.dart';
import 'AboutUs_Page.dart';

class ContactUs extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<ContactUs> {
  final _scrollController = ScrollController(keepScrollOffset: false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    contextForBadgeProv = context;
  }

  @override
  Widget build(BuildContext context) {
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VerossaAppBar(aScaffoldKey: _scaffoldKey,),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 1800,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0, bottom: 0.0),
                    child: Opacity(
                      opacity: 0.9,
                      child: Container(
                        width: 300,

                        child: Text('CONTACT US', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87), ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 55,
                    width: 300,

                    child: Text(
                      'Got any questions, comments or feedback?'

                      , textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 300,

                    child: Text(
                      'Send us a pigeon at 148 Canning St, Melbourne and we\'ll generally reply within 2 yottaseconds!'

                      , textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        height: 2,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  ContactUsForm(),
                  SizedBox(
                    height: 80,
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
                  NewsLetterFormForContact(),
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