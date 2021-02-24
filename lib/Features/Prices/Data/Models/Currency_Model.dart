import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Features/Prices/Domain/Entities/Exchange_Rates.dart';

class ExchangeRatesModel extends ExchangeRates {


  ExchangeRatesModel({
    @required double rateUSD,
    @required double rateCAN,
    @required double rateINR,
    @required double rateGBP,
    @required double rateEUR,
    @required double rateJPY,
  }) : super(rateUSD: rateUSD, rateCAN: rateCAN, rateINR: rateINR, rateGBP: rateGBP, rateEUR: rateEUR, rateJPY: rateJPY,);

  factory ExchangeRatesModel.fromJson(dynamic json) {

    print('TEST RATE .${json['rates']['USD']}.');
    double l = json['rates']['USD'];
    print('this is l: $l');
    return ExchangeRatesModel(
      rateUSD: json['rates']['USD'],
      rateCAN: json['rates']['CAN'],
      rateINR: json['rates']['INR'],
      rateGBP: json['rates']['GBP'],
      rateEUR: json['rates']['EUR'],
      rateJPY: json['rates']['JPY'],
    );
  }


}