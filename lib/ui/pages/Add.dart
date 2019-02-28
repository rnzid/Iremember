import 'dart:io';
//import './home.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPage extends StatefulWidget {
  final Function add;
  AddPage(this.add);
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
 File _image;
 String title;
 String description;
  Future _getImage(ImageSource source) async {
    var img = await ImagePicker.pickImage(source:source);
    if(img != null) {
      setState(() {
        _image = img;
      });
    }
  }
  
  
  _showDialog(BuildContext context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return Dialog(
          child: Container(
            height: 190,
            child: Column(
            children: <Widget>[
              Container(color: Colors.cyanAccent,child: ListTile(title: Text("Image"),),),
              ListTile(
                title: Text("Take new Image"),
                trailing: Icon(Icons.camera),
                onTap: (){
                  _getImage(ImageSource.camera);
                    Navigator.pop(context);
                },
              ),
              Divider(),
              ListTile(title: Text("Select from gallary"),
                trailing: Icon(Icons.photo),
                onTap: (){
                  _getImage(ImageSource.gallery);
                    Navigator.pop(context);
                },
                ),
                
              
            ],
            ),
          ),
          
        );
      },
      barrierDismissible: true,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Add New',
        style: new TextStyle(
          color: Colors.white
        ),
        ),
      ),
      body:
      Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "img/asd.jpg",
                ),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Image.asset(
                "img/36411.png",
                height: 100,
              ),
              SizedBox(
                height: 30.0,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Title",
                    prefixIcon: Icon(Icons.title),
                    fillColor: Colors.white54,
                    filled: true,
                    ),
                    onChanged: (value){
                      setState(() {
                       title = value;
                      });
                    },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                maxLines: 10,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Description",
                    fillColor: Colors.white54,
                    filled: true),
              onChanged: (value){
                      setState(() {
                       description = value;
                      });
                    },
              ),
              SizedBox(
                height: 10.0,),
              ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 200
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.black,
                      child: _image == null
                          ? new SizedBox()
                          : new Image.file(_image),
                    ),
                  ),
                ],
              ),
            ),
              SizedBox(
                height: 50.0,
                width: double.infinity,
                child: RaisedButton.icon(
                  color: Theme.of(context).primaryColorDark,
                  onPressed: () => _showDialog(context),
                          icon: Icon(Icons.camera_enhance),
                          label: Text("choose Image"),
                ),
              ),
              SizedBox(height: 20.0,),
              SizedBox(
                height: 50.0,
                width: 200,
                child: RaisedButton(
                  color: Theme.of(context).primaryColorDark,
                  onPressed: () {
                    widget.add(title,description,_image);
                    Navigator.pop(context);
                  },
                          child: Text("Save"),
                )
                )
            ],
          ),
        ),
      ),
    );
  }
}
