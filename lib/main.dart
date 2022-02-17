import 'package:api_data/Sevice_Page/api_three.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Sevice_Page/api_one.dart';
import 'Sevice_Page/api_two.dart';

void main(){
  runApp(
    const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    )
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("API Service"),
        centerTitle: true,
      ),
      body: Center(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Api One"),
              onPressed: (){
                Get.to(const OneApi());
              },
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              child: const Text("Api Two"),
              onPressed: (){
                Get.to(const ApiTwo());
              },
            ),
            ElevatedButton(
              child: const Text("Api Three"),
              onPressed: (){
                Get.to(const ApiThree());
              },
            ),
          ],
        ),
      )
    );
  }
}
