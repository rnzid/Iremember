import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:image_picker/image_picker.dart';
import './Add.dart';
import './Detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List item1 = [];
  adding(String title,String description,File image){
    setState(() {
      item1.add({
        "title": title,
        "description":description,
        "img": image
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
       itemCount: item1.length,
        itemBuilder: (BuildContext context, int  index) {
          var item =item1[index];
          return ListTile(
             onTap: ()=>Navigator.push(context, MaterialPageRoute(
               builder: (_) => ItemDetails(item:item)
             )), 
                    isThreeLine: true,
            title: Text(item["title"]),
            leading:CircleAvatar(
              backgroundImage:FileImage(item["img"],),
            radius:40,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(item["description"]),
                SizedBox(height: 50,),
                ],
                    ),
          );
        },
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>AddPage(adding))),
        tooltip: 'Add more item',
        child: Icon(Icons.add),
      ),
    );
  }
}