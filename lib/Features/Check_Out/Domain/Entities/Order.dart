import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Order extends Equatable {

  final Map<String, dynamic> map;
  final String orderNumber;
  final String date;

  Order({
    @required this.map,
    @required this.orderNumber,
    @required this.date,
  });

  @override
  List<Object> get props => [map,orderNumber,date];
}