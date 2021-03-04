import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class StripePaymentIntent extends Equatable {

  final String status;
  final String stripeAccount;
  final String clientSecret;

  StripePaymentIntent({
    @required this.status,
    @required this.stripeAccount,
    @required this.clientSecret,
  });

  @override
  List<Object> get props => [status,stripeAccount,clientSecret];
}