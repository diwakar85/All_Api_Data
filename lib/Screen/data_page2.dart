import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    var data=Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title:Text(data.id.toString(),style:const TextStyle(fontSize: 25,fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: CircleAvatar(backgroundImage: NetworkImage(data.url),minRadius: 80,)),
          Text(data.title.toString(),style:const TextStyle(fontSize: 25,fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
