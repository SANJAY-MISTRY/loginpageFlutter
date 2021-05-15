import 'package:flutter/material.dart';
class ListScreen extends StatelessWidget {
  static const routeName = '/list';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List screen"),
      ),
      body: Center(
        child: Text(
          "This Is List Screen",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
        ),
      ),
    );
  }
}
