import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:verossa/Features/Check_Out/Data/Models/Stripe_Payment_Intent_Model.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Prices/Data/Models/Currency_Model.dart';
import 'package:verossa/Core/Error/Exceptions.dart';

abstract class StripeAPI {

  Future<StripePaymentIntentModel> getPaymentIntent(String totalPrice);

}

class StripeAPIImpl implements StripeAPI {
  final http.Client client;
  final RemoteConfig remoteConfig;

  StripeAPIImpl({@required this.client, this.remoteConfig});

  @override
  Future<StripePaymentIntentModel> getPaymentIntent(String totalPrice) =>
      _getPaymentIntentFromUrl('https://api.stripe.com/v1/payment_intents', totalPrice);



  Future<StripePaymentIntentModel> _getPaymentIntentFromUrl(String url, String totalPrice) async {

    await remoteConfig.fetch(expiration: const Duration(hours: 5));
    await remoteConfig.activateFetched();
    final stripeAPIKey = remoteConfig.getString('Stripe_API_Key');

    Map<String, dynamic> body = {
      'amount': totalPrice,
      'currency': 'AUD',
      'payment_method_types[]': 'card'
    };
    Map<String, String> headers = {
      'Authorization': 'Bearer $stripeAPIKey',
      'Content_Type': 'application/x-www-form-urlencoded'
    };


    final response = await client.post(
         url,
         headers: headers,
         body: body,
        );

    if (response.statusCode == 200) {

      return StripePaymentIntentModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }


}