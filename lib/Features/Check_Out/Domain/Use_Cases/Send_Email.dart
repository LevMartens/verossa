import 'package:verossa/Core/Use_Cases/Use_Case.dart';
import 'package:verossa/Features/Check_Out/Domain/Repositories/SendGrid_Repository.dart';
import 'package:verossa/Features/Check_Out/Domain/Use_Cases/Finalise_PayPal_Payment.dart';



class SendGridEmailSender implements SetUseCase<Type, Params> {
  final SendGridRepository repository;

  SendGridEmailSender(this.repository);

  @override
  Future<void> call(Params params) async {
    return await repository.sendEmail(params.fullName, params.email, params.emailBody);
  }

}
