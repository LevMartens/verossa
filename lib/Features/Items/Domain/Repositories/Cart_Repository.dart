import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';

import 'package:verossa/Features/Items/Domain/Entities/Cart.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getItemsFromCart();
  void setItemToCart(Map<int,int> map);
}