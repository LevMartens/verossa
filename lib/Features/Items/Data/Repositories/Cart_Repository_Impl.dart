import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:verossa/Core/Network/Network_Info.dart';

import 'package:verossa/Features/Items/Data/Data_Sources/Cart_Local_Data_Source.dart';
import 'package:verossa/Features/Items/Data/Data_Sources/Cart_Local_Data_Source.dart';
import 'package:verossa/Features/Items/Domain/Entities/Cart.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Cart_Repository.dart';
import 'package:verossa/Features/Items/Presentation/Item_Model.dart';

import 'package:verossa/Features/Items/Domain/Repositories/Cart_Repository.dart';
import 'package:verossa/Features/Items/Data/Data_Sources/Cart_Local_Data_Source.dart';
import 'package:verossa/Features/Items/Data/Repositories/Cart_Repository_Impl.dart';
import 'package:verossa/Features/Items/Data/Models/Cart_Model.dart';
import 'package:verossa/Features/Items/Domain/Entities/Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Get_Items_From_Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Item_To_Cart.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  CartRepositoryImpl({
    @required this.localDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, Cart>> getItemsFromCart() async {
    return await _getCartContent();
  }



  Future<Either<Failure, Cart>> _getCartContent() async {

    try {
      final localCartContent = await localDataSource.getCartContent();
      return Right(localCartContent);
    } on CacheException {
      return Left(CacheFailure());
    }

  }

  @override
  void setItemToCart(Map<int,int> map) {
    localDataSource.cacheCartContent(map);

  }
}