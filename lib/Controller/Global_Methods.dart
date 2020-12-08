import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:verossa/Model/Global_Variables.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';
import '../Model/Global_Variables.dart';
import '../Controller/Drawer_Provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Model/User_Details.dart';





///-------------Cart Badge----------------------
void cartBadgeIncrease() {
  print('cartBadgeIncrease() called');
  cartBadgeCountNoProv = cartBadgeCountNoProv +1;
}

void cartBadgeDecrease() {
  print('cartBadgeDecrease() called');
  if(cartBadgeCountNoProv > 0) {
    cartBadgeCountNoProv = cartBadgeCountNoProv - 1;
  }
}

void cartBadgeOnChanged(int value) {
  print('cartBadgeOnChanged() called');
  cartBadgeCountNoProv = value;
}

Future<void> cartBadgeAfterStartup() async{
  print('cartBadgeAfterStartUp() called');
  var total = 0;
  stockInCart.values.forEach((v) {
    total = total + v;
  });
  cartBadgeCountNoProv = total;
}


///----------------Currency Handling----------------
void flushAllCurrencyStreamsInTiles() {
  print('flushAllCurrencyStreamsInTiles() called');
  streamControllers.keys.forEach((k) {
    streamControllers[k].close();
    streamControllers[k] = StreamController<String>();
  });
}

void sinkCurrenciesForTiles() {
  print('sinkCurrenciesForTiles() called');
  streamControllers.keys.forEach((k) {
    streamControllers[k].sink.add(currency[k]);

  });
}

Future<void> getCurrencyData(int i) async {
  print('getCurrencyData() called');

  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('currencyInUse', i);



  List symbol = ['\$', '\$', '\$', '\₹', '\£', '\€', '\¥'];
  List name = ['AUD', 'USD', 'CAD', 'INR', 'GBP', 'EUR', 'JPY'];
  List cur = [];

  Response response =
  await get('https://api.exchangeratesapi.io/latest?base=AUD');
  String data = response.body;
     print(data);
  var usd = jsonDecode(data)['rates']['USD'];
  var cad = jsonDecode(data)['rates']['CAD'];
  var inr = jsonDecode(data)['rates']['INR'];
  var gbp = jsonDecode(data)['rates']['GBP'];
  var eur = jsonDecode(data)['rates']['EUR'];
  var jpy = jsonDecode(data)['rates']['JPY'];


  cur.add(1);
  cur.add(usd);
  cur.add(cad);
  cur.add(inr);
  cur.add(gbp);
  cur.add(eur);
  cur.add(jpy);


    

  var newPriceItem1 = cur[i] * basePrice[0];
  var newPriceItem2 = cur[i] * basePrice[1];
  var newPriceItem3 = cur[i] * basePrice[2];
  var newPriceItem4 = cur[i] * basePrice[3];
  var newPriceItem5 = cur[i] * basePrice[4];
  var newPriceItem6 = cur[i] * basePrice[5];


  var roundedNewPrice1 = newPriceItem1.toStringAsFixed(2);
  var roundedNewPrice2 = newPriceItem2.toStringAsFixed(2);
  var roundedNewPrice3 = newPriceItem3.toStringAsFixed(2);
  var roundedNewPrice4 = newPriceItem4.toStringAsFixed(2);
  var roundedNewPrice5 = newPriceItem5.toStringAsFixed(2);
  var roundedNewPrice6 = newPriceItem6.toStringAsFixed(2);
  

  var priceItem1 = '$roundedNewPrice1';
  var priceItem2 = '$roundedNewPrice2';
  var priceItem3 = '$roundedNewPrice3';
  var priceItem4 = '$roundedNewPrice4';
  var priceItem5 = '$roundedNewPrice5';
  var priceItem6 = '$roundedNewPrice6';
  
      

  var currencyName = name[i];
  var currencySymbol = symbol[i];

  currencyInUse = currencyName;
  currencySymbolInUse = currencySymbol;



  currency['item1Small'] = '$currencySymbol$priceItem1 $currencyName';
  currency['item1Medium'] = '$currencySymbol$priceItem1 $currencyName';
  currency['item1Large'] = '$currencySymbol$priceItem1 $currencyName';

  currency['item2Small'] = '$currencySymbol$priceItem2 $currencyName';
  currency['item2Medium'] = '$currencySymbol$priceItem2 $currencyName';
  currency['item2Large'] = '$currencySymbol$priceItem2 $currencyName';

  currency['item3Small'] = '$currencySymbol$priceItem3 $currencyName';
  currency['item3Medium'] = '$currencySymbol$priceItem3 $currencyName';
  currency['item3Large'] = '$currencySymbol$priceItem3 $currencyName';

  currency['item4Small'] = '$currencySymbol$priceItem4 $currencyName';
  currency['item4Medium'] = '$currencySymbol$priceItem4 $currencyName';
  currency['item4Large'] = '$currencySymbol$priceItem4 $currencyName';

  currency['item5Small'] = '$currencySymbol$priceItem5 $currencyName';
  currency['item5Medium'] = '$currencySymbol$priceItem5 $currencyName';
  currency['item5Large'] = '$currencySymbol$priceItem5 $currencyName';

  currency['item6Small'] = '$currencySymbol$priceItem6 $currencyName';
  currency['item6Medium'] = '$currencySymbol$priceItem6 $currencyName';
  currency['item6Large'] = '$currencySymbol$priceItem6 $currencyName';

  await setCurrencyForSubtotalTile();

}

