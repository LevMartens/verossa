import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Features/User_Auth/Domain/Entities/Current_User.dart';


abstract class CurrentUserRepository {
  Future<Either<Failure, CurrentUser>> getCurrentUserDetails(String uid);
  Future<Either<Failure, User>> getUser();
  void setCurrentUserDetails(Map<String,String> map, String uid);
}