import 'package:flutter/material.dart';
//import 'dart:io';
class ItemDetails extends StatelessWidget {
  final Map item;
 const ItemDetails({Key key, this.item}): super(key: key);
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orange,
        title: Text(item["title"]),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DecoratedBox(
              child:Container(
                height:150, width:150,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(item["img"],),
                )
              ),
            ),
        
            Text(item["title"], style: Theme.of(context).textTheme.display1,),
            SizedBox(height:30.0,),
            Text(item["description"]),
            SizedBox(height:40.0,),
          
           
            ],
        ),
      ),
    );
  }
}