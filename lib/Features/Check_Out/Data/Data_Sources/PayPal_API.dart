import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http/http.dart' as http;
import 'package:http_auth/http_auth.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Features/Check_Out/Data/Models/AccessToken_Model.dart';
import 'package:verossa/Features/Check_Out/Data/Models/PayPal_Payment_Confirmation_Model.dart';
import 'package:verossa/Features/Check_Out/Data/Models/PayPal_Payment_Intent_Model.dart';
import 'package:verossa/Features/Check_Out/Data/Models/Stripe_Payment_Intent_Model.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Confirmation.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Prices/Data/Models/Currency_Model.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'dart:convert' as convert;

abstract class PayPalAPI {

  Future<AccessTokenModel> getAccessToken();
  Future<PayPalPaymentIntent> getPayPalPaymentIntent(Map<String,dynamic> transaction, String accessToken);
  Future<PayPalPaymentConfirmation> getPayPalPaymentConfirmation(String executeUrl, String accessToken, dynamic payerID);

}

class PayPalAPIImpl implements PayPalAPI {
  final http.Client client;
  final BasicAuthClient basicAuthClient;
  final RemoteConfig remoteConfig;
  final String domain = 'https://api.sandbox.paypal.com';

  PayPalAPIImpl({@required this.basicAuthClient, this.remoteConfig, this.client});

  @override
  Future<AccessTokenModel> getAccessToken() =>
      _getAccessTokenFromUrl();

  @override
  Future<PayPalPaymentIntent> getPayPalPaymentIntent(Map<String, dynamic> transaction, String accessToken) async {
    return _getPayPalPaymentIntent(transaction,accessToken);
  }
  @override
  Future<PayPalPaymentConfirmation> getPayPalPaymentConfirmation(String executeUrl, String accessToken, payerID) async {
    return _getPayPalPaymentConfirmation(executeUrl,accessToken,payerID);
  }

  Future<PayPalPaymentConfirmation> _getPayPalPaymentConfirmation(String executeUrl, String accessToken, payerID) async {
    var response = await http.post(executeUrl,
        body: convert.jsonEncode({"payer_id": payerID}),
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer ' + accessToken
        });
    if (response.statusCode == 200) {
      return PayPalPaymentConfirmationModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  Future<PayPalPaymentIntent> _getPayPalPaymentIntent(Map<String, dynamic> transaction, String accessToken) async {

    var response = await client.post(Uri.https("$domain",'/v1/payments/payment'),
        body: convert.jsonEncode(transaction),
        headers: {
          "content-type": "application/json",
          'Authorization': 'Bearer ' + accessToken
        });

    final body = convert.jsonDecode(response.body);
    if (response.statusCode == 200) {

      List links = body["links"];

      String executeUrl = "";
      String approvalUrl = "";
      final item = links.firstWhere((o) => o["rel"] == "approval_url",
          orElse: () => null);
      if (item != null) {
        approvalUrl = item["href"];
      }
      final item1 = links.firstWhere((o) => o["rel"] == "execute",
          orElse: () => null);
      if (item1 != null) {
        executeUrl = item1["href"];
      }

      return PayPalPaymentIntentModel.fromJson(executeUrl, approvalUrl);
    } else {
      throw ServerException();
    }
  }

  Future<AccessTokenModel> _getAccessTokenFromUrl() async {

    final response = await basicAuthClient.post(Uri.https('$domain', '/v1/oauth2/token?grant_type=client_credentials'));

    if (response.statusCode == 200) {
      return AccessTokenModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }






}