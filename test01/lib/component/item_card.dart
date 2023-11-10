import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant.dart';
import 'package:flutter_application_1/model/knowledge_model.dart';
import 'package:flutter_application_1/view/home/knowledge_detail.dart';

class ItemCard extends StatefulWidget {
  KnowledgeModel model;

  ItemCard(this.model, {super.key});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            (MaterialPageRoute(builder: (context) {
              return KnowledgeDeatail(widget.model);
            })));
      },
      child: Container(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Constant.lineColor,
                      width: .5,
                      style: BorderStyle.solid))),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(widget.model.cover!, scale: 1),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(6, 2, 5, 2),
                    color: Constant.maincolor,
                    child: Text(
                      widget.model.tag!,
                      style: TextStyle(
                        fontSize: 12,
                        color: Constant.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.name!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constant.black,
                    ),
                  ),
                  Text(
                    widget.model.description!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Constant.black,
                    ),
                  )
                ],
              )),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "下载",
                    style: TextStyle(fontSize: 14),
                  )),
              const SizedBox(
                width: 30,
              )
            ],
          )),
    );
  }
}
