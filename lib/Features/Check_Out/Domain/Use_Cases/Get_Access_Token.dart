import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/AccessToken.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/PayPal_Repository.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/Stripe_Repository.dart';

import 'Save_Order_To_FireStore.dart';

class GetAccessToken implements UseCase<AccessToken, NoParams> {
  final PayPalRepository repository;

  GetAccessToken(this.repository);

  @override
  Future<Either<Failure, AccessToken>> call(NoParams params) async {
    return await repository.getAccessToken();
  }

}

