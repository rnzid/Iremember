import 'package:app4/models/item_model.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import './home.dart';
class DetailPage extends StatelessWidget {
  
  //final String title;
  //final String description;
  //final File _image;
  final Function removeItem;
  final ItemModel item;
  // void initState() {
  //   super.initState();
  //   removeItem(item);
  // }
  const DetailPage({Key key, this.item,this.removeItem}) : super(key: key);
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
              //removeItem(title, description, _image),
              
            onPressed: () {
              removeItem(item);
               Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context)=>HomePage())
              );
}            ),
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
        title: Text(item.title),
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
                  image: FileImage(File(item.image),)
                )
              ),
            ),
            Text(item.title, style: Theme.of(context).textTheme.display1,),
            SizedBox(height: 20.0,),
            Text(item.description),
            SizedBox(height: 20.0,),
            
          ],
        ),
      ),
    ); 
  }
  
}