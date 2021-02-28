import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';
import 'package:verossa/Features/User_Auth/Domain/Entities/Current_User.dart';

class CurrentUserModel extends CurrentUser {
  CurrentUserModel({

    @required Map<String,String> map,
  }) : super(currentUserDetails: map);

  factory CurrentUserModel.fromFireStore(Map<String,String> map) {
    return CurrentUserModel(map: map);
  }


}
