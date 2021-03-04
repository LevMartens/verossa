import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/AccessToken.dart';
import 'package:verossa/Features/Check_Out/Domain/Entities/Stripe_Payment_Intent.dart';
import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';

class AccessTokenModel extends AccessToken {

  AccessTokenModel({
    @required String accessToken,
  }) : super(accessToken: accessToken);

  factory AccessTokenModel.fromJson(dynamic json) {
    return AccessTokenModel(
        accessToken: json["access_token"],
    );
  }

}
