
import 'package:flutter/material.dart';


import 'components/base_button.dart';
import 'components/base_image.dart';
import 'components/base_layout.dart';
import 'components/base_text.dart';
import 'components/base_textfield.dart';
import 'lifecycle_child_page.dart';


class LifecycDemo extends StatefulWidget {
  const LifecycDemo({super.key});

  @override
  State<LifecycDemo> createState() => _LifecycDemoState();
}

class _LifecycDemoState extends State<LifecycDemo> {
  final String TAG="LifecycDemo";
  @override
  void initState() {
    super.initState();
    //网络请求、数据初始化
    print("$TAG,执行了：initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("$TAG,执行了：didChangeDependencies");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("生命周期父类"),
      ),
      body: Container(
        child: Column(
          children: [
            ElevatedButton(
              child: Text("跳转子页面"),
              onPressed: ()=>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return const LifecycleChildPage();
                  })),
            ),
            ElevatedButton(
              child: Text("文本练习"),
              onPressed: ()=>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return  BaseTextPage("文本练习");
                  })),
            ),
            ElevatedButton(
              child: Text("按钮控件"),
              onPressed: ()=>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return  BaseButtonPage();
                  })),
            ),
            ElevatedButton(
              child: Text("图片控件"),
              onPressed: ()=>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return  BaseImagePage();
                  })),
            ),
            ElevatedButton(
              child: Text("TextField控件"),
              onPressed: ()=>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return  BaseTextField();
                  })),
            ),
            ElevatedButton(
              child: Text("基础布局练习"),
              onPressed: ()=>
                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                    return  BaseLayout();
                  })),
            ),
          ],
        )
      )
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    print("$TAG,执行了：deactivate");
  }


  @override
  void dispose() {
    super.dispose();
    print("$TAG,执行了：dispose");
  }

}
