import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/User/Data/Data_Sources/Current_User_Remote_Data_Source.dart';
import 'package:verossa/Features/User/Domain/Entities/Current_User.dart';
import 'package:verossa/Features/User/Domain/Repositories/Current_User_Repository.dart';


class CurrentUserRepositoryImpl implements CurrentUserRepository {
  final CurrentUserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CurrentUserRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, CurrentUser>> getCurrentUserDetails(String uid) async {
    return await _getCurrentUserDetails(uid);
  }

  @override
  void setCurrentUserDetails(Map<String,String> map, String uid) {
    remoteDataSource.saveCurrentUserDetails(map,uid);
  }

  @override
  Future<Either<Failure, User>> getUser() async {
    return await _getUser();
  }

  Future<Either<Failure, User>> _getUser() async {

    try {
      final user = await remoteDataSource.getUser();
      return Right(user);
    } on CacheException {
      return Left(CacheFailure());
    }

  }

  Future<Either<Failure, CurrentUser>> _getCurrentUserDetails(String uid) async {

    try {
      final remoteStock = await remoteDataSource.getCurrentUserDetails(uid);
      return Right(remoteStock);
    } on CacheException {
      return Left(CacheFailure());
    }

  }


}