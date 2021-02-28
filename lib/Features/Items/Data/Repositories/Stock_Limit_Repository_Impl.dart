import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/Items/Data/Data_Sources/Stock_Limit_Remote_Data_Source.dart';
import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Stock_Limit_Repository.dart';


class StockLimitRepositoryImpl implements StockLimitRepository {
  final StockLimitRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  StockLimitRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, StockLimit>> getStockLimit() async {
    return await _getStock();
  }



  Future<Either<Failure, StockLimit>> _getStock() async {

    try {
      final remoteStock = await remoteDataSource.getStock();
      return Right(remoteStock);
    } on CacheException {
      return Left(CacheFailure());
    }

  }

  @override
  void setStock(Map<int,int> map) {
    remoteDataSource.saveStock(map);

  }
}