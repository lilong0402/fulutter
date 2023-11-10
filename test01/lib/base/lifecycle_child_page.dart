
import 'package:flutter/material.dart';

class LifecycleChildPage extends StatefulWidget {
  const LifecycleChildPage({super.key});

  @override
  State<LifecycleChildPage> createState() => _LifecycleChildPageState();
}

class _LifecycleChildPageState extends State<LifecycleChildPage> {
  final String TAG="LifecycleChildPage";
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
        title: Text("生命周期子类"),
      ),
      body: Container(
        child: ElevatedButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text("返回父类"),
        ),
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
