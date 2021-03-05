import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/Check_Out/Data/Data_Sources/PayPal_API.dart';
import 'package:verossa/Features/Check_Out/Data/Data_Sources/Stripe_API.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/AccessToken.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Confirmation.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/PayPal_Repository.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/Stripe_Repository.dart';
import 'package:verossa/Features/Items/Data/Data_Sources/Stock_Limit_Remote_Data_Source.dart';
import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Stock_Limit_Repository.dart';


class PayPalRepositoryImpl implements PayPalRepository {
  final PayPalAPI paypalAPI;
  final NetworkInfo networkInfo;

  PayPalRepositoryImpl({
    @required this.paypalAPI,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, AccessToken>> getAccessToken() async {
    return await _getAccessToken();
  }

  @override
  Future<Either<Failure, PayPalPaymentIntent>> getPayPalPaymentIntent(Map<String, dynamic> transaction, String accessToken) async{
    return await _getPayPalPaymentIntent(transaction, accessToken);
  }

  @override
  Future<Either<Failure, PayPalPaymentConfirmation>> getPayPalPaymentConfirmation(String executeUrl, String accessToken, dynamic payerID) async{
    return await _getPayPalPaymentConfirmation(executeUrl,accessToken,payerID);
  }

  Future<Either<Failure, PayPalPaymentConfirmation>> _getPayPalPaymentConfirmation(String executeUrl, String accessToken, dynamic payerID) async {
    try {
      final paymentConfirmation = await paypalAPI.getPayPalPaymentConfirmation(executeUrl, accessToken, payerID);
      return Right(paymentConfirmation);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, PayPalPaymentIntent>> _getPayPalPaymentIntent(Map<String, dynamic> transaction, String accessToken) async {

    try {
      final paymentIntent = await paypalAPI.getPayPalPaymentIntent(transaction, accessToken);
      return Right(paymentIntent);
    } on CacheException {
      return Left(CacheFailure());
    }

  }

  Future<Either<Failure, AccessToken>> _getAccessToken() async {

    try {
      final accessToken = await paypalAPI.getAccessToken();
      return Right(accessToken);
    } on CacheException {
      return Left(CacheFailure());
    }

  }





}