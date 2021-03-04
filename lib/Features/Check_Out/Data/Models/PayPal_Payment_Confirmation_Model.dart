import 'package:meta/meta.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Confirmation.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';

class PayPalPaymentConfirmationModel extends PayPalPaymentConfirmation {

  PayPalPaymentConfirmationModel({
    @required String confirmationID,
  }) : super(confirmationID: confirmationID);

  factory PayPalPaymentConfirmationModel.fromJson(dynamic json) {

    return PayPalPaymentConfirmationModel(
      confirmationID: json["id"],
    );
  }

}