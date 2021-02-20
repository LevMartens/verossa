import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Features/App_Bar/Domain/Entities/Cart_Badge.dart';

abstract class CartBadgeRepository {
  Future<Either<Failure, CartBadge>> getCartBadgeNumber();
  void setCartBadgeNumber(int count);
}