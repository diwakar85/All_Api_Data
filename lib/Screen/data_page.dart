 import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    var data=Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title:Text(data.id.toString(),style:const TextStyle(fontSize: 25,fontWeight: FontWeight.w700)),
        centerTitle: true,
      ),
      body: Center(child: Text(data.title,style:const TextStyle(fontSize: 25,fontWeight: FontWeight.w700))),
    );
  }
}
