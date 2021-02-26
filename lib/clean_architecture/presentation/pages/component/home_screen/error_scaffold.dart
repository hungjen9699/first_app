import 'package:flutter/material.dart';

class ErrorScaffold extends StatefulWidget {
  @override
  _ErrorScaffoldState createState() => _ErrorScaffoldState();
}

class _ErrorScaffoldState extends State<ErrorScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Text("Error"),
      ),
    );
  }
}
