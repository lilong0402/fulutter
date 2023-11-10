import 'package:flutter/material.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({super.key});

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  FocusNode focusNode = new FocusNode();
  TextEditingController controller = TextEditingController();
  String content = "";

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        print("TextField获取焦点");
      } else {
        print("TextField失去焦点");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField组件"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("TextField Value：$content"),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              width: 200,
              child: TextField(
                autofocus: true,
                focusNode: focusNode,
                controller: controller,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "请输入用户名",
                  border: OutlineInputBorder(
                      //设置边框四个角的弧度
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      //用来配置边框样式
                      borderSide: BorderSide(
                          //设置边框颜色
                          color: Colors.red,
                          //设置边框粗细
                          width: 2.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  content = controller.text;
                  print("value:$content");
                  setState(() {});
                },
                child: Text("获取Textfield值")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (!focusNode.hasFocus) {
                  focusNode.requestFocus();
                }
              },
              child: const Text("获取焦点"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (focusNode.hasFocus) {
                    focusNode.unfocus();
                  }
                },
                child: Text("失去焦点")),
          ],
        ),
      ),
    );
  }
}
