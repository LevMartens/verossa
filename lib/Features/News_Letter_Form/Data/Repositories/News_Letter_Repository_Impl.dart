import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import 'package:verossa/Core/Error/Failures.dart';
import 'package:verossa/Core/Error/Exceptions.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/News_Letter_Form/Data/Data_Sources/News_Letter_Remote_Data_Source.dart';

import 'package:verossa/Features/News_Letter_Form/Data/Data_Sources/News_Letter_Remote_Data_Source.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Entities/News_Letter.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Repositories/News_Letter_Repository.dart';


import 'package:verossa/Features/News_Letter_Form/Domain/Repositories/News_Letter_Repository.dart';
import 'package:verossa/Features/News_Letter_Form/Data/Data_Sources/News_Letter_Remote_Data_Source.dart';
import 'package:verossa/Features/News_Letter_Form/Data/Repositories/News_Letter_Repository_Impl.dart';
import 'package:verossa/Features/News_Letter_Form/Data/Models/News_Letter_Model.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Entities/News_Letter.dart';
import 'package:verossa/Features/News_Letter_Form/Domain/Use_Cases/Set_Email_To_Mailing_List.dart';


class NewsLetterRepositoryImpl implements NewsLetterRepository {
  final NewsLetterRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  NewsLetterRepositoryImpl({
    @required this.remoteDataSource,
    @required this.networkInfo,
  });



  @override
  void setEmailToMailingList(String email) {
    remoteDataSource.saveEmail(email);

  }
}