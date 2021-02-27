import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Core/Util/Did_Finish_Launching_With_Options.dart';
import 'package:verossa/Features/Cart_Badge/Presentation/Cart_Badge_Provider.dart';
import 'dart:async';
import 'package:verossa/Features/Items/Domain/Use_Cases/Get_Items_From_Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Get_Stock_Limit.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Item_To_Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Stock_Limit.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'Item_Factory.dart';
import 'Util/Hero_Container_Widget.dart';

class ItemProvider extends ChangeNotifier {
  final ItemFactory factory;


  double opacityOne = 1.0;
  double opacityTwo = 0.8;
  double opacityThree = 0.8;
  double opacityFour = 0.8;

  bool startImageOne = false;
  bool onImageA = true;
  bool onImageB = false;
  bool onImageC = false;


  HeroContainer imageFirst;
  HeroContainer imageSecond;



  Map<int,int> stockLimits;
  Map<int,int> cartContentMap;
  Map<int,int> setupMap = {
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0,
    8: 0,
    9: 0,
    10: 0,
    11: 0,
    12: 0,
    13: 0,
    14: 0,
    15: 0,
    16: 0,
    17: 0,
    18: 0,
  };

  final GetStockLimit getStockLimit;
  final SetStockLimit setStockLimit;
  final GetItemsFromCart getItemsFromCart;
  final SetItemsToCart setItemsToCart;
  final InputConverter inputConverter;

  Future<void> getCartContents() async {
    final failureOrCartContent = await getItemsFromCart(NoParams());
    final newCartContent = failureOrCartContent.fold((failure) => 'No Map', (
        cart) => cart.map);

    if (newCartContent == 'No Map') {

      setItemsToCart(Params(map: setupMap));
      cartContentMap = setupMap;

    } else {
      cartContentMap = newCartContent;
    }

  }

  ItemProvider({

    @required ItemFactory factory,
    @required GetItemsFromCart getItemsFromCart,
    @required SetItemsToCart setItemsToCart,
    @required GetStockLimit getStockLimit,
    @required SetStockLimit setStockLimit,
    @required this.inputConverter,
  })
      : assert(factory != null),
        assert(getItemsFromCart != null),
        assert(setItemsToCart != null),
        assert(getStockLimit != null),
        assert(setStockLimit != null),
        assert(inputConverter != null),
        factory = factory,
        getStockLimit = getStockLimit,
        setStockLimit = setStockLimit,
        getItemsFromCart = getItemsFromCart,
        setItemsToCart = setItemsToCart;


  void setupProviderForItem(ItemModel itemModel) {
    imageFirst = HeroContainer(assetImage: itemModel.itemImage);
    imageSecond = HeroContainer(assetImage: itemModel.itemImageBW);

  }

  void displayFirstImage(HeroContainer a, HeroContainer b, HeroContainer c) {
    if (onImageA == true) {} else {
      onImageA = true;
      onImageB = false;
      onImageC = false;

      opacityOne = 1.0;
      opacityTwo = 0.7;
      opacityThree = 0.7;


      if (startImageOne == false) {
        imageSecond = a;
        startImageOne = true;
        notifyListeners();
      } else {
        imageFirst = a;
        startImageOne = false;
        notifyListeners();
      }
    }
  }

  void displaySecondImage(HeroContainer a, HeroContainer b, HeroContainer c) {
    if (onImageB == true) {} else {
      onImageA = false;
      onImageB = true;
      onImageC = false;

      opacityOne = 0.7;
      opacityTwo = 1.0;
      opacityThree = 0.7;

      if (startImageOne == false) {
        //load up second image
        imageSecond = b;
        startImageOne = true;
        notifyListeners();
      } else {
        //load up first image
        imageFirst = b;
        startImageOne = false;
        notifyListeners();
      }
    }
  }

  void displayThirdImage(HeroContainer a, HeroContainer b, HeroContainer c) {
    if (onImageC == true) {} else {
      onImageA = false;
      onImageB = false;
      onImageC = true;
      opacityOne = 0.7;
      opacityTwo = 0.7;
      opacityThree = 1.0;

      if (startImageOne == false) {
        imageSecond = c;
        startImageOne = true;
        notifyListeners();
      } else {

        imageFirst = c;
        startImageOne = false;
        notifyListeners();
      }
    }
  }

  Future<void> setCartContents(Map<int,int> map) async {
    setItemsToCart(Params(map: map));
  }

  Future<Map<int,int>> returnCartContent() async {
    final failureOrCartContent = await getItemsFromCart(NoParams());
    final newCartContent = failureOrCartContent.fold((failure) => {}, (cart) => cart.map);


    return newCartContent;
  }

  Future<String> addItemToCart(int itemID, int count ,BuildContext context) async {
     await getCartContents();
     await getStockLimitFromFS();

    Map<String,int> stringKeyCartContent = cartContentMap.map((a, b) => MapEntry(a.toString(), b ));
    Map<String,int> stringKeyStockLimits = stockLimits.map((a, b) => MapEntry(a.toString(), b ));


    if (stringKeyCartContent['$itemID'] >=
        stringKeyStockLimits['$itemID']) {

      return 'Sold Out';

    } else {

      if (stringKeyCartContent['$itemID'] + count >= stringKeyStockLimits['$itemID']) {

        count = stringKeyStockLimits['$itemID'];
      }

      /// Add item to Cart
      var a = stringKeyCartContent['$itemID'] + count;
      stringKeyCartContent['$itemID'] = a;
      var cartContent = stringKeyCartContent.map((a, b) => MapEntry(int.parse(a), b ));
      setCartContents(cartContent);

      /// Subtract item from stock limit
      var b = stringKeyStockLimits['$itemID'] - count;
      stringKeyStockLimits['$itemID'] = b;
      var stockLim = stringKeyStockLimits.map((a, b) => MapEntry(int.parse(a), b ));
      setStockLimitToFS(stockLim);

      /// Update Cart Badge
      Provider.of<CartBadgeProvider>(context, listen: false).updateCartBadgeCountWith(count);

    }

    return 'Sold Out';
  }

  Future<void> getStockLimitFromFS() async{
    final failureOrCartContent = await getStockLimit(NoParams());
    final newStockLimit = failureOrCartContent.fold((failure) => {}, (stockLimit) => stockLimit.map);

    if (newStockLimit == {}) {
      print('Error: Fetching Stock data from FS');
    } else {

      stockLimits = newStockLimit;
    }

  }

  Future<void> setStockLimitToFS(Map<int,int> map) async {

    setStockLimit(Params(map: map));
  }

  Future<String> updateCartAfterStartUp() async {

    bool cartHasBeenUpdated;
    cartContentMap.keys.forEach((k) {
      if(cartContentMap[k] > stockLimits[k]) {
        cartContentMap[k] = stockLimits[k];

        cartHasBeenUpdated = true;
      }
    });

    if (cartHasBeenUpdated == true) {

      setCartContents(cartContentMap);
      di.sl<DidFinishLaunchingWithOptions>().cartUpdated = true;
      return 'Done';
    } else {
      di.sl<DidFinishLaunchingWithOptions>().cartUpdated = false;
      return 'Not Done';}

  }




}

