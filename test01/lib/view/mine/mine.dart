import 'package:flutter/material.dart';
import 'package:flutter_application_1/common/constant.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  List menus = [
    {
      "name": "我的兑换",
      "icon": "assets/images/exchange.png",
      "route_name": "my_exchange"
    },
    {
      "name": "积分明细",
      "icon": "assets/images/account_detail.png",
      "route_name": "score_detail"
    },
    {
      "name": "我的投稿",
      "icon": "assets/images/submission.png",
      "route_name": "my_submission"
    },
    {"name": "帮助", "icon": "assets/images/help.png", "route_name": "help"},
    {
      "name": "设置",
      "icon": "assets/images/setting.png",
      "route_name": "setting"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constant.maincolor,
        title: Text(
          "我的",
          style: TextStyle(color: Constant.white, fontSize: 24),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHead(),
          const SizedBox(
            height: 40,
          ),
          Expanded(child: _buildGridView())
        ],
      ),
    );
  }



  Widget _buildHead() {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        const CircleAvatar(
          backgroundImage: NetworkImage(
              "https://w.wallhaven.cc/full/4y/wallhaven-4y8gpk.jpg"),
          radius: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text("积分:1333"),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          child: Container(
            color: Constant.maincolor,
            padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
            child: Text(
              "签到",
              style: TextStyle(color: Constant.white, fontSize: 16),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      //内边距
      padding: const EdgeInsets.all(5),
      //用于配置网络的布局方式
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //表示网格列数
          crossAxisCount: 4,
          //表示每个子部件的宽高比，可以控制部件的大小
          childAspectRatio: 1,
          //表示主轴上的间距
          mainAxisSpacing: 5,
          crossAxisSpacing: 5),
      itemCount: menus.length,

      itemBuilder: (context, index) {
        var item = menus[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, item['route_name'],arguments: item['name']);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                item['icon'],
                width: 40,
                height: 40,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                item['name'],
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        );
      },
    );
  }
}
