import 'package:flutter/material.dart';

add(Color backgroundColor,Color textColor,Function function){
  return MaterialButton(
  onPressed:function,
  color:backgroundColor,
  textColor: textColor ,
  child: Icon(
    Icons.add,
    size: 24,
  ),
  padding: EdgeInsets.all(16),
  shape: CircleBorder(),
);
}