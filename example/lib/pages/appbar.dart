import 'package:flutter/material.dart';

import 'package:flutter_elui_plugin/elui.dart';

class appBarPage extends StatefulWidget {
  @override
  _AppBarPageState createState() => _AppBarPageState();
}

class _AppBarPageState extends State<appBarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EluiAppBarComponent(context: context, title: 'AppBar'),
        body: ListView(
          children: const <Widget>[
          ],
        )
    );
  }
}
