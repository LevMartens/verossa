import 'dart:convert';

import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';

import 'package:verossa/Features/Cart_Badge/Data/Models/Cart_Badge_Model.dart';

abstract class CartBadgeLocalDataSource {
 
  /// Throws [CacheException] if no data is present.
  Future<CartBadgeModel> getCartBadgeNumber();

  Future<void> cacheCartNumber(int count);
}

const CURRENT_CART_COUNT = 'CURRENT_CART_COUNT';

class CartBadgeLocalDataSourceImpl implements CartBadgeLocalDataSource {
  final SharedPreferences sharedPreferences;

  CartBadgeLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<CartBadgeModel> getCartBadgeNumber() {
    final currentCartCount = sharedPreferences.getInt(CURRENT_CART_COUNT);
    if (currentCartCount != null) {
      return Future.value(CartBadgeModel.fromSharedPreferences(currentCartCount));
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheCartNumber(int count) {
    return sharedPreferences.setInt(
      CURRENT_CART_COUNT,
      count
    );
  }
}