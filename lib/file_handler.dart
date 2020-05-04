
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileHandler {
  Directory _directory;

  FileHandler(){}

  Future<Directory> get localDirectory async {
    if(_directory != null){
       return _directory;
    }
    _directory = await getApplicationDocumentsDirectory();
    return _directory;
}

  FileHandler.fromDirectory(Directory directory){
    _directory = directory;
  }

  Future<File> _localFile() async {
    final directory = await localDirectory;
    return File('${directory.path}/application.json');
}

  Future<File> writeText(String text) async {
    final file = await _localFile();
    return file.writeAsString('$text');
}

  Future<String> readText() async {
    try {
      final file = await _localFile();

      // Read the file.
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
    // If encountering an error, return 0.
      return "";
    }
  }
}