import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:verossa/View/Item_Tiles.dart';




///--------Global Variables ----------------------------------

List<Widget> cartItems = [];

String cartSubtotal = '';

int cartBadgeCountNoProv = 0;

BuildContext contextForBadgeProv;

bool cartHasBeenAdjusted;

bool currentlyOnHomePage = true;


///---------MAPS-----------------------------------------------

Map<String, Widget> itemTiles = {
  'item1Small': ItemTile1S(itemID: 'item1Small'),
  'item1Medium': ItemTile1M(itemID: 'item1Medium'),
  'item1Large': ItemTile1L(itemID: 'item1Large'),
  'item2Small': ItemTile2S(itemID: 'item2Small'),
  'item2Medium': ItemTile2M(itemID: 'item2SMedium'),
  'item2Large': ItemTile2L(itemID: 'item2Large'),
  'item3Small': ItemTile3S(itemID: 'item3Small'),
  'item3Medium': ItemTile3M(itemID: 'item3SMedium'),
  'item3Large': ItemTile3L(itemID: 'item3Large'),
  'item4Small': ItemTile4S(itemID: 'item4Small'),
  'item4Medium': ItemTile4M(itemID: 'item4SMedium'),
  'item4Large': ItemTile4L(itemID: 'item4Large'),
  'item5Small': ItemTile5S(itemID: 'item5Small'),
  'item5Medium': ItemTile5M(itemID: 'item5SMedium'),
  'item5Large': ItemTile5L(itemID: 'item5Large'),
  'item6Small': ItemTile6S(itemID: 'item6Small'),
  'item6Medium': ItemTile6M(itemID: 'item6SMedium'),
  'item6Large': ItemTile6L(itemID: 'item6Large'),
};

Map<String, String> itemTitles = {
  'item1Small': 'Montana Fall',
  'item1Medium': 'Montana Fall - B&W',
  'item1Large': 'Montana Fall - CL',
  'item2Small': 'Red Africa',
  'item2Medium': 'Red Africa - B&W',
  'item2Large': 'Red Africa - CL',
  'item3Small': 'Rugged Swiss',
  'item3Medium': 'Rugged Swiss - B&W',
  'item3Large': 'Rugged Swiss - CL',
  'item4Small': 'Estonia Spring',
  'item4Medium': 'Estonia Spring - B&W',
  'item4Large': 'Estonia Spring - CL',
  'item5Small': 'Michigan Thunder',
  'item5Medium': 'Michigan Thunder - B&W',
  'item5Large': 'Michigan Thunder - CL',
  'item6Small': 'Scotland High',
  'item6Medium': 'Scotland High - B&W',
  'item6Large': 'Scotland High - CL'
};

Map<String, AssetImage> itemImages = {
  'item1Small': AssetImage('images/Verossa-Fall.jpg'),
  'item1Medium': AssetImage('images/Verossa-FallBW.jpg'),
  'item1Large': AssetImage('images/Verossa-FallCL.jpg'),

  'item2Small': AssetImage('images/Verossa-SunTree.jpg'),
  'item2Medium': AssetImage('images/Verossa-SunTreeBW.jpg'),
  'item2Large': AssetImage('images/Verossa-SunTreeCL.jpg'),

  'item3Small': AssetImage('images/Verossa-Heli.jpg'),
  'item3Medium': AssetImage('images/Verossa-HeliBW.jpg'),
  'item3Large': AssetImage('images/Verossa-HeliCL.jpg'),

  'item4Small': AssetImage('images/Verossa-Field.jpg'),
  'item4Medium': AssetImage('images/Verossa-FieldBW.jpg'),
  'item4Large': AssetImage('images/Verossa-FieldCL.jpg'),

  'item5Small': AssetImage('images/Verossa-Thunder.jpg'),
  'item5Medium': AssetImage('images/Verossa-ThunderBW.jpg'),
  'item5Large': AssetImage('images/Verossa-ThunderCL.jpg'),

  'item6Small': AssetImage('images/Verossa-Scotland.jpg'),
  'item6Medium': AssetImage('images/Verossa-ScotlandBW.jpg'),
  'item6Large': AssetImage('images/Verossa-ScotlandCL.jpg')
};

Map<String, StreamController> streamControllers = {
  'item1Small': StreamController(),
  'item1Medium': StreamController(),
  'item1Large': StreamController(),
  'item2Small': StreamController(),
  'item2Medium': StreamController(),
  'item2Large': StreamController(),
  'item3Small': StreamController(),
  'item3Medium': StreamController(),
  'item3Large': StreamController(),
  'item4Small': StreamController(),
  'item4Medium': StreamController(),
  'item4Large': StreamController(),
  'item5Small': StreamController(),
  'item5Medium': StreamController(),
  'item5Large': StreamController(),
  'item6Small': StreamController(),
  'item6Medium': StreamController(),
  'item6Large': StreamController()
};


///--------GobalKeys-------------------------------------------

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

final GlobalKey drawerKey = GlobalKey();

final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();


///--------Widgets----------------------------------------------