Future<void> setCurrencyForSubtotalTile() async{
  print('setCurrencyForSubtotalTile() called');

  final prefs = await SharedPreferences.getInstance();

  currency.forEach((k, v) {
    var f = v.substring(1, v.length - 4);
    var l = double.parse(f);
    priceToCalculateSubtotal[k] = l;

  });

  var total = 0.00;
  currency.keys.forEach((k) {
    var a = prefs.getInt(k); ///This is the number of items in cart saved in sharedPrev.
    if (a != null) {
      var b = a * priceToCalculateSubtotal[k];
      total = total + b; }
  });

  var totalToString = total.toStringAsFixed(2);

  cartSubtotal = '$currencySymbolInUse$totalToString $currencyInUse';


}


///---------------------------STOCK COUNT---------------------------------
Future<void> onChangedItemStock(String itemID, int value, BuildContext context) async {
  print('onChangedItemStock() called');

  final prefs = await SharedPreferences.getInstance();

  if (value <= stockLimit[itemID]) {
    ///------------------------------- item count saved and set
    stockInCart[itemID] = value;
    prefs.setInt(itemID, stockInCart[itemID]);
    ///-------------------------------

    setCurrencyForSubtotalTile();

    ///-------------------------------- if value = 0 the tile gets removed
    if (value == 0) {
      ///-----item gets removed from sharedPrev StringList
      var f = prefs.getStringList('currentItems');
      f.remove(itemID);
      prefs.setStringList('currentItems', f);
      ///-------------------------------------------------
      var r = itemTiles[itemID];
      var currentIndex = cartItems.indexOf(r);
      var itemToRemove = cartItems[currentIndex];

      listKey.currentState.removeItem(
        currentIndex,
            (BuildContext context, Animation<double> animation) => buildItem(context, itemToRemove, animation),
        duration: const Duration(milliseconds: 300),
      );

      cartItems.removeAt(currentIndex);

      if (cartItems.length == 1) {
        cartItems.removeLast();
        listKey.currentState.removeItem(
          0,
              (BuildContext context, Animation<double> animation) =>
              buildItem(context, subtotalContainer, animation),
          duration: const Duration(milliseconds: 0),
        );
        cartItems.add(yourCartIsEmpty());
        listKey.currentState.insertItem(0);
      }

      flushAllCurrencyStreamsInTiles();

      cartBadgeOnChanged(value);


    }
    ///------- if value > 0
    else {

      var r = itemTiles[itemID];
      var currentIndex = cartItems.indexOf(r);
      cartItems[currentIndex] = itemTiles[itemID];

      var locationSubtotal = cartItems.length - 1;
      cartItems.removeLast();
      listKey.currentState.removeItem(
        locationSubtotal,
            (BuildContext context, Animation<double> animation) =>
            buildItem(context, subtotalContainer, animation),
        duration: const Duration(milliseconds: 0),
      );


      Future.delayed(const Duration(milliseconds: 200), () {
        subtotalContainer = subtotal(cartSubtotal, context);
        cartItems.insert(locationSubtotal, subtotalContainer);
        listKey.currentState.insertItem(locationSubtotal);
      });


      flushAllCurrencyStreamsInTiles();
      cartBadgeOnChanged(value);



    }


///----------------------------------- value is more than stockLimit
  } else {

    ///------------------------- item count saved and set
    stockInCart[itemID] = stockLimit[itemID];
    prefs.setInt(itemID, stockInCart[itemID]);
    ///-------------------------


    setCurrencyForSubtotalTile();

    var r = itemTiles[itemID];
    var currentIndex = cartItems.indexOf(r);
    cartItems[currentIndex] = itemTiles[itemID];

    var locationSubtotal = cartItems.length - 1;
    cartItems.removeLast();
    listKey.currentState.removeItem(
      locationSubtotal,
          (BuildContext context, Animation<double> animation) =>
          buildItem(context, subtotalContainer, animation),
      duration: const Duration(milliseconds: 0),
    );


    Future.delayed(const Duration(milliseconds: 200), () {
      subtotalContainer = subtotal(cartSubtotal, context);
      cartItems.insert(locationSubtotal, subtotalContainer);
      listKey.currentState.insertItem(locationSubtotal);
    });

    flushAllCurrencyStreamsInTiles();
    cartBadgeOnChanged(stockInCart[itemID]);


  }

}

