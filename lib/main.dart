import 'dart:convert';

import 'package:codeme_test/cast_view.dart';
import 'package:codeme_test/movie_single_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(test());
}
class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home:movies()
     
    );
  }
}
class movies extends StatefulWidget {
  const movies({super.key});

  @override
  State<movies> createState() => _moviesState();
}

class _moviesState extends State<movies> {

  var url= "https://api.tvmaze.com/shows";

  List<dynamic> movielist = [];
  var dic;
  @override
  void initState() {

    super.initState();
    getmovie();
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
    title: Text("Movies"),
    backgroundColor: const Color.fromARGB(255, 253, 17, 0), 
  ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          
          
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, 
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: movielist.length,
          itemBuilder: (context, index) {
             dic = movielist[index];
            return GestureDetector(
          onTap: () {
           
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => movie_single_view(list1:movielist[index]),
        ),
            );
          },
          child: Container(
  width: 300, // Set the desired width
  height: 200, // Set the desired height
  child: Card(
    child: Column(
      children: [
        Text("MOVIE NAME" + "-" + dic['name']),
        // Other widgets here
      ],
    ),
  ),
),

        );
        
          },
        ),
      )
,

    );
  }
    void getmovie() async{
     var response = await http.get(Uri.parse(url));
   // print(response);

    setState(() {
      
      movielist = jsonDecode(response.body);
    
    
    });
  }
}