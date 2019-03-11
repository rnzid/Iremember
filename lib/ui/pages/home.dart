import 'dart:convert';
import 'dart:io';
import 'package:app4/models/item_model.dart';
import 'package:flutter/material.dart';
import './Add.dart';
import './Detail.dart';
import '../../resources/db_provider.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List items = [];

  void initState() {
    super.initState();
  }

  Future<List> getItems() async {
    return DbProvider().fetchItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        leading: Icon(Icons.home),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
        future: getItems(),
        builder: (BuildContext context, AsyncSnapshot<List> snapShot) {
          if (!snapShot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snapShot.hasError)
            return Center(
              child: Text("there is error"),
            );
          List items = snapShot.data;
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              ItemModel item = ItemModel.fromMap(items[index]);
              return Column(
                children: <Widget>[
                  ListTile(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DetailPage(
                                  item: item,
                                  removeItem: removeItem,
                                ))),
                    isThreeLine: true,
                    title: Text(item.title),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _delete(item),
                    ),
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                        File(item.image),
                      ),
                      radius: 34,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(item.description),
                        SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                ],
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (_) => AddPage())),
        tooltip: "Add Item",
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.green[200],
    );
  }

  void _delete(ItemModel item) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete item"),
            content: Text("Are you sure you want to delete Item?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancel"),
                onPressed: () => Navigator.pop(context),
              ),
              FlatButton(
                  child: Text("Delete"),
                  onPressed: () {
                    removeItem(item);
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  void removeItem(ItemModel item) {
    setState(() {
      DbProvider().deleteItem(item.id);
    });
  }
}
