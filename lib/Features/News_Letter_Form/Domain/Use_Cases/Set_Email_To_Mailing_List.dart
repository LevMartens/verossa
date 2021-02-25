import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Cart_Badge/Domain/Use_Cases/Set_Cart_Badge.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Entities/News_Letter.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Repositories/News_Letter_Repository.dart';

//import 'Set_Item_To_Cart.dart';

class SetEmailToMailingList implements SetUseCase<NewsLetter, Params> {
  final NewsLetterRepository repository;

  SetEmailToMailingList(this.repository);



  @override
  void call(Params params) {
    repository.setEmailToMailingList(params.email);
  }




}

class Params extends Equatable {
  final String email;

  Params({@required this.email});

  @override
  List<Object> get props => [email];
}


