import 'package:dartz/dartz.dart';

import 'package:verossa/Core/Error/Failures.dart';

import 'package:verossa/Features/News_Letter_Form/Domain/Entities/News_Letter.dart';


abstract class NewsLetterRepository {

  void setEmailToMailingList(String email);
}