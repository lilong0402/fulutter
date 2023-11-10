import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant.dart';
import 'package:flutter_application_1/model/knowledge_model.dart';
import 'package:flutter_application_1/view/home/knowledge_detail.dart';

class ItemCard2 extends StatefulWidget {
  KnowledgeModel model;

  ItemCard2(this.model, {super.key});

  @override
  State<ItemCard2> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard2> {
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

              Row(
                children: [
                  Image(
                    image: AssetImage(widget.model.cover!),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    widget.model.name!,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constant.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.model.description!,
                      style: TextStyle(
                        fontSize: 16,
                        color: Constant.black,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
