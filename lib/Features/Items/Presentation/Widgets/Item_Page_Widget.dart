import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Items/Presentation/Util/Animated_Cross_Fade_Image_Widget.dart';
import 'package:verossa/Features/Items/Presentation/Util/Directory_Path_Widget.dart';
import 'package:verossa/Features/Items/Presentation/Util/Hero_Container_Widget.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';
import 'package:verossa/Model/Items.dart';
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
import 'package:verossa/View/Pages/Item/Item_Detail_Page.dart';

import 'package:verossa/View/Widgets/App_Bar_Widget.dart';
import 'package:verossa/View/Widgets/Free_Shipping_Banner_Widget.dart';
import 'package:verossa/View/Widgets/Verossa_Logo.dart';

import '../Item_Provider.dart';

/// implement new detail page

class ItemPageWidget extends StatefulWidget  {

  ItemModel itemModel;

  ItemPageWidget({this.itemModel});

  @override
  _ItemPageWidgetState createState() => _ItemPageWidgetState(itemModel: itemModel);
}

class _ItemPageWidgetState extends State<ItemPageWidget> {

  String currentlySelected = 'item1Small';

  // HeroContainer a;
  // HeroContainer b;
  // HeroContainer c;

  ItemModel itemModel;

  _ItemPageWidgetState({this.itemModel});



  @override
  void initState() {
    super.initState();
    //contextForBadgeProv = context;

    // a = HeroContainer(assetImage: itemModel.itemImage);
    // b = HeroContainer(assetImage: itemModel.itemImageBW);
    // c = HeroContainer(assetImage: itemModel.itemImageCF);
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
              DirectoryPath(),
              AnimatedCrossFadeImage(itemModel: itemModel),
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(itemModel.titleAllCaps,
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
                      // _scaffoldKey.currentState.showSnackBar(SnackBar(
                      //     content: Text(
                      //       'Item sold out',
                      //       textAlign: TextAlign.center,
                      //     )));
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