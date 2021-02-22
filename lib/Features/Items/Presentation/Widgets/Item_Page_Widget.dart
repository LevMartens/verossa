import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Injection_Container.dart' as di;
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

import '../Item_Provider.dart';

class CartBadgeWidget extends StatefulWidget  {


  @override
  _CartBadgeWidgetState createState() => _CartBadgeWidgetState();
}

class _CartBadgeWidgetState extends State<CartBadgeWidget> {
  double opacityOne = 1.0;
  double opacityTwo = 0.8;
  double opacityThree = 0.8;
  double opacityFour = 0.8;

  bool startImageOne = false;
  bool onImageA = true;
  bool onImageB = false;
  bool onImageC = false;

  Container imageFirst;
  Container imageSecond;

  String currentlySelected = 'item1Small';

  Container a() {
    return Container(
      height: 425,
      width: 300,
      child: Image(
        image: AssetImage('images/Verossa-Fall.jpg'),
        fit: BoxFit.fill,
      ),
    );
  }

  Container b() {
    return Container(
      height: 425,
      width: 300,
      child: Image(
        image: AssetImage('images/Verossa-FallBW.jpg'),
        fit: BoxFit.fill,
      ),
    );
  }

  Container c() {
    return Container(
      height: 425,
      width: 300,
      child: Image(
        image: AssetImage('images/Verossa-FallCL.jpg'),
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    contextForBadgeProv = context;
    imageFirst = a();
    imageSecond = b();

  }

  @override
  Widget build(BuildContext context) {


    String priceItem1 = currency['item1Small'];
    String priceItem2 = currency['item2Small'];
    String priceItem3 = currency['item3Small'];
    String priceItem4 = currency['item4Small'];
    String priceItem5 = currency['item5Small'];
    String priceItem6 = currency['item6Small'];

    return ChangeNotifierProvider<ItemProvider>(
        create: (context) => di.sl<ItemProvider>(),
        child: Consumer<ItemProvider>(
            builder: (context, provider, child) => Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0, top: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacementNamed('homePage');
                          //_scrollController.jumpTo(0);
                        },
                        child: Text('Home'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('/'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text('NEW PRINTS'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('/'),
                    ),
                    Text('Montana Fall'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, top: 30.0),
                child: Center(
                  child: Container(

                    height: 230,
                    width: 360,
                    child: GestureDetector(
                      onLongPress: () {
                        Navigator.of(context).push(PageRouteBuilder(
                            transitionDuration: Duration(milliseconds: 200),
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                Item1Detail()));
                      },
                      child: FittedBox(
                        fit: BoxFit.fill,
                        child: AnimatedCrossFade(
                          firstChild: Hero(tag: 'first', child: imageFirst),
                          secondChild:
                          Hero(tag: 'second', child: imageSecond),
                          duration: Duration(milliseconds: 700),
                          crossFadeState: startImageOne
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 30),
                child: Center(
                  child: Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 23.0),
                          child: GestureDetector(
                              onTap: () {
                                if (onImageA == true) {
                                } else {
                                  onImageA = true;
                                  onImageB = false;
                                  onImageC = false;

                                  opacityOne = 1.0;
                                  opacityTwo = 0.7;
                                  opacityThree = 0.7;
                                  //opacityFour = 0.7;

                                  if (startImageOne == false) {
                                    setState(() {
                                      imageSecond = a();
                                      startImageOne = true;
                                    });
                                  } else {
                                    setState(() {
                                      imageFirst = a();
                                      startImageOne = false;
                                    });
                                  }
                                }
                              },
                              child: Opacity(
                                opacity: opacityOne,
                                child: Image(
                                  image:
                                  AssetImage('images/Verossa-Fall.jpg'),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: GestureDetector(
                              onTap: () {
                                if (onImageB == true) {
                                } else {
                                  onImageA = false;
                                  onImageB = true;
                                  onImageC = false;

                                  opacityOne = 0.7;
                                  opacityTwo = 1.0;
                                  opacityThree = 0.7;
                                  //opacityFour = 0.7;
                                  if (startImageOne == false) {
                                    setState(() {
                                      imageSecond = b();
                                      startImageOne = true;
                                    });
                                  } else {
                                    setState(() {
                                      imageFirst = b();
                                      startImageOne = false;
                                    });
                                  }
                                }
                              },
                              child: Opacity(
                                opacity: opacityTwo,
                                child: Image(
                                  image: AssetImage(
                                      'images/Verossa-FallBW.jpg'),
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: GestureDetector(
                              onTap: () {


                                if (onImageC == true) {
                                } else {
                                  onImageA = false;
                                  onImageB = false;
                                  onImageC = true;
                                  opacityOne = 0.7;
                                  opacityTwo = 0.7;
                                  opacityThree = 1.0;
                                  //opacityFour = 0.7;
                                  if (startImageOne == false) {
                                    setState(() {
                                      imageSecond = c();
                                      startImageOne = true;
                                    });
                                  } else {
                                    setState(() {
                                      imageFirst = c();
                                      startImageOne = false;
                                    });
                                  }
                                }
                              },
                              child: Opacity(
                                opacity: opacityThree,
                                child: Image(
                                  image: AssetImage(
                                      'images/Verossa-FallCL.jpg'),
                                ),
                              )),
                        ),
                      ],
                    ),
                    height: 50,
                    width: 300,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text('MONTANA FALL',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 21)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(priceItem1,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w400,
                          fontSize: 21)),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text('Effect',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Center(
                child: Container(
                  width: 360,
                  child: CupertinoPicker(
                    itemExtent: 32,
                    onSelectedItemChanged: (selectedIndex) {
                      if (selectedIndex == 0) {
                        setState(() {
                          currentlySelected = 'item1Small';
                        });
                      }
                      if (selectedIndex == 1) {
                        setState(() {
                          currentlySelected = 'item1Medium';
                        });
                      }
                      if (selectedIndex == 2) {
                        setState(() {
                          currentlySelected = 'item1Large';
                        });
                      }
                    },
                    children: [
                      Text('Original'),
                      Text('Black & White'),
                      Text('Filtered'),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
                child: FlatButton(
                  onPressed: () {
                    print("ADD $currentlySelected Tapped");

                    if (stockInCart[currentlySelected] >=
                        stockLimit[currentlySelected]) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                            'Item sold out',
                            textAlign: TextAlign.center,
                          )));
                    } else {
                      addCartItem(currentlySelected, false, context);
                    }
                  },
                  child: Text(
                    'ADD TO CART',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Text(
                      'Montana Fall is a photo taken by Valiphoto. This photo was created on November 6, 2011 and published on December 3, 2015.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w400,
                          fontSize: 17)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Text(
                      'Specs: Canon600, EF-S17-55mm f/2.8 IS USM, 35.0mm · ƒ/2.8 · 1/50s · ISO 100.',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w400,
                          fontSize: 17)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
                child: FlatButton(
                  onPressed: () {
                    print("SHARE Tapped");
                    final RenderBox box = context.findRenderObject();
                    Share.share('Lev\'s demo App',
                        subject: 'Verossa Valey',
                        sharePositionOrigin:
                        box.localToGlobal(Offset.zero) & box.size);
                  },
                  child: Text(
                    'SHARE',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],)));
  }
}