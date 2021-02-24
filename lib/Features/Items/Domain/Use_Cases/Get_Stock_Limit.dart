import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';


import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Stock_Limit_Repository.dart';

class GetStockLimit implements UseCase<StockLimit, NoParams> {
  final StockLimitRepository repository;

  GetStockLimit(this.repository);

  @override
  Future<Either<Failure, StockLimit>> call(NoParams params) async {
    return await repository.getStockLimit();
  }




}