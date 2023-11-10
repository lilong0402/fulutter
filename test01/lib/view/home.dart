import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/item_card.dart';
import 'package:flutter_application_1/model/knowledge_model.dart';

import '/common/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //tabbars数据
  List<String> tabbars = ["发现", "使用说明"];

  //tab控制器
  TabController? _tabController;

  TextEditingController textcontroller = TextEditingController();

  FocusNode focusNode = FocusNode();

  ScrollController _scrollController = ScrollController();

  List<KnowledgeModel> datas = [];

  int page = 1;
  int pageSize = 10;
  bool isHasMore = false;
  String loadingTip = "加载中....";
  bool showBackToTop = false; // 控制返回顶部按钮的显示状态
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabbars.length, vsync: this);
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

      if (_scrollController.offset >= 10) {
        setState(() {
          showBackToTop = true;
        });
      } else {
        setState(() {
          showBackToTop = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "首页",
          style: TextStyle(fontSize: 24, color: Constant.white),
        ),
        backgroundColor: Constant.maincolor,
      ),
      body: Column(
        children: [
          _buildTabbar(),
          _buildSearch(),
          Expanded(child: _buildBody())
        ],
      ),
    );
  }

  _buildTabbar() {
    return TabBar(
        labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        labelColor: Constant.maincolor,
        unselectedLabelColor: Constant.black,
        unselectedLabelStyle: const TextStyle(fontSize: 16),
        controller: _tabController,
        indicatorColor: Constant.maincolor,
        onTap: (index) {},
        tabs: tabbars.map((e) {
          return Tab(
            text: e,
          );
        }).toList());
  }

  _buildSearch() {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 400,
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Constant.grey),
      child: TextField(
        controller: textcontroller,
        focusNode: focusNode,
        style: const TextStyle(fontSize: 18),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "请输入搜索内容",
            isCollapsed: true,
            contentPadding: EdgeInsets.all(5),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(5),
              child: Image.asset(
                "assets/images/search.png",
                width: 24,
                height: 24,
              ),
            ),
            prefixIconConstraints:
                const BoxConstraints(maxHeight: 30, maxWidth: 30)),
      ),
    );
  }

  //构建body内容
  // _buildBody() {
  //   return RefreshIndicator(
  //     onRefresh: _onRefresh,
  //     child: ListView.builder(
  //       //当listview内容高度没有充满屏幕时，使用这个属性可以加载更多功能
  //       physics: const AlwaysScrollableScrollPhysics(),
  //       //子类数量
  //       itemCount: datas.length + 1,
  //       //控制器
  //       controller: _scrollController,
  //       // 构建子类，显示一页的内容
  //       itemBuilder: (context, index) {
  //         print("数量:");
  //         print(index);
  //         if (index < datas.length) {
  //           KnowledgeModel model = datas[index];
  //           return _buildListItem(model);
  //         }
  //         return _getMoreWidget();
  //       },
  //     ),
  //   );
  // }
  double right = 20;
  double bottom = 20;

  _buildBody() {
    return Stack(children: [
      ListView.builder(
        //当listview内容高度没有充满屏幕时，使用这个属性可以加载更多功能
        physics: const AlwaysScrollableScrollPhysics(),
        //子类数量
        itemCount: datas.length + 1,
        //控制器
        controller: _scrollController,
        // 构建子类，显示一页的内容
        itemBuilder: (context, index) {
          // print("数量:");
          // print(index);
          if (index < datas.length) {
            KnowledgeModel model = datas[index];
            return _buildListItem(model);
          }
          return _getMoreWidget();
        },
      ),
      showBackToTop
          ? Positioned(
              // right: 0,
              // bottom: 370,
              // child: GestureDetector(
              //   onTap: () {
              //     createDialog("点击事件弹出信息");
              //   },
              //   onDoubleTap: () {
              //     createDialog("双击事件弹出信息");
              //   },
              //   onLongPress: () {
              //     createDialog("长按事件弹出信息");
              //   },
              //   onPanDown: (details) {
              //     print("用户手指按下:${details.globalPosition}");
              //   },
              //   onPanUpdate: (DragUpdateDetails e) {
              //     print("用户划过的位置::${e.delta.dx}");
              //   },
              //   onPanEnd: (DragEndDetails e) {
              //     print("用户抬手指抬起:${e.velocity}");
              //   },

              right: right, // 注意这里使用了一个变量来控制位置
              bottom: bottom, // 同样使用了变量来控制位置
              child: GestureDetector(
                onTap: () {
                  _scrollController.animateTo(0.0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                onPanUpdate: (DragUpdateDetails details) {
                  // 获取手指在屏幕上的位置
                  Offset newPosition = details.globalPosition;

                  // 更新 Positioned 的 right 和 bottom 属性
                  double newRight =
                      MediaQuery.of(context).size.width - newPosition.dx - 60;
                  double newBottom =
                      MediaQuery.of(context).size.height - newPosition.dy - 60;
                  print(newBottom);
                  print(newRight);
                  // 更新 Positioned 的位置
                  setState(() {
                    right = newRight;
                    bottom = newBottom;
                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Constant.maincolor,
                      borderRadius: BorderRadius.circular(40)),
                  child: Icon(Icons.upload, size: 32, color: Colors.white),
                ),
              ),
            )
          : Container(),
    ]);
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
    return ItemCard(index);
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
      model.cover = "https://w.wallhaven.cc/full/4y/wallhaven-4y8gpk.jpg";
      model.name = "测试数据";
      model.description = "这是测试数据------$i";
      model.tag = "原创";
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
