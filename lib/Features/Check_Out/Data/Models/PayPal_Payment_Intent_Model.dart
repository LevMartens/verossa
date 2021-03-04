import 'package:meta/meta.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/PayPal_Payment_Intent.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';

class PayPalPaymentIntentModel extends PayPalPaymentIntent {

  PayPalPaymentIntentModel({
    @required String checkoutUrl,
    @required String executeUrl,

  }) : super(checkoutUrl: checkoutUrl, executeUrl: executeUrl);

  factory PayPalPaymentIntentModel.fromJson(String executeUrl, String approvalUrl) {

    return PayPalPaymentIntentModel(
        checkoutUrl: approvalUrl,
         executeUrl: executeUrl,
    );
  }

}