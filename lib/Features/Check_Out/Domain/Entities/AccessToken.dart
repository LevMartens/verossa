import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PayPal extends Equatable {

  final String accessToken;

  PayPal({
    @required this.accessToken,
  });

  @override
  List<Object> get props => [accessToken];
}