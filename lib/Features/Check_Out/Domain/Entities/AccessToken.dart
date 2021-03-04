import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AccessToken extends Equatable {

  final String accessToken;

  AccessToken({
    @required this.accessToken,
  });

  @override
  List<Object> get props => [accessToken];
}