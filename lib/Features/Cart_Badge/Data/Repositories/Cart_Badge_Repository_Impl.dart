import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Error/Exeptions.dart';
import 'package:verossa/Core/Network/Network_Info.dart';

import 'package:verossa/Features/Cart_Badge/Data/Data_Sources/Cart_Badge_Local_Data_Source.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Repositories/Cart_Badge_Repository.dart';



class CartBadgeRepositoryImpl implements CartBadgeRepository {
  final CartBadgeLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CartBadgeRepositoryImpl({
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, CartBadge>> getCartBadgeNumber() async {
    return await _getCartBadgeCount();
  }



  Future<Either<Failure, CartBadge>> _getCartBadgeCount() async {

      try {
        final localCartBadgeNumber = await localDataSource.getCartBadgeNumber();
        return Right(localCartBadgeNumber);
      } on CacheException {
        return Left(CacheFailure());
      }

  }

  @override
  void setCartBadgeNumber(int count) {
    localDataSource.cacheCartNumber(count);

  }
}