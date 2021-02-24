import 'package:verossa/Features/Cart_Badge/Domain/Entities/Cart_Badge.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';

class StockLimitModel extends StockLimit {
  StockLimitModel({

    @required Map<int,int> map,
  }) : super(map: map);

  factory StockLimitModel.fromFireStore(Map<int,int> map) {
    return StockLimitModel(map: map);
  }


}