Future<void> subtractItemStock(String itemID, BuildContext context) async {
  print('subtractItemStock() called');
  final prefs = await SharedPreferences.getInstance();

  ///--------------------- item count saved and set
  var a = prefs.getInt(itemID);
  a --;
  prefs.setInt(itemID, a);
  stockInCart[itemID] = a;
 ///--------------------
 setCurrencyForSubtotalTile();

 ///-------------value = 0 item gets removed
  if (a == 0) {

    ///---------------------------------------- item removed from SharedPrev StringList
    var f = prefs.getStringList('currentItems');
    f.remove(itemID);
    prefs.setStringList('currentItems', f);
    ///-----------------------------------------
    var r = itemTiles[itemID];
    var currentIndex = cartItems.indexOf(r);
    var itemToRemove = cartItems[currentIndex];

    cartItems.removeAt(currentIndex);

    var locationSubtotal = cartItems.length - 1;

    cartItems.removeLast();

    listKey.currentState.removeItem(
      currentIndex,
          (BuildContext context, Animation<double> animation) => buildItem(context, itemToRemove, animation),
      duration: const Duration(milliseconds: 500),
    );

    listKey.currentState.removeItem(
      locationSubtotal,
          (BuildContext context, Animation<double> animation) =>
          buildItem(context, subtotalContainer, animation),
      duration: const Duration(milliseconds: 0),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      subtotalContainer = subtotal(cartSubtotal, context);
      cartItems.insert(locationSubtotal, subtotalContainer);
      listKey.currentState.insertItem(locationSubtotal);

      if (cartItems.length == 1) {
        cartItems.removeLast();
        listKey.currentState.removeItem(
          0,
              (BuildContext context, Animation<double> animation) =>
              buildItem(context, subtotalContainer, animation),
          duration: const Duration(milliseconds: 0),
        );
        cartItems.add(yourCartIsEmpty());
        listKey.currentState.insertItem(0);
      }
    });


    flushAllCurrencyStreamsInTiles();
    cartBadgeDecrease();

  ///----value > 0 item gets rebuild
  } else {

    var r = itemTiles[itemID];
    var currentIndex = cartItems.indexOf(r);

    cartItems[currentIndex] = itemTiles[itemID];

    var locationSubtotal = cartItems.length - 1;
    cartItems.removeLast();

    listKey.currentState.removeItem(
      locationSubtotal,
          (BuildContext context, Animation<double> animation) =>
          buildItem(context, subtotalContainer, animation),
      duration: const Duration(milliseconds: 0),
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      subtotalContainer = subtotal(cartSubtotal, context);
      cartItems.insert(locationSubtotal, subtotalContainer);
      listKey.currentState.insertItem(locationSubtotal);
    });

    flushAllCurrencyStreamsInTiles();
    cartBadgeDecrease();


  }


}

