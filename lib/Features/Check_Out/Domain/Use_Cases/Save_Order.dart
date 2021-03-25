import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/Order_Repository.dart';

import 'Finalise_PayPal_Payment.dart';



class SaveOrder implements SetUseCase<Order, Params> {
  final OrderRepository repository;

  SaveOrder(this.repository);



  @override
  void call(Params params) {
    repository.setOrder(params.map, params.orderNumber, params.date);
  }



}
