import 'dart:convert';

import 'package:codeme_test/cast_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class movie_single_view extends StatefulWidget {
  var list1;
   movie_single_view( {required this.list1});

  @override
  State<movie_single_view> createState() => _movie_single_viewState();
}

class _movie_single_viewState extends State<movie_single_view> {

   var url= "https://api.tvmaze.com/shows";
   List<dynamic> movielist2 = [];
   var dict={};
   List data=[];
   var id;



   @override
  void initState() {
    
    super.initState();
    getsinglemovie();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
    title: Text("Movie"),
    backgroundColor: const Color.fromARGB(255, 255, 17, 0), 
  ),
      body: Column(
        children: [
          Text("Name"+""+dict['name']),
          Text("language"+" "+dict['language']),
          Text("status"+" "+dict['status']),

          for (int i = 0; i < data.length; i++) Text("genres"+" "+data[i]),


         ElevatedButton(onPressed: (){
                   Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  cast_view(list1:id)),
                  );
                  }, child: Text("more details"))

        ],

      

      ),

    );
  }
  void getsinglemovie() async{
     id = int.parse(widget.list1["id"].toString());
    print(id);
     var response = await http.get(Uri.parse('$url/$id'));
    setState(() {
      dict = jsonDecode(response.body);
      data=dict['genres'];


    });
  }
}