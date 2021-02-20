import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:verossa/Core/Error/Failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);

}

abstract class SetUseCase<Type, Params> {
  void call(Params params);

}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}