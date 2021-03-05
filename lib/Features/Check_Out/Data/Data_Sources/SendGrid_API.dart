import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:verossa/Core/Error/Exceptions.dart';

abstract class SendGridAPI {

  Future<void> sendEmail(String fullName, String email, String emailBody);

}

class SendGridAPIImpl implements SendGridAPI {
  final http.Client client;
  final RemoteConfig remoteConfig;

  SendGridAPIImpl({@required this.client, this.remoteConfig});

  @override
  Future<void> sendEmail(String fullName, String email, String emailBody) =>
      _sendEmail( fullName, email, emailBody);



  Future<void> _sendEmail( String fullName, String email, String emailBody) async {

    var body = json.encode({
      'personalizations': [{'to':[{'email':'$email'}], "dynamic_template_data": {
        "subject": "Verossa: Order confirmation ",
        "name":"$fullName",
        "text": "$emailBody"
      }}],
      'from': {"email":"lmartens_43@hotmail.com","name":"Lev Martens"},
      "reply_to":{"email":"lmartens_43@hotmail.com","name":"Lev Martens"},
      "template_id": remoteConfig.getString('SendGrid_Template_ID')
    });


    var response = await client.post(Uri.https("https://api.sendgrid.com","/v3/mail/send"),
        headers: {
          'Authorization': 'Bearer ' + remoteConfig.getString('SendGrid_API_Key'),
          'Content-Type': 'application/json',

        },
        body: body
    );

    if (response.statusCode == 200) {

      print('email successfully send');
    } else {
      throw ServerException();
    }
  }

}