import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/knowledge_model.dart';

class MySubmissionPage extends StatefulWidget {
  const MySubmissionPage({super.key});

  @override
  State<MySubmissionPage> createState() => _MySubmissionPageState();
}

class _MySubmissionPageState extends State<MySubmissionPage> {
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
