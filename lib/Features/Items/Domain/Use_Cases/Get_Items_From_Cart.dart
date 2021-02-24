import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Repositories/Cart_Badge_Repository.dart';
import 'package:verossa/Features/Items/Domain/Entities/Cart.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Cart_Repository.dart';

class GetItemsFromCart implements UseCase<Cart, NoParams> {
  final CartRepository repository;

  GetItemsFromCart(this.repository);

  @override
  Future<Either<Failure, Cart>> call(NoParams params) async {
    return await repository.getItemsFromCart();
  }




}