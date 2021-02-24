import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';

import 'package:verossa/Features/Prices/Domain/Entities/Exchange_Rates.dart';

abstract class ExchangeRatesRepository {
  Future<Either<Failure, ExchangeRates>> getExchangeRates();

}