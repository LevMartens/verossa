import 'dart:convert';

import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';

import 'package:verossa/Features/Cart_Badge/Data/Models/Cart_Badge_Model.dart';
import 'package:verossa/Features/Items/Data/Models/Cart_Model.dart';

abstract class CartLocalDataSource {

  /// Throws [CacheException] if no data is present.
  Future<CartModel> getCartContent();

  Future<void> cacheCartContent(Map<int,int> map);
}

const CART_MAP = 'CART_MAP';


class CartLocalDataSourceImpl implements CartLocalDataSource {
  final SharedPreferences sharedPreferences;

  CartLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<CartModel> getCartContent() {


      final currentCartContent = sharedPreferences.getString(CART_MAP);


    if (currentCartContent != null) {


      Map<String,int> map = Map<String,int>.from(jsonDecode(currentCartContent));
      Map<int,int> linkedHashMap = map.map((a, b) => MapEntry(int.parse(a), b ));

      return Future.value(CartModel.fromSharedPreferences(linkedHashMap));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCartContent(Map<int, int> map) {



    Map<String,dynamic> linkedHashMap = map.map((a, b) => MapEntry(a.toString(), b as dynamic));

    String encoded = jsonEncode(linkedHashMap);
    return sharedPreferences.setString(
        CART_MAP,
        encoded,
    );
  }
}