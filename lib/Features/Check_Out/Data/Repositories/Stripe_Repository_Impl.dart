import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/Check_Out/Data/Data_Sources/StripeAPI.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/Stripe_Repository.dart';
import 'package:verossa/Features/Items/Data/Data_Sources/Stock_Limit_Remote_Data_Source.dart';
import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Stock_Limit_Repository.dart';


class StripeRepositoryImpl implements StripeRepository {
  final StripeAPI stripeAPI;
  final NetworkInfo networkInfo;

  StripeRepositoryImpl({
    @required this.stripeAPI,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, StripePaymentIntent>> getPaymentIntent(String totalPrice) async {
    return await _getPaymentIntent(totalPrice);
  }



  Future<Either<Failure, StripePaymentIntent>> _getPaymentIntent(String totalPrice) async {

    try {
      final paymentIntent = await stripeAPI.getPaymentIntent(totalPrice);
      return Right(paymentIntent);
    } on CacheException {
      return Left(CacheFailure());
    }

  }

}