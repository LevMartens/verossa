import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'Item_Detail_Screens.dart';
import 'AppBar+Drawers.dart';
import '../Model/Global_Variables.dart';
import '../Controller/Global_Methods.dart';
import 'package:share/share.dart';
import 'package:verossa/Model/NewsLetterForms.dart';
import 'ContactUs_Page.dart';
import 'AboutUs_Page.dart';
import 'ReturnsPolicy_Page.dart';
import 'Shipping_Page.dart';






/// Screen 1 ----------------------------------------
class Item1Screen extends StatefulWidget {

  final String directory;

  Item1Screen({this.directory});

  @override
  _InputPageState createState() => _InputPageState(directory: directory);
}


class _InputPageState extends State<Item1Screen>
     {


  final String directory;

  _InputPageState({this.directory});


  bool startImageOne = false;

  double opacityOne = 1.0;
  double opacityTwo = 0.8;
  double opacityThree = 0.8;
  double opacityFour = 0.8;


  String currentlySelected = 'item1Small';





  @override
  void initState() {
    super.initState();
    contextForBadgeProv = context;
  }



  @override
  Widget build(BuildContext context) {



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


    Container imageFirst = a();
    Container imageSecond = b();


    String priceItem1 =
    currency['item1Small'];
    String priceItem2 =
    currency['item2Small'];
    String priceItem3 =
    currency['item3Small'];
    String priceItem4 =
    currency['item4Small'];
    String priceItem5 =
    currency['item5Small'];
    String priceItem6 =
    currency['item6Small'];








    return  Scaffold(
      extendBodyBehindAppBar: true,
          key: scaffoldKey,
          appBar: VerossaAppBar(),
          body: CustomScrollView(
            slivers: [
              SliverFixedExtentList(
                itemExtent: 2500,
                delegate: SliverChildListDelegate([
                  Container(
                    color: Colors.white70,
                    child: Column(children: <Widget>[
                      SizedBox(height: 100,),
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
                        padding: const EdgeInsets.only(left: 60.0, top: 45),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .pushReplacementNamed('homePage');

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
                                child: Text(directory),
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
                            color: Colors.red,
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
                                  secondChild: Hero(tag: 'second', child: imageSecond),
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
                                        opacityOne = 1.0;
                                        opacityTwo = 0.7;
                                        opacityThree = 0.7;
                                        opacityFour = 0.7;
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
                                      opacityOne = 0.7;
                                      opacityTwo = 1.0;
                                      opacityThree = 0.7;
                                      opacityFour = 0.7;
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
                                    },
                                      child: Opacity(
                                        opacity: opacityTwo,
                                        child: Image(
                                    image: AssetImage('images/Verossa-FallBW.jpg'),
                                  ),
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      opacityOne = 0.7;
                                      opacityTwo = 0.7;
                                      opacityThree = 1.0;
                                      opacityFour = 0.7;
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
                                    },
                                      child: Opacity(
                                        opacity: opacityThree,
                                        child: Image(
                                    image: AssetImage('images/Verossa-FallCL.jpg'),
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
                          child: Text('MONTANA FALL', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 21)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text(priceItem1, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 21)),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: Text('Effect', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 17)),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Center(
                        child: Container(
                          width: 360,

                          child: CupertinoPicker(
                            itemExtent: 32,
                            onSelectedItemChanged: (selectedIndex) {

                              if(selectedIndex == 0) {
                                setState(() {
                                  currentlySelected = 'item1Small';
                                });

                              }
                              if(selectedIndex == 1) {
                                setState(() {
                                  currentlySelected = 'item1Medium';
                                });

                              }
                              if(selectedIndex == 2) {
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
                      SizedBox(height: 20,),
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

                            if (stockInCart[currentlySelected] >= stockLimit[currentlySelected]) {

                              scaffoldKey.currentState
                                  .showSnackBar(SnackBar(
                                  content: Text('Item sold out', textAlign: TextAlign.center,)));
                            } else {
                              addCartItem(currentlySelected, false, context);
                            }


                          },
                          child: Text(
                            'ADD TO CARD',
                            style: TextStyle(
                                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 350,
                        child:Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text('Montana Fall is a photo taken by Valiphoto. This photo was created on November 6, 2011 and published on December 3, 2015.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.centerLeft,
                        width: 350,
                        child:Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text('Specs: Canon600, EF-S17-55mm f/2.8 IS USM, 35.0mm · ƒ/2.8 · 1/50s · ISO 100.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                        ),
                      ),
                      SizedBox(height: 20,),
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
                            box.localToGlobal(Offset.zero) &
                            box.size);

                          },
                          child: Text(
                            'SHARE',
                            style: TextStyle(
                                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                          ),
                        ),
                      ),
                      SizedBox(height: 80,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 32.0),
                          child: Text('RELATED ITEMS', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Divider(
                        indent: 32 ,
                        endIndent: 32,
                        color: Colors.black,
                        thickness: 0.75,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 18,
                                left: 32.0,
                                bottom: 13,
                                right: 10),
                            child: GestureDetector(
                              onTap: () {
                                print("Container 3 clicked");

                                Navigator.of(context)
                                    .pushReplacementNamed('item3FromHome');
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
                                          image: AssetImage('images/Verossa-Heli.jpg'),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 17.0),
                                        child: Container(
                                          height: 30,
                                          width: 120,
                                          child: Text(
                                            'Rugged Swiss',
                                            style:
                                            TextStyle(height: 1.6),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0),
                                        child: Container(
                                          height: 20,
                                          width: 120,
                                          child: Text(
                                            priceItem3,
                                            style: TextStyle(
                                              fontWeight:
                                              FontWeight.bold,
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
                                top: 18,
                                left: 10.0,
                                bottom: 13,
                                right: 0),
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


                                          image: AssetImage('images/Verossa-Field.jpg'),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16.0),
                                        child: Container(
                                          height: 30,
                                          width: 120,
                                          child: Text(
                                            'Estonia Spring',
                                            style:
                                            TextStyle(height: 1.6),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0),
                                        child: Container(
                                          height: 20,
                                          width: 120,
                                          child: Text(
                                            priceItem4,
                                            style: TextStyle(
                                              fontWeight:
                                              FontWeight.bold,
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0,
                                left: 32.0,
                                bottom: 13,
                                right: 10),
                            child: GestureDetector(
                              onTap: () {
                                print("Container 5 clicked");

                                Navigator.of(context)
                                    .pushReplacementNamed('item5FromHome');
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
                                          image: AssetImage('images/Verossa-Thunder.jpg'),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 17.0),
                                        child: Container(
                                          height: 30,
                                          width: 120,
                                          child: Text(
                                            'Michigan Thunder',
                                            style:
                                            TextStyle(height: 1.6),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0),
                                        child: Container(
                                          height: 20,
                                          width: 120,
                                          child: Text(
                                            priceItem5,
                                            style: TextStyle(
                                              fontWeight:
                                              FontWeight.bold,
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
                                top: 0,
                                left: 10.0,
                                bottom: 13,
                                right: 0),
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


                                          image: AssetImage('images/Verossa-Scotland.jpg'),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 16.0),
                                        child: Container(
                                          height: 30,
                                          width: 120,
                                          child: Text(
                                            'Scotland High',
                                            style:
                                            TextStyle(height: 1.6),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0.0),
                                        child: Container(
                                          height: 20,
                                          width: 120,
                                          child: Text(
                                            priceItem6,
                                            style: TextStyle(
                                              fontWeight:
                                              FontWeight.bold,
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
                     NewsLetterFormForItem(),
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

/// Screen 2 ----------------------------------------
class Item2Screen extends StatefulWidget {

  final String directory;

  Item2Screen({this.directory});

  @override
  _InputPageState2 createState() => _InputPageState2(directory: directory);
}


class _InputPageState2 extends State<Item2Screen>
     {


  final String directory;

  _InputPageState2({this.directory});


  bool startImageOne = false;

  double opacityOne = 1.0;
  double opacityTwo = 0.8;
  double opacityThree = 0.8;
  double opacityFour = 0.8;


  String currentlySelected = 'item2Small';



  @override
  void initState() {
    super.initState();
contextForBadgeProv = context;
  }

  @override
  Widget build(BuildContext context) {

    Container a() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-SunTree.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container b() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-SunTreeBW.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container c() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-SunTreeCL.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }


    Container imageFirst = a();
    Container imageSecond = b();


    String priceItem1 =
    currency['item1Small'];
    String priceItem2 =
    currency['item2Small'];
    String priceItem3 =
    currency['item3Small'];
    String priceItem4 =
    currency['item4Small'];
    String priceItem5 =
    currency['item5Small'];
    String priceItem6 =
    currency['item6Small'];



    return  Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: VerossaAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2500,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: 100,),
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
                    padding: const EdgeInsets.only(left: 60.0, top: 45),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('homePage');
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
                            child: Text(directory),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('/'),
                        ),
                        Text('Red Africa'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 30.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        height: 230,
                        width: 360,
                        child: GestureDetector(
                          onLongPress: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 200),

                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                    Item2Detail()));
                          },
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: AnimatedCrossFade(


                              firstChild: Hero(tag: 'first', child: imageFirst),
                              secondChild: Hero(tag: 'second', child: imageSecond),
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
                              padding: const EdgeInsets.only(left: 13.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 1.0;
                                    opacityTwo = 0.7;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityOne,
                                    child: Image(
                                      image:
                                      AssetImage('images/Verossa-SunTree.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 1.0;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityTwo,
                                    child: Image(
                                      image: AssetImage('images/Verossa-SunTreeBW.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 0.7;
                                    opacityThree = 1.0;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityThree,
                                    child: Image(
                                      image: AssetImage('images/Verossa-SunTreeCL.jpg'),
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
                      child: Text('RED AFRICA', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(priceItem2, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text('Effect', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Container(
                      width: 360,

                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (selectedIndex) {

                          if(selectedIndex == 0) {
                            setState(() {
                              currentlySelected = 'item1Small';
                            });

                          }
                          if(selectedIndex == 1) {
                            setState(() {
                              currentlySelected = 'item1Medium';
                            });

                          }
                          if(selectedIndex == 2) {
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
                  SizedBox(height: 20,),
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

                        if (stockInCart[currentlySelected] >= stockLimit[currentlySelected]) {

                          scaffoldKey.currentState
                              .showSnackBar(SnackBar(
                              content: Text('Item sold out', textAlign: TextAlign.center,)));
                        } else {
                          addCartItem(currentlySelected, false, context);
                        }


                      },
                      child: Text(
                        'ADD TO CARD',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Red Africa is a photo taken by Valiphoto. This photo was created on November 6, 2011 and published on December 3, 2015.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Specs: Canon600, EF-S17-55mm f/2.8 IS USM, 35.0mm · ƒ/2.8 · 1/50s · ISO 100.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                            box.localToGlobal(Offset.zero) &
                            box.size);

                      },
                      child: Text(
                        'SHARE',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 80,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text('RELATED ITEMS', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 32 ,
                    endIndent: 32,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 3 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item3FromHome');
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
                                      image: AssetImage('images/Verossa-Heli.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Rugged Swiss',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem3,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 18,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
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


                                      image: AssetImage('images/Verossa-Field.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Estonia Spring',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem4,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 5 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item5FromHome');
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
                                      image: AssetImage('images/Verossa-Thunder.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Michigan Thunder',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem5,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 0,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
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


                                      image: AssetImage('images/Verossa-Scotland.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Scotland High',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem6,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                  NewsLetterFormForItem2(),
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
/// Screen 3 ----------------------------------------
class Item3Screen extends StatefulWidget {

  final String directory;

  Item3Screen({this.directory});

  @override
  _InputPageState3 createState() => _InputPageState3(directory: directory);
}


class _InputPageState3 extends State<Item3Screen>
     {

  final String directory;

  _InputPageState3({this.directory});


  bool startImageOne = false;

  double opacityOne = 1.0;
  double opacityTwo = 0.8;
  double opacityThree = 0.8;
  double opacityFour = 0.8;


  String currentlySelected = 'item3Small';


  @override
  void initState() {
    super.initState();
contextForBadgeProv = context;
  }

  @override
  Widget build(BuildContext context) {

    Container a() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-Heli.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container b() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-HeliBW.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container c() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-HeliCL.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }


    Container imageFirst = a();
    Container imageSecond = b();


    String priceItem1 =
    currency['item1Small'];
    String priceItem2 =
    currency['item2Small'];
    String priceItem3 =
    currency['item3Small'];
    String priceItem4 =
    currency['item4Small'];
    String priceItem5 =
    currency['item5Small'];
    String priceItem6 =
    currency['item6Small'];



    return  Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: VerossaAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2500,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: 100,),
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
                    padding: const EdgeInsets.only(left: 60.0, top: 45),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('homePage');


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
                            child: Text(directory),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('/'),
                        ),
                        Text('Rugged Swiss'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 30.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        height: 230,
                        width: 360,
                        child: GestureDetector(
                          onLongPress: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 200),

                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                    Item3Detail()));
                          },
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: AnimatedCrossFade(


                              firstChild: Hero(tag: 'first', child: imageFirst),
                              secondChild: Hero(tag: 'second', child: imageSecond),
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
                              padding: const EdgeInsets.only(left: 3.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 1.0;
                                    opacityTwo = 0.7;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityOne,
                                    child: Image(
                                      image:
                                      AssetImage('images/Verossa-Heli.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 1.0;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityTwo,
                                    child: Image(
                                      image: AssetImage('images/Verossa-HeliBW.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 0.7;
                                    opacityThree = 1.0;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityThree,
                                    child: Image(
                                      image: AssetImage('images/Verossa-HeliCL.jpg'),
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
                      child: Text('Rugged Swiss', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(priceItem3, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text('Effect', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Container(
                      width: 360,

                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (selectedIndex) {

                          if(selectedIndex == 0) {
                            setState(() {
                              currentlySelected = 'item1Small';
                            });

                          }
                          if(selectedIndex == 1) {
                            setState(() {
                              currentlySelected = 'item1Medium';
                            });

                          }
                          if(selectedIndex == 2) {
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
                  SizedBox(height: 20,),
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

                        if (stockInCart[currentlySelected] >= stockLimit[currentlySelected]) {

                          scaffoldKey.currentState
                              .showSnackBar(SnackBar(
                              content: Text('Item sold out', textAlign: TextAlign.center,)));
                        } else {
                          addCartItem(currentlySelected, false, context);
                        }


                      },
                      child: Text(
                        'ADD TO CARD',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Rugged Swiss is a photo taken by Valiphoto. This photo was created on November 6, 2011 and published on December 3, 2015.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Specs: Canon600, EF-S17-55mm f/2.8 IS USM, 35.0mm · ƒ/2.8 · 1/50s · ISO 100.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                            box.localToGlobal(Offset.zero) &
                            box.size);

                      },
                      child: Text(
                        'SHARE',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 80,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text('RELATED ITEMS', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 32 ,
                    endIndent: 32,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 1 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item1FromHome');
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
                                      image: AssetImage('images/Verossa-Fall.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Montana Fall',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem1,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 18,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
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


                                      image: AssetImage('images/Verossa-Field.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Estonia Spring',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem4,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 5 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item5FromHome');
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
                                      image: AssetImage('images/Verossa-Thunder.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Michigan Thunder',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem5,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 0,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
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


                                      image: AssetImage('images/Verossa-Scotland.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Scotland High',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem6,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                  NewsLetterFormForItem3(),
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
/// Screen 4 ----------------------------------------
class Item4Screen extends StatefulWidget {

  final String directory;

  Item4Screen({this.directory});

  @override
  _InputPageState4 createState() => _InputPageState4(directory: directory);
}


class _InputPageState4 extends State<Item4Screen>
     {


  final String directory;

  _InputPageState4({this.directory});


  bool startImageOne = false;

  double opacityOne = 1.0;
  double opacityTwo = 0.8;
  double opacityThree = 0.8;
  double opacityFour = 0.8;


  String currentlySelected = 'item4Small';




  @override
  void initState() {
    super.initState();
    contextForBadgeProv = context;
  }

  @override
  Widget build(BuildContext context) {

    Container a() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-Field.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container b() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-FieldBW.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container c() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-FieldCL.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }


    Container imageFirst = a();
    Container imageSecond = b();


    String priceItem1 =
    currency['item1Small'];
    String priceItem2 =
    currency['item2Small'];
    String priceItem3 =
    currency['item3Small'];
    String priceItem4 =
    currency['item4Small'];
    String priceItem5 =
    currency['item5Small'];
    String priceItem6 =
    currency['item6Small'];



    return  Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: VerossaAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2500,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: 100,),
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
                    padding: const EdgeInsets.only(left: 60.0, top: 45),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('homePage');

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
                            child: Text(directory),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('/'),
                        ),
                        Text('Estonia Spring'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 30.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        height: 230,
                        width: 360,
                        child: GestureDetector(
                          onLongPress: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 200),

                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                    Item4Detail()));
                          },
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: AnimatedCrossFade(


                              firstChild: Hero(tag: 'first', child: imageFirst),
                              secondChild: Hero(tag: 'second', child: imageSecond),
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
                                    opacityOne = 1.0;
                                    opacityTwo = 0.7;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityOne,
                                    child: Image(
                                      image:
                                      AssetImage('images/Verossa-Field.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 1.0;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityTwo,
                                    child: Image(
                                      image: AssetImage('images/Verossa-FieldBW.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 0.7;
                                    opacityThree = 1.0;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityThree,
                                    child: Image(
                                      image: AssetImage('images/Verossa-FieldCL.jpg'),
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
                      child: Text('Estonia Spring', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(priceItem4, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text('Effect', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Container(
                      width: 360,

                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (selectedIndex) {

                          if(selectedIndex == 0) {
                            setState(() {
                              currentlySelected = 'item1Small';
                            });

                          }
                          if(selectedIndex == 1) {
                            setState(() {
                              currentlySelected = 'item1Medium';
                            });

                          }
                          if(selectedIndex == 2) {
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
                  SizedBox(height: 20,),
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
                        if (stockInCart[currentlySelected] >= stockLimit[currentlySelected]) {

                          scaffoldKey.currentState
                              .showSnackBar(SnackBar(
                              content: Text('Item sold out', textAlign: TextAlign.center,)));
                        } else {
                          addCartItem(currentlySelected, false, context);
                        }

                      },
                      child: Text(
                        'ADD TO CARD',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Estonia Spring is a photo taken by Valiphoto. This photo was created on November 6, 2011 and published on December 3, 2015.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Specs: Canon600, EF-S17-55mm f/2.8 IS USM, 35.0mm · ƒ/2.8 · 1/50s · ISO 100.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                            box.localToGlobal(Offset.zero) &
                            box.size);

                      },
                      child: Text(
                        'SHARE',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 80,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text('RELATED ITEMS', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 32 ,
                    endIndent: 32,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 3 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item3FromHome');
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
                                      image: AssetImage('images/Verossa-Heli.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Rugged Swiss',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem3,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 18,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 2 clicked");
                            Navigator.of(context)
                                .pushReplacementNamed('item2FromHome');
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


                                      image: AssetImage('images/Verossa-SunTree.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Red Africa',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem4,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 5 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item5FromHome');
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
                                      image: AssetImage('images/Verossa-Thunder.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Michigan Thunder',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem5,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 0,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
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


                                      image: AssetImage('images/Verossa-Scotland.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Scotland High',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem6,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                  NewsLetterFormForItem4(),
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
      endDrawer: MyEndDrawer(

      ),
    );


  }


}
/// Screen 5 ----------------------------------------
class Item5Screen extends StatefulWidget {

  final String directory;

  Item5Screen({this.directory});

  @override
  _InputPageState5 createState() => _InputPageState5(directory: directory);
}


class _InputPageState5 extends State<Item5Screen>
     {


  final String directory;

  _InputPageState5({this.directory});


  bool startImageOne = false;

  double opacityOne = 1.0;
  double opacityTwo = 0.8;
  double opacityThree = 0.8;
  double opacityFour = 0.8;


  String currentlySelected = 'item5Small';




  @override
  void initState() {
    super.initState();
    contextForBadgeProv = context;
  }

  @override
  Widget build(BuildContext context) {

    Container a() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-Thunder.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container b() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-ThunderBW.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container c() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-ThunderCL.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }


    Container imageFirst = a();
    Container imageSecond = b();


    String priceItem1 =
    currency['item1Small'];
    String priceItem2 =
    currency['item2Small'];
    String priceItem3 =
    currency['item3Small'];
    String priceItem4 =
    currency['item4Small'];
    String priceItem5 =
    currency['item5Small'];
    String priceItem6 =
    currency['item6Small'];



    return  Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: VerossaAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2500,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: 100,),
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
                    padding: const EdgeInsets.only(left: 60.0, top: 45),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('homePage');

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
                            child: Text(directory),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('/'),
                        ),
                        Text('Michigan Thunder'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 30.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        height: 230,
                        width: 360,
                        child: GestureDetector(
                          onLongPress: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 200),

                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                    Item5Detail()));
                          },
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: AnimatedCrossFade(


                              firstChild: Hero(tag: 'first', child: imageFirst),
                              secondChild: Hero(tag: 'second', child: imageSecond),
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
                              padding: const EdgeInsets.only(left: 2.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 1.0;
                                    opacityTwo = 0.7;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityOne,
                                    child: Image(
                                      image:
                                      AssetImage('images/Verossa-Thunder.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 1.0;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityTwo,
                                    child: Image(
                                      image: AssetImage('images/Verossa-ThunderBW.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 0.7;
                                    opacityThree = 1.0;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityThree,
                                    child: Image(
                                      image: AssetImage('images/Verossa-ThunderCL.jpg'),
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
                      child: Text('Michigan Thunder', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(priceItem5, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text('Effect', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Container(
                      width: 360,

                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (selectedIndex) {

                          if(selectedIndex == 0) {
                            setState(() {
                              currentlySelected = 'item1Small';
                            });

                          }
                          if(selectedIndex == 1) {
                            setState(() {
                              currentlySelected = 'item1Medium';
                            });

                          }
                          if(selectedIndex == 2) {
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
                  SizedBox(height: 20,),
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
                        if (stockInCart[currentlySelected] >= stockLimit[currentlySelected]) {

                          scaffoldKey.currentState
                              .showSnackBar(SnackBar(
                              content: Text('Item sold out', textAlign: TextAlign.center,)));
                        } else {
                          addCartItem(currentlySelected, false, context);
                        }


                      },
                      child: Text(
                        'ADD TO CARD',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Michigan Thunder is a photo taken by Valiphoto. This photo was created on November 6, 2011 and published on December 3, 2015.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Specs: Canon600, EF-S17-55mm f/2.8 IS USM, 35.0mm · ƒ/2.8 · 1/50s · ISO 100.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                            box.localToGlobal(Offset.zero) &
                            box.size);

                      },
                      child: Text(
                        'SHARE',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 80,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text('RELATED ITEMS', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 32 ,
                    endIndent: 32,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 3 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item3FromHome');
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
                                      image: AssetImage('images/Verossa-Heli.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Rugged Swiss',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem3,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 18,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 2 clicked");
                            Navigator.of(context)
                                .pushReplacementNamed('item2FromHome');
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


                                      image: AssetImage('images/Verossa-SunTree.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Red Africa',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem4,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 1 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item1FromHome');
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
                                      image: AssetImage('images/Verossa-Fall.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Michigan Thunder',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem5,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 0,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
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


                                      image: AssetImage('images/Verossa-Scotland.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Scotland High',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem6,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                  NewsLetterFormForItem5(),
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
      endDrawer: MyEndDrawer(

      ),
    );


  }


}
/// Screen 6 ----------------------------------------
class Item6Screen extends StatefulWidget {

  final String directory;

  Item6Screen({this.directory});

  @override
  _InputPageState6 createState() => _InputPageState6(directory: directory);
}


class _InputPageState6 extends State<Item6Screen>
     {


  final String directory;

  _InputPageState6({this.directory});


  bool startImageOne = false;

  double opacityOne = 1.0;
  double opacityTwo = 0.8;
  double opacityThree = 0.8;
  double opacityFour = 0.8;


  String currentlySelected = 'item6Small';




  @override
  void initState() {
    super.initState();
    contextForBadgeProv = context;
  }

  @override
  Widget build(BuildContext context) {

    Container a() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-Scotland.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container b() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-ScotlandBW.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }
    Container c() {
      return Container(
        height: 425,
        width: 300,
        child: Image(
          image: AssetImage('images/Verossa-ScotlandCL.jpg'),
          fit: BoxFit.fill,
        ),
      );
    }


    Container imageFirst = a();
    Container imageSecond = b();


    String priceItem1 =
    currency['item1Small'];
    String priceItem2 =
    currency['item2Small'];
    String priceItem3 =
    currency['item3Small'];
    String priceItem4 =
    currency['item4Small'];
    String priceItem5 =
    currency['item5Small'];
    String priceItem6 =
    currency['item6Small'];



    return  Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      appBar: VerossaAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverFixedExtentList(
            itemExtent: 2500,
            delegate: SliverChildListDelegate([
              Container(
                color: Colors.white70,
                child: Column(children: <Widget>[
                  SizedBox(height: 100,),
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
                    padding: const EdgeInsets.only(left: 60.0, top: 45),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('homePage');

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
                            child: Text(directory),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('/'),
                        ),
                        Text('Scotland High'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 30.0),
                    child: Center(
                      child: Container(
                        color: Colors.red,
                        height: 230,
                        width: 360,
                        child: GestureDetector(
                          onLongPress: () {
                            Navigator.of(context).push(PageRouteBuilder(
                                transitionDuration: Duration(milliseconds: 200),

                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                    Item6Detail()));
                          },
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: AnimatedCrossFade(


                              firstChild: Hero(tag: 'first', child: imageFirst),
                              secondChild: Hero(tag: 'second', child: imageSecond),
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
                              padding: const EdgeInsets.only(left: 2.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 1.0;
                                    opacityTwo = 0.7;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityOne,
                                    child: Image(
                                      image:
                                      AssetImage('images/Verossa-Scotland.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 1.0;
                                    opacityThree = 0.7;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityTwo,
                                    child: Image(
                                      image: AssetImage('images/Verossa-ThunderBW.jpg'),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                  onTap: () {
                                    opacityOne = 0.7;
                                    opacityTwo = 0.7;
                                    opacityThree = 1.0;
                                    opacityFour = 0.7;
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
                                  },
                                  child: Opacity(
                                    opacity: opacityThree,
                                    child: Image(
                                      image: AssetImage('images/Verossa-ThunderCL.jpg'),
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
                      child: Text('Scotland High', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(priceItem6, textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 21)),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text('Effect', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Center(
                    child: Container(
                      width: 360,

                      child: CupertinoPicker(
                        itemExtent: 32,
                        onSelectedItemChanged: (selectedIndex) {

                          if(selectedIndex == 0) {
                            setState(() {
                              currentlySelected = 'item1Small';
                            });

                          }
                          if(selectedIndex == 1) {
                            setState(() {
                              currentlySelected = 'item1Medium';
                            });

                          }
                          if(selectedIndex == 2) {
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
                  SizedBox(height: 20,),
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
                        if (stockInCart[currentlySelected] >= stockLimit[currentlySelected]) {

                          scaffoldKey.currentState
                              .showSnackBar(SnackBar(
                              content: Text('Item sold out', textAlign: TextAlign.center,)));
                        } else {
                          addCartItem(currentlySelected, false, context);
                        }


                      },
                      child: Text(
                        'ADD TO CARD',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Scotland High is a photo taken by Valiphoto. This photo was created on November 6, 2011 and published on December 3, 2015.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: 350,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Text('Specs: Canon600, EF-S17-55mm f/2.8 IS USM, 35.0mm · ƒ/2.8 · 1/50s · ISO 100.', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.w400, fontSize: 17)),
                    ),
                  ),
                  SizedBox(height: 20,),
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
                            box.localToGlobal(Offset.zero) &
                            box.size);

                      },
                      child: Text(
                        'SHARE',
                        style: TextStyle(
                            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  SizedBox(height: 80,),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32.0),
                      child: Text('RELATED ITEMS', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey[800],  fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Divider(
                    indent: 32 ,
                    endIndent: 32,
                    color: Colors.black,
                    thickness: 0.75,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 18,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 3 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item3FromHome');
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
                                      image: AssetImage('images/Verossa-Heli.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Rugged Swiss',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem3,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 18,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 2 clicked");
                            Navigator.of(context)
                                .pushReplacementNamed('item2FromHome');
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


                                      image: AssetImage('images/Verossa-SunTree.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Red Africa',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem4,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 0,
                            left: 32.0,
                            bottom: 13,
                            right: 10),
                        child: GestureDetector(
                          onTap: () {
                            print("Container 1 clicked");

                            Navigator.of(context)
                                .pushReplacementNamed('item1FromHome');
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
                                      image: AssetImage('images/Verossa-Fall.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 17.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Michigan Thunder',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem5,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                            top: 0,
                            left: 10.0,
                            bottom: 13,
                            right: 0),
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


                                      image: AssetImage('images/Verossa-Scotland.jpg'),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0),
                                    child: Container(
                                      height: 30,
                                      width: 120,
                                      child: Text(
                                        'Scotland High',
                                        style:
                                        TextStyle(height: 1.6),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 0.0),
                                    child: Container(
                                      height: 20,
                                      width: 120,
                                      child: Text(
                                        priceItem6,
                                        style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
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
                  NewsLetterFormForItem6(),
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
      endDrawer: MyEndDrawer(

      ),
    );


  }


}
