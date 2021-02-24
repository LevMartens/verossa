import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class StockLimit extends Equatable {


  final Map<int, int> map;

  StockLimit({
    @required this.map,
  });

  @override
  List<Object> get props => [map];
}