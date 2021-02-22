import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';
import 'package:verossa/Old_Architecture/View/Item_Detail_Screens.dart';
import 'package:verossa/Old_Architecture/View/AppBar+Drawers.dart';
import 'package:verossa/Old_Architecture//Model/Global_Variables.dart';
import 'package:verossa/Old_Architecture//Controller/Global_Methods.dart';
import 'package:share/share.dart';
import 'package:verossa/Old_Architecture/Model/NewsLetterForms.dart';
import 'package:verossa/Old_Architecture/View/ContactUs_Page.dart';
import 'package:verossa/Old_Architecture/View/AboutUs_Page.dart';
import 'package:verossa/Old_Architecture/View/ReturnsPolicy_Page.dart';
import 'package:verossa/Old_Architecture/View/Shipping_Page.dart';

import 'package:verossa/View/Widgets/App_Bar_Widget.dart';
import 'package:verossa/View/Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Verossa_Logo.dart';

class ItemPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<ItemPage> {




  final _scrollController = ScrollController(keepScrollOffset: false);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();




  @override
  void initState() {
    super.initState();
    contextForBadgeProv = context;


  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    double startScroll = kToolbarHeight + MediaQuery.of(context).padding.top;



    String priceItem1 = currency['item1Small'];
    String priceItem2 = currency['item2Small'];
    String priceItem3 = currency['item3Small'];
    String priceItem4 = currency['item4Small'];
    String priceItem5 = currency['item5Small'];
    String priceItem6 = currency['item6Small'];

    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _scaffoldKey,
      appBar: VerossaAppBar(aScaffoldKey: _scaffoldKey,),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2500,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: startScroll),
                  FreeShippingBanner(),
                  SizedBox(
                    height: 20,
                  ),
                  VerossaLogo(),
                  SizedBox(height: 10),



                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text(
                        'RELATED ITEMS',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 32,
                    endIndent: 32,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18, left: 0.0, bottom: 13, right: 10),
                        child: GestureDetector(
                          onTap: () {


                            Navigator.of(context)
                                .pushReplacementNamed('item3FromHome');

                            _scrollController.jumpTo(0);
                          },
                          child: Container(
                            height: 170,
                            width: 163,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: Container(
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image:
                                      AssetImage('images/Verossa-Heli.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Rugged Swiss',
                                        style: TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem3,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18, left: 10.0, bottom: 13, right: 0),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 4 clicked");
                            Navigator.of(context)
                                .pushReplacementNamed('item4FromHome');
                          },
                          child: Container(
                            height: 170,
                            width: 163,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: Container(
                                    color: Colors.green,
                                    height: 80,
                                    width: 163,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'images/Verossa-Field.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Estonia Spring',
                                        style: TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem4,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 0.0, bottom: 13, right: 10),
                        child: GestureDetector(
                          onTap: () {

                            Navigator.of(context)
                                .pushReplacementNamed('item5FromHome');
                            _scrollController.jumpTo(0);
                          },
                          child: Container(
                            height: 200,
                            width: 163,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: Container(
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'images/Verossa-Thunder.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Michigan Thunder',
                                        style: TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem5,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0, left: 10.0, bottom: 13, right: 0),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 6 clicked");
                            Navigator.of(context)
                                .pushReplacementNamed('item6FromHome');
                          },
                          child: Container(
                            height: 200,
                            width: 163,
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  child: Container(
                                    color: Colors.green,
                                    height: 80,
                                    width: 163,
                                    child: Image(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          'images/Verossa-Scotland.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Scotland High',
                                        style: TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem6,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 58.0),
                      child: Text(
                        'MORE INFO',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 58,
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
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 200),
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) =>
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
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 200),
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) =>
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
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 200),
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) =>
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
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      transitionDuration:
                                      Duration(milliseconds: 200),
                                      pageBuilder: (context, animation,
                                          secondaryAnimation) =>
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
                      child: Text(
                        'FOLLOW US',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 58,
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
                              launchURL(
                                  'https://www.instagram.com/levmartens/');
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
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              launchURL(
                                  'https://www.linkedin.com/in/levmartens/?locale=en_US');
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
                        padding: const EdgeInsets.only(top: 14.0, left: 45.0),
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
                                launchURL(
                                    'https://www.instagram.com/levmartens/');
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
                  SizedBox(
                    height: 10,
                  ),
                  NewsLetterFormForItem(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 57.0, bottom: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              child: Text(
                                'Pick a currency',
                                style: TextStyle(fontWeight: FontWeight.bold),
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

                                setState(() {});
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