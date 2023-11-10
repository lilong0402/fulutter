import 'package:flutter/material.dart';

class BaseButtonPage extends StatefulWidget {
  const BaseButtonPage({super.key});

  @override
  State<BaseButtonPage> createState() => _BaseButtonPageState();
}

class _BaseButtonPageState extends State<BaseButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮控件22"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 150, // 设置按钮的宽度
            height: 60,  // 设置按钮的高度
            child: FloatingActionButton(
              onPressed: () {},
              child: Text("FloatingActionButton"),
            )
          ),

          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text("ElevatedButton"),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(onPressed: () {}, child: Text("TextButton")),
          SizedBox(
            child: ElevatedButton(
              onPressed: () {
                print("自定义按钮");
              },
              style: TextButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  )),
              child: const Row(
                children: [Icon(Icons.add), Text("add")],
              ),
            ),
          )
        ],
      ),
    );
  }
}