Widget buildItem(BuildContext context, Widget item, Animation<double> animation) {


  return SizeTransition(
    axis: Axis.vertical,
      sizeFactor: animation,
      child: item
  );
}

Widget subtotalContainer = Container();

Widget subtotal(String totalAmount) {
  final textControllerCheckOut = TextEditingController();
  return Container(
    child: Column(
      children: [
        Container(
          color: Color(0xffe7e7e7),
          height: 40,
          child: Padding(
            padding: EdgeInsets.only(left: 32),
            child: Row(
              children: [
                Opacity(
                    opacity: 0.8,
                    child: Text(
                      'SUBTOTAL',
                      style:
                      TextStyle(fontWeight: FontWeight.bold),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 90.0),
                  child: Text(totalAmount),
                ),
              ],
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 15.0, left: 20, right: 15, bottom: 20),
            child: Opacity(
              opacity: 0.4,
              child: TextFormField(
                controller: textControllerCheckOut,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Order Notes',
                  hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 13),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10, horizontal: 10),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Container(
              width: 220,
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xff3d3939),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  textControllerCheckOut.text = 'Thanks for using my demo app, please See the About Us page for more info on check out.';
                  scaffoldKey.currentState
                      .showSnackBar(SnackBar(
                      content: Text('Thanks for using my demo app, please see About Us page for more info on the check out process', textAlign: TextAlign.center,)));
                },
                child: Text(
                  'CHECKOUT',
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget yourCartIsEmpty() {
  return Container(
    height: 40,
    width: 800,
    color: Colors.grey[100],
    child: Padding(
      padding: const EdgeInsets.only(top: 14.0, left: 40),
      child: Opacity(
          opacity: 1,
          child: Text(
            'YOUR CART IS EMPTY',
            style: TextStyle(
                fontSize: 11, fontWeight: FontWeight.w300),
          )),
    ),
  );
}

///--------PRICES & CURRENCIES----------------------------------

List basePrice = [14.95, 24.95, 19.95, 14.95, 19.95, 14.95];

String currencyInUse = 'AUD';

String currencySymbolInUse = '\$';

Map<String, double> priceToCalculateSubtotal = {
  'item1Small': 0,
  'item1Medium': 0,
  'item1Large': 0,
  'item2Small': 0,
  'item2Medium': 0,
  'item2Large': 0,
  'item3Small': 0,
  'item3Medium': 0,
  'item3Large': 0,
  'item4Small': 0,
  'item4Medium': 0,
  'item4Large': 0,
  'item5Small': 0,
  'item5Medium': 0,
  'item5Large': 0,
  'item6Small': 0,
  'item6Medium': 0,
  'item6Large': 0
};

Map<String, String> currency = {
  'item1Small': '\$14.95 AUD',
  'item1Medium': '\$14.95 AUD',
  'item1Large': '\$14.95 AUD',
  'item2Small': '\$24.95 AUD',
  'item2Medium': '\$24.95 AUD',
  'item2Large': '\$24.95 AUD',
  'item3Small': '\$19.95 AUD',
  'item3Medium': '\$19.95 AUD',
  'item3Large': '\$19.95 AUD',
  'item4Small': '\$14.95 AUD',
  'item4Medium': '\$14.95 AUD',
  'item4Large': '\$14.95 AUD',
  'item5Small': '\$19.95 AUD',
  'item5Medium': '\$19.95 AUD',
  'item5Large': '\$19.95 AUD',
  'item6Small': '\$14.95 AUD',
  'item6Medium': '\$14.95 AUD',
  'item6Large': '\$14.95 AUD'
};

///--------STOCK COUNT------------------------------------------

Map<String, int> stockLimit = {
  'item1Small': 5,
  'item1Medium': 5,
  'item1Large': 5,
  'item2Small': 5,
  'item2Medium': 5,
  'item2Large': 5,
  'item3Small': 5,
  'item3Medium': 5,
  'item3Large': 5,
  'item4Small': 5,
  'item4Medium': 5,
  'item4Large': 5,
  'item5Small': 5,
  'item5Medium': 5,
  'item5Large': 5,
  'item6Small': 5,
  'item6Medium': 5,
  'item6Large': 5
};

Map<String, int> stockInCart = {
  'item1Small': 0,
  'item1Medium': 0,
  'item1Large': 0,
  'item2Small': 0,
  'item2Medium': 0,
  'item2Large': 0,
  'item3Small': 0,
  'item3Medium': 0,
  'item3Large': 0,
  'item4Small': 0,
  'item4Medium': 0,
  'item4Large': 0,
  'item5Small': 0,
  'item5Medium': 0,
  'item5Large': 0,
  'item6Small': 0,
  'item6Medium': 0,
  'item6Large': 0
};


///--------FIREBASE---------------------------------------------

final firestore = FirebaseFirestore.instance;

final auth = FirebaseAuth.instance;

bool userLoggedIn;
bool currentlyOnPersonalPage;

String firstName;
String lastName;
String email;
String password;
String fullName;
String street;
String place;
String postcode;



