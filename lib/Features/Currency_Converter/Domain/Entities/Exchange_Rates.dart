import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ExchangeRates extends Equatable {

  final double rateUSD;
  final double rateCAN;
  final double rateINR;
  final double rateGBP;
  final double rateEUR;
  final double rateJPY;

  ExchangeRates({
    @required this.rateUSD,
    @required this.rateCAN,
    @required this.rateINR,
    @required this.rateGBP,
    @required this.rateEUR,
    @required this.rateJPY,
  });

  @override
  List<Object> get props => [rateUSD,rateCAN,rateINR,rateGBP,rateEUR,rateJPY];
}