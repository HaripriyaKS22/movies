import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class cast_view extends StatefulWidget {
  var list1;
  cast_view({required this.list1});

  @override
  State<cast_view> createState() => _cast_viewState();
}

class _cast_viewState extends State<cast_view> {
  var url="https://api.tvmaze.com/shows/";
    List<dynamic> castlist = [];

    var dict={};

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getcast();
   
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
    title: Text("Cast"),
    backgroundColor: Color.fromARGB(255, 255, 17, 1), 
  ),
      body:ListView.builder(
  itemCount: castlist.length,
  itemBuilder: (context, index) {
    var cast = castlist[index];
    var personName = cast['person']['name'];
    var characterName = cast['character']['name'];

    return Card(
      child: Column(
        children: [
          Text('Person: $personName'),
          Text('Character: $characterName'),
        ],
      ),
    );
  },
),

       

    );
  }

   void getcast() async{
    // int id = int.parse(widget.list1["id"].toString());
    var id=widget.list1;
    // print(id);
     var response = await http.get(Uri.parse('$url$id/cast'));
    setState(() {
      castlist = jsonDecode(response.body);
      



    });
  }
}