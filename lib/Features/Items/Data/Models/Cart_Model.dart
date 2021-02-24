import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Features/Items/Domain/Entities/Cart.dart';

class CartModel extends Cart {
  CartModel({

    @required Map<int,int> map,
  }) : super(map: map);

  factory CartModel.fromSharedPreferences(Map<int,int> map) {
    return CartModel(map: map);
  }


}
