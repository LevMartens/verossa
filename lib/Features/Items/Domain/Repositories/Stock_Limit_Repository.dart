import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';

import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';
//import 'package:verossa/Features/Items/Presentation/Stock_Limit_Model.dart';

abstract class StockLimitRepository {
  Future<Either<Failure, StockLimit>> getStockLimit();
  void setStock(Map<int,int> map);
}