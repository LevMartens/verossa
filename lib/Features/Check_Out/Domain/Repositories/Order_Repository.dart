import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';

import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';
//import 'package:verossa/Features/Items/Presentation/Stock_Limit_Model.dart';

abstract class OrderRepository {
  void setOrder(Map<String,dynamic> map, String orderNumber, String date);
}