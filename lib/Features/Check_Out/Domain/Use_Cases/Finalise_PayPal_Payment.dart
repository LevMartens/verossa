import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/AccessToken.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Confirmation.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/PayPal_Repository.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/Stripe_Repository.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Save_Order.dart';

class FinalisePayPalPayment implements SetUseCase<PayPalPaymentConfirmation, Params> {
  final PayPalRepository repository;

  FinalisePayPalPayment(this.repository);

  @override
  Future<Either<Failure, PayPalPaymentConfirmation>> call(Params params) async {
    return await repository.getPayPalPaymentConfirmation(params.executeUrl, params.accessToken, params.payerID);
  }

}

class Params extends Equatable {
  final String executeUrl;
  final String accessToken;
  final dynamic payerID;
  final Map<String,dynamic> transaction;
  final Map<String,dynamic> map;
  final String orderNumber;
  final String date;
  final String totalPrice;
  final String fullName;
  final String email;
  final String emailBody;


  Params({
     this.transaction,
     this.executeUrl,
     this.accessToken,
     this.payerID,
     this.map,
     this.orderNumber,
     this.date,
     this.totalPrice,
     this.fullName,
     this.email,
     this.emailBody,
  });

  @override
  List<Object> get props => [transaction, executeUrl, accessToken, payerID,map, orderNumber, date, totalPrice, fullName, email, emailBody];
}
