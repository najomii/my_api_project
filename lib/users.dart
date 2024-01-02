
import 'dart:convert';

import 'package:apis/Modals/UserModal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();


}

class _UsersState extends State<Users> {
  List<UserModal> userList  = [];
  Future<List<UserModal>> getUsersApi()async{
    final response =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    var data = jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){

        userList.add(UserModal.fromJson(i));

      }
      return userList;

    }else{
      return userList;

    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[200],
        title: Text('Users'),
      ),
      body: Column(
        children: [
          Expanded(child: FutureBuilder(
              future: getUsersApi(),
              builder: (context, AsyncSnapshot<List<UserModal>> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                } else {

                }
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder:
                        (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ReuseableRow(title: 'Name', value: snapshot.data![index].name.toString()),
                              ReuseableRow(title: 'UserName', value: snapshot.data![index].username.toString()),
                              ReuseableRow(title: 'Email', value: snapshot.data![index].email.toString())

                            ],

                          ),
                        ),
                      );
                    });
              }
          ))

        ],
      ),
    );
  }
}
class ReuseableRow extends StatelessWidget {
  String title,value;
   ReuseableRow({super.key,required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment
            .spaceBetween,
        children: [
          Text(title),
          Text(value ),
        ],
      ),
    );
  }
}



