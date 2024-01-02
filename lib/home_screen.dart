
import 'dart:convert';

import 'package:apis/Modals/PostsModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostsModal> postList = [];

  Future<List<PostsModal>> getPostApi()async{
    final response =await http.get(Uri.parse('http://jsonplaceholder.typicode.com/posts')
    );
    var data = jsonDecode(response.body.toString());

    if(response.statusCode==200){
      for(Map i in data){
        postList.add(PostsModal.fromJson(i));
      }
      return postList;

    }else{
      return postList;

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Course'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(

              builder: (context,snapshot){
                if(!snapshot.hasData){
                  return Text('Loading');

                }else{
                  return ListView.builder(
                    itemCount: postList.length,
                      itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(postList[index].title.toString()),
                          Text(postList[index].title.toString())
                          ],
                        ),

                      ),
                    );
                  });

                }

              }, future: getPostApi(),
            ),
          )

        ],
      ),
    );

  }


  }





