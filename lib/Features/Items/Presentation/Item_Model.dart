
import 'dart:async';

import 'package:flutter/cupertino.dart';

abstract class IItemBaseModel {

  int itemIDForNormal;
  int itemIDForBW;
  int itemIDForCF;
  String title;
  String titleAllCaps;
  String description;
  AssetImage itemImage;
  AssetImage itemImageCF;
  AssetImage itemImageBW;
  StreamController streamController;

}

abstract class DrawerObject {

}

class ItemModel extends IItemBaseModel {
  int itemIDForNormal;
  int itemIDForBW;
  int itemIDForCF;
  double priceAUD;
  String titleAllCaps;
  String title;
  String description;
  AssetImage itemImage;
  AssetImage itemImageCF;
  AssetImage itemImageBW;
  StreamController streamController;
  String route;
  String subtitle;
  String itemNumber;

  ItemModel({
    @required this.itemNumber,
    @required this.subtitle,
    @required this.route,
    @required this.itemIDForNormal,
    @required this.itemIDForBW,
    @required this.itemIDForCF,
    @required this.title,
    @required this.titleAllCaps,
    @required this.description,
    @required this.itemImage,
    @required this.itemImageBW,
    @required this.itemImageCF,
    @required this.streamController,
    @required this.priceAUD,
  });
}

class ItemTileModel {
  IItemBaseModel itemModel;
  final itemFilter;
  final indexToInsert;

  ItemTileModel({
    @required this.itemModel,
    @required this.itemFilter,
    @required this.indexToInsert,
  });
}

class ItemPageModel {

  IItemBaseModel itemModel;

  ItemPageModel({
    @required this.itemModel,
  });
}

class Item {

  ItemModel itemModel;
  ItemTileModel itemTileModel;
  ItemPageModel itemPageModel;

  Item({
    @required this.itemModel,
  });
}

