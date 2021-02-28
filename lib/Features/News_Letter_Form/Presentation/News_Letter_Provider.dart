import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Use_Cases/Set_Email_To_Mailing_List.dart';
import 'package:meta/meta.dart';
import 'package:verossa/Core/Util/Input_Converter.dart';



class NewsLetterProvider extends ChangeNotifier {
  final SetEmailToMailingList setEmailToMailingList;


  final InputConverter inputConverter;


  NewsLetterProvider({

    @required SetEmailToMailingList setEmailToMailingList,
    @required this.inputConverter,
  })  : assert(setEmailToMailingList != null),
        assert(inputConverter != null),
        setEmailToMailingList = setEmailToMailingList;

  void saveEmailInMailingList(String email) {
          setEmailToMailingList(Params(email: email));
  }

}