import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Items/Domain/Entities/Stock_Limit.dart';
import 'package:verossa/Features/Items/Domain/Repositories/Stock_Limit_Repository.dart';

class SetStockLimit implements SetUseCase<StockLimit, Params> {
  final StockLimitRepository repository;

  SetStockLimit(this.repository);



  @override
  void call(Params params) {
    repository.setStock(params.map);
  }



}

class Params extends Equatable {
  final Map<int,int> map;

  Params({@required this.map});

  @override
  List<Object> get props => [map];
}
