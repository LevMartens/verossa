import 'package:meta/meta.dart';
import 'package:verossa/Features/User/Domain/Entities/Current_User.dart';

class CurrentUserModel extends CurrentUser {
  CurrentUserModel({

    @required Map<String,String> map,
  }) : super(currentUserDetails: map);

  factory CurrentUserModel.fromFireStore(Map<String,String> map) {
    return CurrentUserModel(map: map);
  }


}
