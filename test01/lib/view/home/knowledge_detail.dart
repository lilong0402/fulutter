import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/knowledge_model.dart';

class KnowledgeDeatail extends StatefulWidget {
  KnowledgeModel model;

  KnowledgeDeatail(this.model, {super.key});

  @override
  State<KnowledgeDeatail> createState() => _KnowledgeDeatail();
}

class _KnowledgeDeatail extends State<KnowledgeDeatail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("分享详情"),),
      body: Center(
        child: Text(widget.model.name!),
      ),
    );
  }


}