Future<void> addCartItem(String itemID, bool calledFromTile, BuildContext context) async {
  print('addCartItem() called');
  final prefs = await SharedPreferences.getInstance();

  var g = prefs.getInt(itemID);
  if (g == null) {
    g = 0;
  }

    ///------------------------------ item count set and saved
    var x = stockInCart[itemID] + 1;
    await prefs.setInt(itemID, x);
    stockInCart[itemID] = x;
    ///------------------------------

    ///------------------------------ setUp sharedPrev StringList
    var a = prefs.getStringList('currentItems');
    if (a == null) {
      await prefs.setStringList('currentItems', []);
      a = prefs.getStringList('currentItems');
    }
    ///------------------------------

    ///---------Existing item added
    if (a.contains(itemID)) {

      var r = itemTiles[itemID];
      var currentIndex = cartItems.indexOf(r);
      cartItems[currentIndex] = itemTiles[itemID];
      setCurrencyForSubtotalTile();

      if (calledFromTile == true) {
        var locationSubtotal = cartItems.length - 1;
        cartItems.removeLast();
        listKey.currentState.removeItem(
          locationSubtotal,
              (BuildContext context, Animation<double> animation) =>
              buildItem(context, subtotalContainer, animation),
          duration: const Duration(milliseconds: 0),
        );

         ///duration was 200 and crashed by rapid tapping
        Future.delayed(const Duration(milliseconds: 0), () {
          subtotalContainer = subtotal(cartSubtotal, context);
          cartItems.insert(locationSubtotal, subtotalContainer);
          listKey.currentState.insertItem(locationSubtotal);
        });
      }

      cartBadgeIncrease();
      ///duration was 200 and crashed by rapid tapping
      Future.delayed(const Duration(milliseconds: 0), () {
        Provider.of<DrawerProvider>(context, listen: false).cartToCart();
      });


    }
    ///----------------First item added
    else {
      ///--------------------------- first item added to sharedPref StringList
      a.add(itemID);
      await prefs.setStringList('currentItems', a);
      ///---------------------------

      cartItems.add(itemTiles[itemID]);
      setCurrencyForSubtotalTile();
      cartBadgeIncrease();
      ///duration was 200 and crashed by rapid tapping
      Future.delayed(const Duration(milliseconds: 0), () {
        Provider.of<DrawerProvider>(context, listen: false).cartToCart();
      });


    }


  }

Future<void> updateStockAndCartAfterOrderConfirmation() async {
  final prefs = await SharedPreferences.getInstance();

  itemListForCheckout.forEach((itemID) async {
    firestore.collection("Stock").doc('Items').update({
      '$itemID': stockLimit[itemID] - 1,
    });
    await prefs.setInt(itemID, 0);
    stockLimit[itemID] = stockLimit[itemID] -1;
    stockInCart[itemID] = 0;

  });
  await prefs.setStringList('currentItems', []);
  cartItems = [];
  dropdownItems = [];
  cartSubtotal = '';
  cartBadgeOnChanged(0);
  freeShipping = false;



}


///---------------------------Set Up---------------------------------
Future<void> setUpAfterStartup(BuildContext context) async {
  print('setUpAfterStartUp() Called');
  ///----StockSetUp--------------------------
  await updateStock();

  ///------CartSetUp--------------------------
  final prefs = await SharedPreferences.getInstance();
  var a = prefs.getStringList('currentItems');

  if (a == null) {
    await prefs.setStringList('currentItems', []);
    a = prefs.getStringList('currentItems');
  }


  a.forEach((k) async {
    if(stockLimit[k] == 0) {
      a.remove(k);
      await prefs.setStringList('currentItems', a);

    } else {
    cartItems.add(itemTiles[k]); }
  });

  ///------CurrenciesSetUp-----------------------
  // 0 = AUD
  // 1 = USD
  // 2 = CAD
  // 3 = INR
  // 4 = GBP
  // 5 = EUR
  // 6 = JPY
  var v = prefs.getInt('currencyInUse');
  if (v == null) {
    setCurrencyForSubtotalTile();
  } else {
    getCurrencyData(v);
  }
  await cartBadgeAfterStartup();

  Provider.of<DrawerProvider>(contextForBadgeProv, listen: false).cartToCart();
  if (await auth.currentUser != null) {
    userLoggedIn = true;
    getUserDetails();
  }


}

