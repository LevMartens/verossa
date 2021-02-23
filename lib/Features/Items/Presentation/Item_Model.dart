
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

class ItemModel extends IItemBaseModel {
  int itemIDForNormal;
  int itemIDForBW;
  int itemIDForCF;
  String titleAllCaps;
  String title;
  String description;
  AssetImage itemImage;
  AssetImage itemImageCF;
  AssetImage itemImageBW;
  StreamController streamController;

  ItemModel({
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
  });
}

class ItemTileModel {
  IItemBaseModel itemModel;

  ItemTileModel({
    @required this.itemModel,
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

