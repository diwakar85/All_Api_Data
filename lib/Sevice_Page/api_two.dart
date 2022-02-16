import 'dart:convert';

import 'package:api_data/model_class/Comment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class ApiTwo extends StatefulWidget {
  const ApiTwo({Key? key}) : super(key: key);

  @override
  _ApiTwoState createState() => _ApiTwoState();
}

class _ApiTwoState extends State<ApiTwo> {
  Future<List<Comment>?> fatchData()async{
    String API="https://jsonplaceholder.typicode.com/comments";
    http.Response res=await http.get(Uri.parse(API));
    if (res.statusCode==200) {
      List<dynamic> data=jsonDecode(res.body);

      return data.map((e) =>Comment.fromJson(e)).toList();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: fatchData(),
        builder: (context,sanpshot){
          if (sanpshot.hasError) {
            return Text("${sanpshot.error}");
          }
          else if (sanpshot.hasData) {
            List<Comment>? data=sanpshot.data as List<Comment>?;
            return ListView.builder(
              itemCount:data?.length,
              itemBuilder: (context,i){
                return Card(
                  elevation: 10,
                  color: Colors.pink,
                  child:ListTile(
                    leading: Text("${data?[i].id}"),
                    title: Text("${data?[i].name}"),
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
