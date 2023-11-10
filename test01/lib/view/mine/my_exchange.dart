import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/knowledge_model.dart';

class MyExchangePage extends StatefulWidget {
  const MyExchangePage({super.key});

  @override
  State<MyExchangePage> createState() => _MyExchangePageState();
}

class _MyExchangePageState extends State<MyExchangePage> {
  String title = '';
  @override
  Widget build(BuildContext context) {
    title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title:  Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("返回上一页"),
        ),
      ),
    );
  }
}