Future<void> updateStock() async{
  print('updateStockLimit() called');

  await getStockLimitFromFirestore();

  final prefs = await SharedPreferences.getInstance();

  stockInCart.keys.forEach((k) {
    var a = prefs.getInt(k);
    if(a == null) {a = 0;}
    stockInCart[k] = a;
  });

  stockInCart.keys.forEach((k) {
    if(stockInCart[k] > stockLimit[k]) {
      stockInCart[k] = stockLimit[k];
      prefs.setInt(k, stockInCart[k]);

      scaffoldKey.currentState
          .showSnackBar(SnackBar(
          content: Text('Stock has been updated, your cart had been adjusted', textAlign: TextAlign.center,)));

      cartHasBeenAdjusted = true;
    }
  });
}

Future<void> getStockLimitFromFirestore() async{
  print('getStockLimitFromFirestore() called');
  final firestore = FirebaseFirestore.instance;
  
  var stockList = await firestore.collection('Stock').get();
  
  for (var a in stockList.docs) {
    var b = Map<String, int>.from(a.data());
    stockLimit = b;
  }


}

///---------------------------Links-------------------------------
void launchURL(String url) async {
print('launch');
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
///---------------------------User Info----------------------------

Future<void> getUserDetails() async {
  print('getUserDetails() called');
  final User user = await auth.currentUser;
  final uid = user.uid;
// leave out doc. to go back to previous
  final v = await firestore.collection('UserData').doc('$uid').get().then((value) async {

   // List<UserDetails> _nameList = [];

    //value.docs.forEach((result) {


    value.data().forEach((key, value) {
      print('$key $value');
      // UserDetails name = UserDetails.fromMap(key.data()); //result.data()
      //
      // _nameList.add(name);


      switch (key) {

        case 'Email':
          email = value;
          break;

        case 'FirstName':
          firstName = value;
          break;

        case 'LastName':
          lastName = value;
          break;

        case 'Street':
          street = value;
          break;

        case 'Place':
          place = value;
          break;

        case 'Postcode':
          postcode = value;
          break;

        case 'Country':
          country = value;
          break;

        case 'State':
          state = value;
          break;

        case 'Apartment':
          apartment = value;
          break;




      }
    });

      // UserDetails name = UserDetails.fromMap(value.data()); //result.data()
      //
      // _nameList.add(name);


    //});
    //final prefs = await SharedPreferences.getInstance();


    // var iFirstName = _nameList[0].firstName;
    // var iLastName = _nameList[0].lastName;
    // var iEmail = _nameList[0].email;
    // var iStreet = _nameList[0].street;
    // var iPlace = _nameList[0].place; //prefs.getString('place')
    // var iPostcode = _nameList[0].postcode;
    // var iCountry = _nameList[0].country;
    // var iApartment = _nameList[0].apartment;
    // var iState = _nameList[0].state;

    // lastName = iLastName;
    // firstName = iFirstName;
    // email = iEmail;
    // street = iStreet;
    // place = iPlace;
    // postcode = iPostcode;
    // fullName = '$iFirstName $iLastName';
    // country = iCountry;
    // state = iState;
    // apartment = iApartment;

    fullName = '$firstName $lastName';

    print('User ID: $uid');
    print('These are the user details fetched from fire base: $firstName, $lastName, $email, $fullName');
    print('These are the users shipping details fetched from fire base: $street, $place, $postcode, $country, $state, $apartment');

    setFullNameInSP(fullName);


  });



}

Future<void> addNewUserDetailsToFireStore() async {
  final User user = await auth.currentUser;
  final uid = user.uid;



//switch userDetails and $uid to go back to previous setup

  firestore.collection("UserData").doc('$uid').set({
    'FirstName': firstName,
    'LastName': lastName,
    'Email': email,
    'Password': password,

  });
}

Future<void> addShippingDetailsToFireStore() async {
  final User user = await auth.currentUser;
  final uid = user.uid;

  firestore.collection("UserData").doc('$uid').update({
    'Street': street,
    'Place': place,
    'Postcode': postcode,
    'Apartment': apartment,
    'Country': country,
    'State': state
  });

}

Future<void> setFullNameInSP(String name) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', name);
}


