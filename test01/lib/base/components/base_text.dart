import 'package:flutter/material.dart';

class BaseTextPage extends StatefulWidget {
  String title;

  BaseTextPage(this.title, {super.key});

  @override
  State<BaseTextPage> createState() => _BaseTextPageState();
}

class _BaseTextPageState extends State<BaseTextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title+"AAA",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 19,
            height: 111,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Hello world",
            style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                height: 1.2,
                decoration: TextDecoration.underline,
                backgroundColor: Colors.green,
                fontWeight: FontWeight.bold,
                decorationStyle: TextDecorationStyle.dashed),
          ),
        ],
      ),
    );
  }
}
