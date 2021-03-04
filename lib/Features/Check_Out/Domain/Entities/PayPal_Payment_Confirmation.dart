import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class PayPalPaymentConfirmation extends Equatable {

  final String confirmationID;



  PayPalPaymentConfirmation({
    @required this.confirmationID,
  });

  @override
  List<Object> get props => [confirmationID];
}