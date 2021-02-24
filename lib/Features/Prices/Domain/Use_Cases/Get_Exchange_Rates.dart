import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'package:verossa/Features/Prices/Domain/Entities/Exchange_Rates.dart';
import 'package:verossa/Features/Prices/Domain/Repositories/Exchange_Rate_Repository.dart';

class GetExchangeRates implements UseCase<ExchangeRates, NoParams> {
  final ExchangeRatesRepository repository;

  GetExchangeRates(this.repository);

  @override
  Future<Either<Failure, ExchangeRates>> call(NoParams params) async {
    return await repository.getExchangeRates();
  }




}