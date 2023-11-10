import 'package:flutter/material.dart';

class BaseImagePage extends StatefulWidget {
  const BaseImagePage({super.key});

  @override
  State<BaseImagePage> createState() => _BaseImagePageState();
}

class _BaseImagePageState extends State<BaseImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("图片控件"),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage("assets/images/c.jpg"),
              width: 400,
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            Image.network(
              // "图片url",
              "https://xinzhuobu.com/wp-content/uploads/2023/04/20230316019.jpg",
              width: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInImage.assetNetwork(
                placeholder: "assets/images/waitting.gif",
                image:
                    "https://xinzhuobu.com/wp-content/uploads/2023/04/20230316019.jpg"),
          ]),
    );
  }
}
