import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/AccessToken.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Confirmation.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Intent.dart';

import 'package:verossa/Features/Prices/Domain/Entities/Exchange_Rates.dart';

abstract class SendGridRepository {
  Future<void> sendEmail(String fullName, String email, String emailBody);
}