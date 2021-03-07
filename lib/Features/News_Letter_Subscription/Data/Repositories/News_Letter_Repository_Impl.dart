import 'package:meta/meta.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/News_Letter_Subscription/Data/Data_Sources/News_Letter_Remote_Data_Source.dart';
import 'package:verossa/Features/News_Letter_Subscription/Domain/Repositories/News_Letter_Repository.dart';



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