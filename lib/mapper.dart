import 'package:webview_my_sites/json_handler.dart';

import 'file_handler.dart';
import 'main.dart';

Future<List<PageData>> getPages() async {
  Iterable i = await readJson();
  return i.map((item) => PageData.fromJsom(item)).toList();

}

savePages(List<PageData> pages){
   saveJson(pages);
}