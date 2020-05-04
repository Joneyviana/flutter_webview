import 'dart:convert';

import 'file_handler.dart';

saveJson(object) async{
 String content = jsonEncode(object);
 await new FileHandler().writeText(content);
}

Future<Iterable> readJson() async{
  String text = await FileHandler().readText();
  try {
    Iterable jsonMap = jsonDecode(text);
    return jsonMap;
  }
  catch (e) {
    return new List();
  }
 
}