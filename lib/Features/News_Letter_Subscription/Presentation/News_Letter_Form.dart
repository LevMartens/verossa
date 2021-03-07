import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Injection_Container.dart' as di;
import 'package:form_validator/form_validator.dart';
import 'News_Letter_Provider.dart';

class NewsLetterForm extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  NewsLetterForm({this.scaffoldKey});
  @override
  _NewsLetterFormState createState() => _NewsLetterFormState(scaffoldKey: scaffoldKey);
}

class _NewsLetterFormState extends State<NewsLetterForm> {

  final GlobalKey<ScaffoldState> scaffoldKey;
  _NewsLetterFormState({this.scaffoldKey});

  final textController = TextEditingController();
  final validate = ValidationBuilder().email('please enter a valid email').build();


  @override
  void dispose() {
    super.dispose();
    textController.dispose();
  }

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<NewsLetterProvider>(
      create: (context) => di.sl<NewsLetterProvider>(),
      child: Consumer<NewsLetterProvider>(
          builder: (context, provider, child) => Form(
      key: scaffoldKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              autofillHints: [AutofillHints.email],
              decoration: const InputDecoration(
                hintText: 'Enter your email address...',
                hintStyle: TextStyle(color: Colors.black26, fontSize: 12),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),

                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                ),
              ),

              validator: (value) {

                if (value.isEmpty) {

                  return 'Please enter some text';

                }

                if (value.contains('@') == false) {

                  return 'Email not valid';

                }
                if (value.contains('.') == false) {

                  return 'Email not valid';

                }

                return null;
              },
            ),
          ),
          SizedBox(height: 12),
          Container(
            height: 40,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.all(
                Radius.circular(4.0),
              ),
            ),
            child: TextButton(
              onPressed: () {

                print('validation: ${validate(textController.text)}');
                 if (validate(textController.text) == null) {
                   print('validation null');

                  Provider.of<NewsLetterProvider>(context, listen: false).saveEmailInMailingList(textController.text);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));

                  textController.text = '';

                 }
              },
              child: Text(
                'SIGN UP',
                style: TextStyle(
                    color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}

