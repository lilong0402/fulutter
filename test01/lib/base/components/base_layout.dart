import 'package:flutter/material.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("基础布局"),
      ),
      body: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [Text("文本内容1"), Text("文本内容2")],
          ),
          Text("流式布局"),
          SizedBox(
            height: 20,
          ),
          Wrap(
            //主轴方向widget的间距
            spacing: 10,
            //纵轴方向widget的间距
            runSpacing: 5,
            //主轴方向对齐方式
            alignment: WrapAlignment.center,
            //纵轴方向对齐方式
            runAlignment: WrapAlignment.center,
            children: [
              Chip(
                  label: Text("11111"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text("A"),
                  )),
              Chip(
                  label: Text("22222"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text("B"),
                  )),
              Chip(
                  label: Text("333333"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text("C"),
                  )),
              Chip(
                  label: Text("444444"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text("D"),
                  )),
              Chip(
                  label: Text("5555555"),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Text("E"),
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("弹性布局"),
          SizedBox(
            height: 20,
          ),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 30,
                    color: Colors.green,
                  )),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text("相对布局"),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Stack(
            // alignment: Alignment.center,
            children: [
              Container(
                color: Colors.red,
                child: Text(
                  "Hellow World",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Positioned(left: 10, top: 20, child: Text("I am XX")),
            ],
          ))
        ],
      ),
    );
  }
}
