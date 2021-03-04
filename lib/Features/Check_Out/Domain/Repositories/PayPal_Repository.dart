import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/AccessToken.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Confirmation.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Intent.dart';

import 'package:verossa/Features/Prices/Domain/Entities/Exchange_Rates.dart';

abstract class PayPalRepository {
  Future<Either<Failure, AccessToken>> getAccessToken();
  Future<Either<Failure, PayPalPaymentIntent>> getPayPalPaymentIntent(Map<String,dynamic> transaction, String accessToken);
  Future<Either<Failure, PayPalPaymentConfirmation>> getPayPalPaymentConfirmation(String executeUrl, String accessToken, dynamic payerID);
}