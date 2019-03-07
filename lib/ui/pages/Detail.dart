import 'package:flutter/material.dart';
import 'dart:io';
import './home.dart';
class DetailPage extends StatelessWidget {
  final Map item;
  const DetailPage({Key key, this.item}) : super(key: key);
   _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete"),
          content: Text("Are you sure ?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Delete"),
              
              onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>HomePage())),
            ),
            FlatButton(
              child: Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    barrierDismissible: false,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(item["title"]),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.delete),
          onPressed: (){
            _showDialog(context);
            },)
        ],
        
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              child: Container(height: 400,width:400,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: FileImage(File(item["img"]),)
                )
              ),
            ),
            Text(item["title"], style: Theme.of(context).textTheme.display1,),
            SizedBox(height: 20.0,),
            Text(item["description"]),
            SizedBox(height: 20.0,),
            
          ],
        ),
      ),
    ); 
  }
  
}