import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/App_Bar/Domain/Entities/Cart_Badge.dart';
import 'package:verossa/Features/App_Bar/Domain/Repositories/Cart_Badge_Repository.dart';

class GetCartBadgeNumber implements UseCase<CartBadge, NoParams> {
  final CartBadgeRepository repository;

  GetCartBadgeNumber(this.repository);

  @override
  Future<Either<Failure, CartBadge>> call(NoParams params) async {
    return await repository.getCartBadgeNumber();
  }
}