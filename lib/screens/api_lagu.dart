import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  Future<List> getData() async {
    final response= await http.get(Uri.parse("http://localhost/api-appmusic/lagu"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("MY LAGU"),),
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if(snapshot.hasError) print(snapshot.error);

          return snapshot.hasData 
          ? new ItemList() 
          : new Center(child: new CircularProgressIndicator(),);
        },
        ),
    );
  }
}

class ItemList extends StatelessWidget {

  final List list;
  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: list==null ? 0 : list.length,
      itemBuilder: (context, i) {
        return Container(
          padding: const EdgeInsets.all(10.0),
                  child: new Card(
                    child: new ListTile(
              title: new Text(list[i]['judul']),
              leading: new Icon(Icons.widgets),
              subtitle: new Text("NamaPenyanyi : ${list[i]['namapenyanyi']}"),
            ),
          ),
        );
      },
    );
  }
}
