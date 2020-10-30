import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Global_Variables.dart';




class NewsLetterFormForHome extends StatefulWidget {
  @override
  NewsLetterFormStateHome createState() {
    return NewsLetterFormStateHome();
  }
}

class NewsLetterFormStateHome extends State<NewsLetterFormForHome> {



  @override
  Widget build(BuildContext context) {
    final _formKey5 = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey5.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey5.currentState.reset();

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
    );
  }
}
///-------------------------------------------------------------
class NewsLetterFormForItem extends StatefulWidget {
  @override
  NewsLetterFormStateItem createState() {
    return NewsLetterFormStateItem();
  }
}

class NewsLetterFormStateItem extends State<NewsLetterFormForItem> {



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------
class NewsLetterFormForItem2 extends StatefulWidget {
  @override
  NewsLetterFormStateItem2 createState() {
    return NewsLetterFormStateItem2();
  }
}

class NewsLetterFormStateItem2 extends State<NewsLetterFormForItem2> {



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------
class NewsLetterFormForItem3 extends StatefulWidget {
  @override
  NewsLetterFormStateItem3 createState() {
    return NewsLetterFormStateItem3();
  }
}

class NewsLetterFormStateItem3 extends State<NewsLetterFormForItem3> {



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------
class NewsLetterFormForItem4 extends StatefulWidget {
  @override
  NewsLetterFormStateItem4 createState() {
    return NewsLetterFormStateItem4();
  }
}

class NewsLetterFormStateItem4 extends State<NewsLetterFormForItem4> {



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------
class NewsLetterFormForItem5 extends StatefulWidget {
  @override
  NewsLetterFormStateItem5 createState() {
    return NewsLetterFormStateItem5();
  }
}

class NewsLetterFormStateItem5 extends State<NewsLetterFormForItem5> {



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------
class NewsLetterFormForItem6 extends StatefulWidget {
  @override
  NewsLetterFormStateItem6 createState() {
    return NewsLetterFormStateItem6();
  }
}

class NewsLetterFormStateItem6 extends State<NewsLetterFormForItem6> {



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------
class NewsLetterFormForAbout extends StatefulWidget {
  @override
  NewsLetterFormStateAbout createState() {
    return NewsLetterFormStateAbout();
  }
}

class NewsLetterFormStateAbout extends State<NewsLetterFormForAbout> {



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------

class NewsLetterFormForContact extends StatefulWidget {
  @override
  NewsLetterFormStateContact createState() {
    return NewsLetterFormStateContact();
  }
}

class NewsLetterFormStateContact extends State<NewsLetterFormForContact> {



  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------

class NewsLetterFormForPersonal extends StatefulWidget {
  @override
  NewsLetterFormStatePersonal createState() {
    return NewsLetterFormStatePersonal();
  }
}

class NewsLetterFormStatePersonal extends State<NewsLetterFormForPersonal> {



  @override
  Widget build(BuildContext context) {
    final _formKey2 = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey2.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey2.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------

class NewsLetterFormForCreate extends StatefulWidget {
  @override
  NewsLetterFormStateCreate createState() {
    return NewsLetterFormStateCreate();
  }
}

class NewsLetterFormStateCreate extends State<NewsLetterFormForCreate> {



  @override
  Widget build(BuildContext context) {
    final _formKey2 = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey2.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey2.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------

class NewsLetterFormForLogIn extends StatefulWidget {
  @override
  NewsLetterFormStateLogIn createState() {
    return NewsLetterFormStateLogIn();
  }
}

class NewsLetterFormStateLogIn extends State<NewsLetterFormForLogIn> {


  @override
  Widget build(BuildContext context) {
    final _formKey2 = GlobalKey<FormState>();
    final textController = TextEditingController();

    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey2.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey2.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------

class NewsLetterFormForReturn extends StatefulWidget {
  @override
  NewsLetterFormStateReturn createState() {
    return NewsLetterFormStateReturn();
  }
}

class NewsLetterFormStateReturn extends State<NewsLetterFormForReturn> {



  @override
  Widget build(BuildContext context) {
    final _formKey2 = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey2.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey2.currentState.reset();

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
    );
  }
}

///-------------------------------------------------------------

class NewsLetterFormForShip extends StatefulWidget {
  @override
  NewsLetterFormStateShip createState() {
    return NewsLetterFormStateShip();
  }
}

class NewsLetterFormStateShip extends State<NewsLetterFormForShip> {



  @override
  Widget build(BuildContext context) {
    final _formKey2 = GlobalKey<FormState>();
    final textController = TextEditingController();
    return Form(
      key: _formKey2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 40,
            width: 300,
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  ),
                ),
                labelText: 'Enter your email address...',
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
            child: FlatButton(
              onPressed: () {
                if (_formKey2.currentState.validate()) {
                  firestore.collection("NewsLetterSubs").add({
                    'email': textController.text

                  });

                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Successfully subscribed :)', textAlign: TextAlign.center,)));
                  _formKey2.currentState.reset();

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
    );
  }
}

