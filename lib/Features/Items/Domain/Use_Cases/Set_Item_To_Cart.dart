import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Items/Domain/Entities/Cart.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Cart_Repository.dart';

class SetItemsToCart implements SetUseCase<Cart, Params> {
  final CartRepository repository;

  SetItemsToCart(this.repository);



  @override
  void call(Params params) {
    repository.setItemToCart(params.map);
  }



}

class Params extends Equatable {
  final Map<int,int> map;

  Params({@required this.map});

  @override
  List<Object> get props => [map];
}
