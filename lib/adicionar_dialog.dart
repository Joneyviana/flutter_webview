import 'package:flutter/material.dart';

class AdicionarDialog {
  void build(BuildContext context,Function f, Color color) async {
    String name ="";
    String url ="";
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child:Container(
          padding: EdgeInsets.all(16),  
          height: 200,
          child:new Center(
            child:new Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              new TextField(decoration: new InputDecoration(
                 hintText: 'Label Name'),
                 onChanged: (text) =>{name = text},),
              new TextField(decoration: new InputDecoration(
                 hintText: 'Url'),
                 onChanged: (text) =>{url = text},
                 ),
              Container(
                padding:EdgeInsets.only(top:20),
                child:new FlatButton(
                child: new Text("Ok"),
                shape: CircleBorder(),
                color:color,
                onPressed: () async {
                  await f(name,url);
                  Navigator.pop(context,true);
            },
          )),
            ],
          ),
        )));
      },
    );
  }

}