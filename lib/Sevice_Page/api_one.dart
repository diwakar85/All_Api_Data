import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model_class/Post.dart';
import 'package:http/http.dart'as http;
import 'package:api_data/Screen/data_page.dart';

class OneApi extends StatefulWidget {
  const OneApi({Key? key}) : super(key: key);

  @override
  _OneApiState createState() => _OneApiState();
}

class _OneApiState extends State<OneApi> {
  Future<List<Post>?>fatchPost()async{
    String API="https://jsonplaceholder.typicode.com/posts";

    http.Response res=await http.get(Uri.parse(API));

    if (res.statusCode==200) {
      List<dynamic> data=jsonDecode(res.body);

      return data.map((e) => Post.fromJson(e)).toList();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text("First Api"),centerTitle: true,),
      body:FutureBuilder(
          future: fatchPost(),
          builder: (context,snapshot){
            if (snapshot.hasError){

              return Text("${snapshot.error}");
            }
            else if (snapshot.hasData) {
              List<Post>?data=snapshot.data as List<Post>?;
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context,i){
                    return Card(
                      elevation: 10,
                      margin: const EdgeInsets.all(10),
                      color: Colors.pink,
                      child:ListTile(
                        leading: Text("${data?[i].id}"),
                        title: Text("${data?[i].title}"),
                        onTap: (){
                          Get.to(Screen(),arguments: data?[i]);
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
