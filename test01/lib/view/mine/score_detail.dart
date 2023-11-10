import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/knowledge_model.dart';
import '../../component/item_card2.dart';
import '/common/constant.dart';

class ScoreDetailPage extends StatefulWidget {
  const ScoreDetailPage({super.key});

  @override
  State<ScoreDetailPage> createState() => _ScoreDetailPageState();
}

class _ScoreDetailPageState extends State<ScoreDetailPage>
    with SingleTickerProviderStateMixin {
  String title = '';
  FocusNode focusNode = FocusNode();

  ScrollController _scrollController = ScrollController();

  List<KnowledgeModel> datas = [];

  int page = 1;
  int pageSize = 10;
  bool isHasMore = false;
  String loadingTip = "加载中....";

  @override
  void initState() {
    super.initState();
    getData();
    //注册滚动监听
    _scrollController.addListener(() {
      //判断当前滚动位置是否处于可见视图的最底部
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (isHasMore) {
          //还有数据
          page++;
          Future.delayed(const Duration(seconds: 2)).then((value) => getData());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    title = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 24, color: Constant.white),
        ),
        backgroundColor: Constant.maincolor,
      ),
      body: Column(
        children: [Expanded(child: _buildBody())],
      ),
    );
  }

  _buildBody() {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        //当listview内容高度没有充满屏幕时，使用这个属性可以加载更多功能
        physics: const AlwaysScrollableScrollPhysics(),
        //子类数量
        itemCount: datas.length + 1,
        //控制器
        controller: _scrollController,
        // 构建子类，显示一页的内容
        itemBuilder: (context, index) {
          // print("数量:");
          print(index);
          if (index < datas.length) {
            KnowledgeModel model = datas[index];
            return _buildListItem(model);
          }
          return _getMoreWidget();
        },
      ),
    );
  }

  createDialog(String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: 20,
              width: 60,
              alignment: Alignment.center,
              child: Text(msg),
            ),
          );
        });
    Future.delayed(Duration(seconds: 1))
        .then((value) => Navigator.pop(context));
  }

  _buildListItem(KnowledgeModel index) {
    // return Text("hello,$index");
    return ItemCard2(index);
  }

  _getMoreWidget() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingTip,
            style: const TextStyle(fontSize: 16.0),
          ),
          Visibility(
            visible: isHasMore,
            child: const CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
          )
        ],
      ),
    );
  }

//下拉刷新
  Future<void> _onRefresh() async {
    await Future.delayed(const Duration(seconds: 3), () {
      page = 1;
      datas.clear();
      getData();
      setState(() {});
    });
  }

  void getData() async {
    List<KnowledgeModel> data = [];
    for (int i = (page - 1) * pageSize; i < page * pageSize; i++) {
      KnowledgeModel model = KnowledgeModel();
      model.cover = "assets/images/time.png";
      DateTime now = DateTime.now();
      model.name = "$now 兑换";
      Random random = Random();

      // 生成一个介于 0 和 99 之间的随机整数
      int randomNumber = random.nextInt(100);
      model.description = "-$randomNumber";
      data.add(model);
    }
    if (page == 1) {
      //刷新
      datas = data;
    } else if (page > 1) {
      //加载更多
      datas.addAll(data);
    }
    //判断是否有更多数据
    if (page * pageSize >= 30) {
      isHasMore = false;
      loadingTip = "暂无更多数据...";
    } else {
      isHasMore = true;
      loadingTip = "加载数据...";
    }
    //视图才能build
    setState(() {});
  }
}
