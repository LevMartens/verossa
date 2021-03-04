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
import 'package:verossa/Features/Items/Presentation/Widgets/Item_Drawer_Tile_Widget.dart';
import 'package:verossa/Features/Items/Presentation/Widgets/Item_Summary_DD_Tile.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';
import 'package:verossa/Features/Prices/Presentation/Subtotal_&_Checkout_Widget.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';
import 'Item_Factory.dart';
import 'Widgets/Small_Widgets/Hero_Container_Widget.dart';

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
  Map<int, int> stockLimits;
  Map<int, int> cartContentMap;
  Map<int, int> setupMap = {
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
  int indexToRemove;
  List<DrawerObject> currentItemTilesList = [];
  List<Widget> checkoutDDItems = [];
  Map<String, ItemDrawerTile> itemTilesMap = {};
  final GetStockLimit getStockLimit;
  final SetStockLimit setStockLimit;
  final GetItemsFromCart getItemsFromCart;
  final SetItemsToCart setItemsToCart;
  final InputConverter inputConverter;

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

  Future<void> setCartContents(Map<int, int> map) async {
    setItemsToCart(Params(map: map));
  }

  Future<Map<int, int>> returnCartContent() async {
    final failureOrCartContent = await getItemsFromCart(NoParams());
    final newCartContent = failureOrCartContent.fold((failure) => {}, (
        cart) => cart.map);
    return newCartContent;
  }

  Future<String> addItemToCart(int itemID, int count, BuildContext context,
      ItemModel itemModel, String itemFilter) async {
    var cartContent;
    bool firstAdd = false;

    Map<String, int> stringKeyCartContent = cartContentMap.map((a, b) =>
        MapEntry(a.toString(), b));
    Map<String, int> stringKeyStockLimits = stockLimits.map((a, b) =>
        MapEntry(a.toString(), b));

    if (stringKeyCartContent['$itemID'] == 0) {
      firstAdd = true;
    }
    if (stringKeyStockLimits['$itemID'] == 0) {
      return 'Sold Out';
    } else {

      /// Add item to Cart
      var a = stringKeyCartContent['$itemID'] + count;
      stringKeyCartContent['$itemID'] = a;
      cartContent = stringKeyCartContent.map((a, b) =>
          MapEntry(int.parse(a), b));
      setCartContents(cartContent);

      /// Subtract item from stock limit
      var b = stringKeyStockLimits['$itemID'] - count;
      stringKeyStockLimits['$itemID'] = b;
      var stockLim = stringKeyStockLimits.map((a, b) =>
          MapEntry(int.parse(a), b));
      setStockLimitToFS(stockLim);

      cartContentMap = stringKeyCartContent.map((a, b) =>
          MapEntry(int.parse(a), b));
      stockLimits = stringKeyStockLimits.map((a, b) =>
          MapEntry(int.parse(a), b));

      /// Update Cart Badge
      Provider.of<CartBadgeProvider>(context, listen: false)
          .updateCartBadgeCountWith(cartContent);

      /// Add drawer tile
      if (firstAdd == true) {
        if (currentItemTilesList.isEmpty) {
          currentItemTilesList.add(Checkout());
        }
        var indexToInsert = currentItemTilesList.length - 1;
        currentItemTilesList.insert(indexToInsert, ItemDrawerTile(
          item: itemModel, itemFilter: itemFilter, id: itemID,));
      }

      /// Recalculate total
      await Provider.of<PricesProvider>(context, listen: false)
          .setCurrencyForTotalTo(context);
      notifyListeners();
      return '${stringKeyCartContent['$itemID']}';
    }
  }

  Future<String> subtractItemInCart(int itemID, BuildContext context,) async {
    Map<String, int> stringKeyCartContent = cartContentMap.map((a, b) =>
        MapEntry(a.toString(), b));
    Map<String, int> stringKeyStockLimits = stockLimits.map((a, b) =>
        MapEntry(a.toString(), b));


    if (stringKeyCartContent['$itemID'] == 0) {
      return '0';
    } else {

      /// Subtract item in Cart
      var a = stringKeyCartContent['$itemID'] - 1;
      stringKeyCartContent['$itemID'] = a;
      var cartContent = stringKeyCartContent.map((a, b) =>
          MapEntry(int.parse(a), b));
      setCartContents(cartContent);

      /// Subtract item from stock limit
      var b = stringKeyStockLimits['$itemID'] + 1;
      stringKeyStockLimits['$itemID'] = b;
      var stockLim = stringKeyStockLimits.map((a, b) =>
          MapEntry(int.parse(a), b));
      setStockLimitToFS(stockLim);

      cartContentMap = stringKeyCartContent.map((a, b) =>
          MapEntry(int.parse(a), b));
      stockLimits = stringKeyStockLimits.map((a, b) =>
          MapEntry(int.parse(a), b));

      /// Update Cart Badge
      Provider.of<CartBadgeProvider>(context, listen: false)
          .updateCartBadgeCountWith(cartContent);

      /// Remove Tile
      if (stringKeyCartContent['$itemID'] == 0) {
        if (currentItemTilesList.length != 1) {
          for (var i = 0; i < currentItemTilesList.length - 1; i++) {
            if (itemID == (currentItemTilesList[i] as ItemDrawerTile).id) {
              indexToRemove = i;
              notifyListeners();
            }
          }
        }
      }

      /// Recalculate total
      await Provider.of<PricesProvider>(context, listen: false)
          .setCurrencyForTotalTo(context);
      notifyListeners();
      return 'Subtract Successful';
    }
  }

  Future<String> onChanged(int itemID, int count, BuildContext context) async {
    var itemCount = count;

    Map<String, int> stringKeyCartContent = cartContentMap.map((a, b) =>
        MapEntry(a.toString(), b));
    Map<String, int> stringKeyStockLimits = stockLimits.map((a, b) =>
        MapEntry(a.toString(), b));

    stringKeyStockLimits['$itemID'] =
        stringKeyStockLimits['$itemID'] + stringKeyCartContent['$itemID'];
    stringKeyCartContent['$itemID'] = 0;

    if (count >=
        stringKeyStockLimits['$itemID']) {
      itemCount = stringKeyStockLimits['$itemID'];
    }

    /// Add item to Cart
    var a = stringKeyCartContent['$itemID'] + itemCount;
    stringKeyCartContent['$itemID'] = a;
    var cartContent = stringKeyCartContent.map((a, b) =>
        MapEntry(int.parse(a), b));
    setCartContents(cartContent);

    /// Subtract item from stock limit
    var b = stringKeyStockLimits['$itemID'] - itemCount;
    stringKeyStockLimits['$itemID'] = b;
    var stockLim = stringKeyStockLimits.map((a, b) =>
        MapEntry(int.parse(a), b));
    setStockLimitToFS(stockLim);

    cartContentMap = stringKeyCartContent.map((a, b) =>
        MapEntry(int.parse(a), b));
    stockLimits = stringKeyStockLimits.map((a, b) =>
        MapEntry(int.parse(a), b));

    /// Update Cart Badge
    Provider.of<CartBadgeProvider>(context, listen: false)
        .updateCartBadgeCountWith(cartContent);

    /// Remove Tile
    if (stringKeyCartContent['$itemID'] == 0) {
      currentItemTilesList.remove(itemTilesMap['$itemID']);
      if (currentItemTilesList.length == 1) {
        currentItemTilesList.removeLast();
      }
    }

    /// Recalculate total
    await Provider.of<PricesProvider>(context, listen: false)
        .setCurrencyForTotalTo(context);
    notifyListeners();
    return '${stringKeyCartContent['$itemID']}';
  }

  Future<void> getStockLimitFromFS() async {
    final failureOrCartContent = await getStockLimit(NoParams());
    final newStockLimit = failureOrCartContent.fold((failure) => {}, (
        stockLimit) => stockLimit.map);
    if (newStockLimit == {}) {
      print('Error: Fetching Stock data from FS');
    } else {
      stockLimits = newStockLimit;
      print('getStockLimitFromFS success $stockLimits');
    }
  }

  Future<void> setStockLimitToFS(Map<int, int> map) async {
    setStockLimit(Params(map: map));
  }

  Future<String> updateCartAfterStartUp() async {
    bool cartHasBeenUpdated;
    cartContentMap.keys.forEach((k) {
      if (cartContentMap[k] > stockLimits[k]) {
        cartContentMap[k] = stockLimits[k];
        cartHasBeenUpdated = true;
      }
    });
    if (cartHasBeenUpdated == true) {
      setCartContents(cartContentMap);
      di
          .sl<DidFinishLaunchingWithOptions>()
          .cartUpdated = true;
      return 'Done';
    } else {
      di
          .sl<DidFinishLaunchingWithOptions>()
          .cartUpdated = false;
      return 'Not Done';
    }
  }

  List<ItemModel> getItemsInList() {
    List<ItemModel> itemList = [
      factory.item1,
      factory.item2,
      factory.item3,
      factory.item4,
      factory.item5,
      factory.item6,
    ];
    return itemList;
  }

  void addItemTilesToListAfterStartUp() {
    var addCheckOut;
    for (var i = 1; i < cartContentMap.length; i++) {
      var map = factory.getItemModelWithID(i);
      if (cartContentMap[i] != 0) {
        itemTilesMap['$i'] = ItemDrawerTile(
            item: map['itemModel'], itemFilter: map['itemFilter'], id: i);
        currentItemTilesList.add(itemTilesMap['$i']);
        addCheckOut = true;
      }
    }
    if (addCheckOut == true) {
      currentItemTilesList.add(Checkout());
    }
  }

  void indexBackToNull() {
    indexToRemove = null;
  }

  void updateTileList(List<dynamic> list) {
    currentItemTilesList = list;
  }

  Future<List<Widget>> buildCheckoutSummary() async {
    for (var i = 1; i < cartContentMap.length; i++) {
      var map = factory.getItemModelWithID(i);
      if (cartContentMap[i] != 0) {
        var numberOfItems = cartContentMap[i];
        var priceSingleItem = map['itemModel'].priceAUD;
        var priceTotalItems = (numberOfItems * priceSingleItem).toStringAsFixed(
            2);
        var totalPriceAsString = '\$$priceTotalItems AUD';
        var newItemDDTile = ItemDDTile(
            item: map['itemModel'],
            numberOfItems: numberOfItems,
            totalPrice: totalPriceAsString,
            itemFilter: map['itemFilter']);
        checkoutDDItems.add(newItemDDTile);
      }
    }
    return checkoutDDItems;
  }

  void updateCartAfterOrderConfirmation() {
    setCartContents(setupMap);
    cartContentMap = setupMap;
  }
}

