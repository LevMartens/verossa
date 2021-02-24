import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Cart extends Equatable {


  final Map<int, int> map;

  Cart({
    @required this.map,
  });

  @override
  List<Object> get props => [map];
}