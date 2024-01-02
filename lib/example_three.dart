
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleThree extends StatefulWidget {
  const ExampleThree({super.key});

  @override
  State<ExampleThree> createState() => _ExampleThreeState();
}

class _ExampleThreeState extends State<ExampleThree> {
  var data;
  Future<void> getUserApi ()async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if(response.statusCode==200){
      data = jsonDecode(response.body.toString());


    }else{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text('Example Three'),
      ),
      body:Column(
        children: [
          Expanded(child: FutureBuilder(
            future:getUserApi() ,
            builder:(context,snapshot){
              return Text('');
            } ,
          ))
        ],
      ) ,
    );
  }
}
