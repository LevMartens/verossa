import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/AccessToken.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/PayPal_Repository.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/Stripe_Repository.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Finalise_PayPal_Payment.dart';



class CreatePayPalPayment implements UseCase<PayPalPaymentIntent, Params> {
  final PayPalRepository repository;

  CreatePayPalPayment(this.repository);

  @override
  Future<Either<Failure, PayPalPaymentIntent>> call(Params params) async {
    return await repository.getPayPalPaymentIntent(params.transaction, params.accessToken);
  }

}



