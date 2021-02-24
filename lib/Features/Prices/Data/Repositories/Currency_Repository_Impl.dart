import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:verossa/Core/Network/Network_Info.dart';

import 'package:verossa/Features/Cart_Badge/Data/Data_Sources/Cart_Badge_Local_Data_Source.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Repositories/Cart_Badge_Repository.dart';
import 'package:verossa/Features/Prices/Data/Data_Sources/Currency_Remote_Data_Source.dart';
import 'package:verossa/Features/Prices/Domain/Entities/Exchange_Rates.dart';
import 'package:verossa/Features/Prices/Domain/Repositories/Exchange_Rate_Repository.dart';

import 'package:verossa/Features/Items/Domain/Repositories/Cart_Repository.dart';
import 'package:verossa/Features/Items/Data/Data_Sources/Cart_Local_Data_Source.dart';
import 'package:verossa/Features/Items/Data/Repositories/Cart_Repository_Impl.dart';
import 'package:verossa/Features/Items/Data/Models/Cart_Model.dart';
import 'package:verossa/Features/Items/Domain/Entities/Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Get_Items_From_Cart.dart';
import 'package:verossa/Features/Items/Domain/Use_Cases/Set_Item_To_Cart.dart';



class ExchangeRatesRepositoryImpl implements ExchangeRatesRepository {
  final ExchangeRatesRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ExchangeRatesRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, ExchangeRates>> getExchangeRates() async {
    return await _getExchangeRates();
  }



  Future<Either<Failure, ExchangeRates>> _getExchangeRates() async {

    try {
      final remoteExchangeRates = await remoteDataSource.getExchangeRates();
      return Right(remoteExchangeRates);
    } on CacheException {
      return Left(CacheFailure());
    }

  }


}