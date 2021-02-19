import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CartBadge extends Equatable {

  final int number;

  CartBadge({
    @required this.number,
  });

  @override
  List<Object> get props => [number];
}