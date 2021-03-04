import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PayPalPaymentIntent extends Equatable {

  final String checkoutUrl;
  final String executeUrl;


  PayPalPaymentIntent({
    @required this.checkoutUrl,
    @required this.executeUrl,
  });

  @override
  List<Object> get props => [checkoutUrl, executeUrl];
}