import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/App_Bar/Domain/Entities/Cart_Badge.dart';
import 'package:verossa/Features/App_Bar/Domain/Repositories/Cart_Badge_Repository.dart';

class SetCartBadgeNumber implements SetUseCase<CartBadge, Params> {
  final CartBadgeRepository repository;

  SetCartBadgeNumber(this.repository);

  

  @override
  void call(Params params) {
    repository.setCartBadgeNumber(params.number);
  }



}

class Params extends Equatable {
  final int number;

  Params({@required this.number});

  @override
  List<Object> get props => [number];
}

