import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/User_Auth/Domain/Entities/Current_User.dart';
import 'package:verossa/Features/User_Auth/Domain/Repositories/Current_User_Repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/User_Auth/Domain/Entities/Current_User.dart';
import 'package:verossa/Features/User_Auth/Domain/Repositories/Current_User_Repository.dart';

class SetCurrentUserDetails implements SetUseCase<CurrentUser, Params> {
  final CurrentUserRepository repository;

  SetCurrentUserDetails(this.repository);

  @override
  void call(Params params) {
    repository.setCurrentUserDetails(params.map,params.uid);
  }
}

class Params extends Equatable {
  final Map<String,String> map;
  final String uid;

  Params({@required this.map, @required this.uid});

  @override
  List<Object> get props => [map,uid];
}
