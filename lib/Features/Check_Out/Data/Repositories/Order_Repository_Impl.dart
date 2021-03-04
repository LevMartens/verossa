import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/Check_Out/Data/Data_Sources/Order_Remote_Data_Source.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/Order_Repository.dart';
import 'package:verossa/Features/Items/Data/Data_Sources/Stock_Limit_Remote_Data_Source.dart';
import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Stock_Limit_Repository.dart';


class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  OrderRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });


  @override
  void setOrder(Map<String,dynamic> map, String orderNumber, String date) {
    remoteDataSource.saveOrder(map, orderNumber, date);

  }
}