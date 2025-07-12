import 'package:database_series/screen1.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hello"), centerTitle: true),
      body: Card(
        child: ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("Zeeshan"),
          subtitle: Text("Developer"),
        ),
      ),
    );
  }
}
