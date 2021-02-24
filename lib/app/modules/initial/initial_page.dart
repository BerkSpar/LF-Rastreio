import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'initial_controller.dart';

class InitialPage extends StatefulWidget {
  final String title;
  const InitialPage({Key key, this.title = "Initial"}) : super(key: key);

  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends ModularState<InitialPage, InitialController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
