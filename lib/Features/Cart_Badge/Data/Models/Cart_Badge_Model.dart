import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:meta/meta.dart';

class CartBadgeModel extends CartBadge {
  CartBadgeModel({

    @required int number,
  }) : super(number: number);

  factory CartBadgeModel.fromSharedPreferences(int number) {
    return CartBadgeModel(number: number);
  }

  Map<String, dynamic> toJson() {
    return {

      'number': number,
    };
  }
}