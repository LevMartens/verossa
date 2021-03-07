import 'package:dartz/dartz.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/User/Domain/Entities/Current_User.dart';
import 'package:verossa/Features/User/Domain/Repositories/Current_User_Repository.dart';
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