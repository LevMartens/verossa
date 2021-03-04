import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PaymentIntent.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/PayPal_Repository.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/Stripe_Repository.dart';

import 'Save_Order_To_FireStore.dart';

class PayPalPaymentProcessor implements UseCase<PayPal, Params> {
  final PayPalRepository repository;

  PayPalPaymentProcessor(this.repository);

  @override
  Future<Either<Failure, PayPal>> call(NoParams params) async {
    return await repository.getAccessToken();
  }

}

