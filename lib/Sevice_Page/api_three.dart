import 'dart:convert';

import 'package:api_data/model_class/Photo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart'as http;

import '../Screen/data_page2.dart';

class ApiThree extends StatefulWidget {
  const ApiThree({Key? key}) : super(key: key);

  @override
  _ApiThreeState createState() => _ApiThreeState();
}

class _ApiThreeState extends State<ApiThree> {
  Future<List<Photo>?>fatchData()async{
    String API="https://jsonplaceholder.typicode.com/photos";

    http.Response  res=await http.get(Uri.parse(API));

    if (res.statusCode==200) {
      List<dynamic> data=jsonDecode(res.body);
      return data.map((e) =>Photo.fromJson(e)).toList();
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text("Ap Three"),
        centerTitle:true,
      ),
      body: FutureBuilder(
        future: fatchData(),
        builder:(context,snapshot){
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          else if (snapshot.hasData) {
            List<Photo>? data=snapshot.data as List<Photo>?;
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder:(context,i){
                return Card(
                  margin: EdgeInsets.all(8),
                  elevation: 10,
                  color: Colors.pink,
                  child:ListTile(
                    leading: CircleAvatar(backgroundImage: NetworkImage("${data?[i].thumbnailUrl}"),
                      maxRadius: 30,
                  ),
                    title: Text("${data?[i].title}"),
                    subtitle: Text("${data?[i].id}"),
                    onTap: (){
                      Get.to(Page2(),arguments: data?[i]);
                    },
                  ),
                );
              }
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}
