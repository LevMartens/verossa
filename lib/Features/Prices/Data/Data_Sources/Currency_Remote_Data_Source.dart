import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:verossa/Features/Prices/Data/Models/Currency_Model.dart';


import 'package:verossa/Core/Error/Exceptions.dart';

abstract class ExchangeRatesRemoteDataSource {

  Future<ExchangeRatesModel> getExchangeRates();


}

class ExchangeRatesRemoteDataSourceImpl implements ExchangeRatesRemoteDataSource {
  final http.Client client;

  ExchangeRatesRemoteDataSourceImpl({@required this.client});

  @override
  Future<ExchangeRatesModel> getExchangeRates() =>
      _getExchangeRatesFromUrl('https://api.exchangeratesapi.io/latest?base=AUD');



  Future<ExchangeRatesModel> _getExchangeRatesFromUrl(String url) async {
    final response = await client.get(
      url,
    );

    if (response.statusCode == 200) {
      return ExchangeRatesModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}