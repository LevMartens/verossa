import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/Stripe_Repository.dart';
import 'Finalise_PayPal_Payment.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Save_Order.dart';

class StripePaymentProcessor implements UseCase<StripePaymentIntent, Params> {
  final StripeRepository repository;

  StripePaymentProcessor(this.repository);

  @override
  Future<Either<Failure, StripePaymentIntent>> call(Params params) async {
    return await repository.getPaymentIntent(params.totalPrice);
  }

}

