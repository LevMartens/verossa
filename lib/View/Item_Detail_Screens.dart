import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



/// Screen 1 Detail -----------------------------------
class Item1Detail extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<Item1Detail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          child: Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () {
                Navigator.pop(context);

    },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: GestureDetector(
        onDoubleTap: () {Navigator.pop(context);} ,
        child: Center(
          child: Hero(
            tag: 'first',
            child: InteractiveViewer(
              transformationController: transformationController,
              constrained: false,
              child: Center(
                child: Image(
                  image: AssetImage('images/Verossa-Fall.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}

/// Screen 2 Detail -----------------------------------
class Item2Detail extends StatefulWidget {
  @override
  _Input2PageState createState() => _Input2PageState();
}
class _Input2PageState extends State<Item2Detail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: GestureDetector(
        onDoubleTap: () {Navigator.pop(context);} ,
        child: Center(
          child: Hero(
            tag: 'first',
            child: InteractiveViewer(
              transformationController: transformationController,
              constrained: false,
              child: Center(
                child: Image(
                  image: AssetImage('images/Verossa-SunTree.jpg'),
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}

/// Screen 3 Detail -----------------------------------
class Item3Detail extends StatefulWidget {
  @override
  _Input3PageState createState() => _Input3PageState();
}
class _Input3PageState extends State<Item3Detail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: GestureDetector(
        onDoubleTap: () {Navigator.pop(context);} ,
        child: Center(
          child: Hero(
            tag: 'first',
            child: InteractiveViewer(
              transformationController: transformationController,
              constrained: false,
              child: Center(
                child: Image(
                  image: AssetImage('images/Verossa-Heli.jpg'),
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}

/// Screen 4 Detail -----------------------------------
class Item4Detail extends StatefulWidget {
  @override
  _Input4PageState createState() => _Input4PageState();
}
class _Input4PageState extends State<Item4Detail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: GestureDetector(
        onDoubleTap: () {Navigator.pop(context);} ,
        child: Center(
          child: Hero(
            tag: 'first',
            child: InteractiveViewer(
              transformationController: transformationController,
              constrained: false,
              child: Center(
                child: Image(
                  image: AssetImage('images/Verossa-Field.jpg'),
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}

/// Screen 5 Detail -----------------------------------
class Item5Detail extends StatefulWidget {
  @override
  _Input5PageState createState() => _Input5PageState();
}
class _Input5PageState extends State<Item5Detail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: GestureDetector(
        onDoubleTap: () {Navigator.pop(context);} ,
        child: Center(
          child: Hero(
            tag: 'first',
            child: InteractiveViewer(
              transformationController: transformationController,
              constrained: false,
              child: Center(
                child: Image(
                  image: AssetImage('images/Verossa-Thunder.jpg'),
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}

/// Screen 6 Detail -----------------------------------
class Item6Detail extends StatefulWidget {
  @override
  _Input6PageState createState() => _Input6PageState();
}
class _Input6PageState extends State<Item6Detail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(Icons.arrow_back, color: Colors.black,),
        onPressed: () {
          Navigator.pop(context);

        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: GestureDetector(
        onDoubleTap: () {Navigator.pop(context);} ,
        child: Center(
          child: Hero(
            tag: 'first',
            child: InteractiveViewer(
              transformationController: transformationController,
              constrained: false,
              child: Center(
                child: Image(
                  image: AssetImage('images/Verossa-Scotland.jpg'),
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }
}