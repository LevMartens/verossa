import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';

class StripePaymentIntentModel extends StripePaymentIntent {
  StripePaymentIntentModel({
    @required String status,
    @required String stripeAccount,
    @required String clientSecret,
  }) : super(status: status, stripeAccount: stripeAccount, clientSecret: clientSecret);

  factory StripePaymentIntentModel.fromJson(dynamic json) {
    return StripePaymentIntentModel(
      status: json['status'],
      stripeAccount: json['stripeAccount'],
      clientSecret: json['client_secret']
    );
  }

}
