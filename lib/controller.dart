import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:webview_my_sites/mapper.dart';

import 'main.dart';

part 'controller.g.dart';

class ControllerStore = Controller with  _$ControllerStore;

abstract class Controller with Store {

  @observable
  int labelSelected = 0;

  @observable
  int  pageSelected = 0;

  @observable
  List<PageData> pages = new List<PageData>();

  @computed
  int get size => pages.length; 

  initPages() async {
    var _pages = await getPages();
    if(_pages.isEmpty){
      _pages.insert(0,new PageData(new List<LabelModel>(),"teste", '', Colors.green));
      _pages.add(new PageData(new List<LabelModel>(),"teste", '',Colors.green));
    }
    pages = _pages;
  }

  addLabel(String label,String url,PageController controller){
    var _pages = pages;
    PageData page = _pages[controller.page.toInt()];
    if(page.lista.isEmpty){
      if(controller.page.toInt() == 0){
        _pages.insert(0,new PageData(new List<LabelModel>(),"teste", '', Colors.green));
      }
      else {
        _pages.add(new PageData(new List<LabelModel>(),"teste", '', Colors.green));
      }
    }
    page.lista.add(new LabelModel(label, url));
    page.urlWebview = url;
    pages = _pages;
    savePages(pages);
  }

}