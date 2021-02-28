import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/User_Auth/Domain/Entities/Current_User.dart';
import 'package:verossa/Features/User_Auth/Domain/Repositories/Current_User_Repository.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';

import 'Set_Current_User_Details.dart';

class GetCurrentUserDetails implements UseCase<CurrentUser, Params> {
  final CurrentUserRepository repository;

  GetCurrentUserDetails(this.repository);

  @override
  Future<Either<Failure, CurrentUser>> call(Params params) async {
    return await repository.getCurrentUserDetails(params.uid);
  }
}
// class Params extends Equatable {
//   final String uid;
//   Params({@required this.uid,});
//
//   @override
//   List<Object> get props => [uid];
// }