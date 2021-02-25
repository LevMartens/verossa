import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Injection_Container.dart' as di;

import 'News_Letter_Provider.dart';

class NewsLetterForm extends StatefulWidget {
  @override
  _NewsLetterFormState createState() => _NewsLetterFormState();
}

class _NewsLetterFormState extends State<NewsLetterForm> {

  static GlobalKey<FormState> _formKey5 = GlobalKey<FormState>();
  ModalRoute _mountRoute;
  final textController = TextEditingController();

  @override
  void didChangeDependencies() {
    _mountRoute ??= ModalRoute.of(context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
    _formKey5.currentState?.dispose();
    textController.dispose();
  }

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {

    final formKey = _mountRoute == ModalRoute.of(context)
        ? _formKey5
        : GlobalKey<FormState>();//Key('hack-to-dispose-of-will-pop-callback');

    return ChangeNotifierProvider<NewsLetterProvider>(
      create: (context) => di.sl<NewsLetterProvider>(),
      child: Consumer<NewsLetterProvider>(
          builder: (context, provider, child) => Form(
      key: formKey,
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

                if (formKey.currentState.validate()) {

                  Provider.of<NewsLetterProvider>(context, listen: false).saveEmailInMailingList(textController.text);

                  // String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  // di.sl<fireBaseFireStore>.collection("NewsLetterSubscribers").doc('Email').update({
                  //   '$subscriber': textController.text
                  //
                  // });

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  formKey.currentState.reset();

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

