import 'package:dartz/dartz.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';

abstract class StripeRepository {
  Future<Either<Failure, StripePaymentIntent>> getPaymentIntent(String totalPrice);
}