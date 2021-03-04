import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PaymentIntent extends Equatable {

  final String status;
  final String stripeAccount;
  final String clientSecret;

  PaymentIntent({
    @required this.status,
    @required this.stripeAccount,
    @required this.clientSecret,
  });

  @override
  List<Object> get props => [status,stripeAccount,clientSecret];
}