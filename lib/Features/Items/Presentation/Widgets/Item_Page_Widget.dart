import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Items/Presentation/Util/Animated_Cross_Fade_Image_Widget.dart';
import 'package:verossa/Features/Items/Presentation/Util/Directory_Path_Widget.dart';
import 'package:verossa/Features/Items/Presentation/Util/Hero_Container_Widget.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
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


class ItemPageWidget extends StatefulWidget  {

  final ItemModel itemModel;

  ItemPageWidget({this.itemModel});

  @override
  _ItemPageWidgetState createState() => _ItemPageWidgetState(itemModel: itemModel);
}

class _ItemPageWidgetState extends State<ItemPageWidget> {

  int itemCurrentlySelected;

  ItemModel itemModel;

  _ItemPageWidgetState({this.itemModel});

  int itemIDNormal;
  int itemIDBW;
  int itemIDCF;



  @override
  void initState() {
    super.initState();

    itemIDNormal = itemModel.itemIDForNormal;
    itemIDBW = itemModel.itemIDForBW;
    itemIDCF = itemModel.itemIDForCF;

    itemCurrentlySelected = itemIDNormal;
  }

  @override
  Widget build(BuildContext context) {



    String priceItem1 = Provider.of<PricesProvider>(context, listen: true).priceItem1;


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
                          itemCurrentlySelected = itemIDNormal;
                        });
                      }
                      if (selectedIndex == 1) {
                        setState(() {
                          itemCurrentlySelected = itemIDBW;
                        });
                      }
                      if (selectedIndex == 2) {
                        setState(() {
                          itemCurrentlySelected = itemIDCF;
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
                child: TextButton(
                  onPressed: () async {

                    final failureOrSuccessfullyAdded = await Provider.of<ItemProvider>(context, listen: false).addItemToCart(itemCurrentlySelected, 1, context);

                    if (failureOrSuccessfullyAdded == 'Sold Out') {
                      final scaffold = ScaffoldMessenger.of(context);
                      scaffold.showSnackBar(
                        SnackBar(
                          content: const Text('Item sold out',
                                  textAlign: TextAlign.center,),
                        ),
                      );
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
                      itemModel.description,
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
                child: TextButton(
                  onPressed: () {
                    print("SHARE Tapped");
                    final RenderBox box = context.findRenderObject();
                    Share.share('Check out my portfolio https://levsportfolio.web.app',
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