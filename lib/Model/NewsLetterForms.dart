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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    // TODO: implement dispose
    super.dispose();
    _formKey5.currentState?.dispose();
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




    return Form(
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
            child: FlatButton(
              onPressed: () {
                if (formKey.currentState.validate()) {
                  String subscriber = fullName != null ? fullName : randomNumber.nextInt(10000).toString();
                  firestore.collection("NewsLetterSubscribers").doc('Email').update({
                    '$subscriber': textController.text

                  });

                  Scaffold.of(context)
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
    );
  }
}

