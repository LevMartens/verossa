import 'package:meta/meta.dart';
import 'package:verossa/Core/Network/Network_Info.dart';
import 'package:verossa/Features/Check_Out/Data/Data_Sources/SendGrid_API.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/SendGrid_Repository.dart';



class SendGridRepositoryImpl implements SendGridRepository {
  final SendGridAPI sendGridAPI;
  final NetworkInfo networkInfo;

  SendGridRepositoryImpl({
    @required this.sendGridAPI,
    @required this.networkInfo,
  });

  @override
  Future<void> sendEmail(String fullName, String email, String emailBody) async {
    return await _sendEmail(fullName, email, emailBody);
  }



  Future<void> _sendEmail(String fullName, String email, String emailBody) async {
    sendGridAPI.sendEmail(fullName, email, emailBody);
  }

}