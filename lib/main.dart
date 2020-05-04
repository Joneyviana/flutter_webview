import 'dart:convert';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'add.dart';
import 'adicionar_dialog.dart';
import 'controller.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class LabelModel {
  String name;
  String url;

  LabelModel.fromJson(Map<String, dynamic> json):
     name = json['name'],
     url = json['url'];
  

  LabelModel(String name,String url){
    this.name = name;
    this.url = url;
  }
  toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class PageData {
  List<LabelModel> lista = new List<LabelModel>();
  String name;
  String urlWebview;
  Color color;

  

  PageData.fromJsom(Map<dynamic, dynamic> json):
      name = json['name'],
      urlWebview = json['urlWebview'],
      color = Color(json['color']),
      lista = (json['lista'] as List).map((item) => 
        LabelModel.fromJson(item)).toList();
 
  PageData(this.lista, this.name, this.urlWebview, this.color);

  toJson() {
    return {
      'name': name,
      'urlWebview': urlWebview,
      'lista':lista,
      'color':color.value
    };
  }

}

class _MyHomePageState extends State<MyHomePage> {

  List<PageData> listPage = new List<PageData>();
  WebViewController _controller ;

  PageController pageController = PageController();

  final Set<Factory> gestureRecognizers = [
Factory(() => PlatformViewVerticalGestureRecognizer())].toSet();

  int indexSelected  = 0;

  Controller controller = new ControllerStore();

  @override
  void initState() {
    controller.initPages();
    setState(() {
      
      List<LabelModel> listaLabel1 = new List<LabelModel>();
      listaLabel1.add(LabelModel('MindOrks','https://blog.mindorks.com/'));
      listaLabel1.add(LabelModel('AndroidPro','https://www.androidpro.com.br/blog/'));
      listaLabel1.add(LabelModel('AndroidPub','https://android.jlelse.eu/'));
      listaLabel1.add(LabelModel('DroidOnRoad','https://www.thedroidsonroids.com/blog'));
      listaLabel1.add(LabelModel('raywenderlich','https://www.raywenderlich.com/'));
      var urlWebview1 = 'https://blog.mindorks.com/';
      listPage.add(new PageData(listaLabel1,"teste", urlWebview1, null));
      var urlWebview2 = 'https://realpython.com/';
      List<LabelModel> listaLabel2 = new List<LabelModel>();
      listaLabel2.add(LabelModel('realPython','https://realpython.com/'));
      listaLabel2.add(LabelModel('testDriven','https://testdriven.io/blog/'));
      listPage.add(new PageData(listaLabel2,"python",urlWebview2,null));
    });
    super.initState();
  }

  getWebview(int indexPage){
    print("teste"+ controller.pages[indexPage].urlWebview);
    if(controller.pages[indexPage].urlWebview.isNotEmpty){
    return 
      Expanded(child:WebView(
                  gestureRecognizers:gestureRecognizers,
                  initialUrl: controller.pages[indexPage].urlWebview,
                  onWebViewCreated: (WebViewController webViewController) {
                    _controller = webViewController;
                   },
                   javascriptMode: JavascriptMode.unrestricted,
                ));
    }
    return Container();

  }

  createLabel(int indexLabel,int indexPage,BuildContext context){
    PageData page = controller.pages[indexPage];
    if(page.lista.length == indexLabel){
      return Container(
        margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
        child:add(page.color,Colors.white,
          () => new AdicionarDialog().build(context, 
            (label,url) => 
            controller.addLabel(label, url, pageController),page.color) ));
    }
    Function changeUrl = ()=> { 
      getNewWebview(page.lista[indexLabel].name),
      controller.labelSelected = indexLabel
    };
    if(indexLabel == controller.labelSelected){
      return label(page.color,Colors.white,
      page.lista[indexLabel].name,changeUrl);
    }
    return label(Colors.white,page.color,page.lista[indexLabel].name,changeUrl);
  }

  SafeArea createPage(int indexPage){
    return SafeArea(child:Observer(builder:(_) => Column(
              children:[SizedBox(
                height: 70,
                child:ListView.builder(
                scrollDirection: Axis.horizontal, 
                itemCount: controller.pages[indexPage].lista.length+1,
                itemBuilder: (BuildContext context, int indexLabel) {
                return createLabel(indexLabel,indexPage,context);
                },
              )),
               getWebview(indexPage)
             ])), // This trailing comma makes auto-formatting nicer for build methods.
          );
  }

  

  Container label(Color backgroundColor,Color textColor,String text,Function function){
    return Container(
      margin: new EdgeInsets.symmetric(horizontal: 5.0, vertical: 12.0),
      width:120,
      child:MaterialButton(
       
        onPressed:() =>function,
          color:backgroundColor,
          textColor: textColor ,
          child: Text(text),
            padding: EdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
          ));
        }
      
        @override
        Widget build(BuildContext context) {
          // This method is rerun every time setState is called, for instance as done
          // by the _incrementCounter method above.
          //
          // The Flutter framework has been optimized to make rerunning build methods
          // fast, so that you can just rebuild anything that needs updating rather
          // than having to individually change instances of widgets.
          return Scaffold(body:Observer(builder:(_) => PageView.builder(
            controller: pageController,
            physics: AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, position) {
              return createPage(position);
            },
            itemCount: controller.size,
          )));
        }
      
  getNewWebview(String url) {
    print("ue o que isso poxa blabla");
    _controller.loadUrl(url);

  }
}

class PlatformViewVerticalGestureRecognizer
    extends VerticalDragGestureRecognizer {
  PlatformViewVerticalGestureRecognizer({PointerDeviceKind kind})
      : super(kind: kind);

  Offset _dragDistance = Offset.zero;

  @override
  void addPointer(PointerEvent event) {
    startTrackingPointer(event.pointer);
  }

  @override
  void handleEvent(PointerEvent event) {
    _dragDistance = _dragDistance + event.delta;
    if (event is PointerMoveEvent) {
      final double dy = _dragDistance.dy.abs();
      final double dx = _dragDistance.dx.abs();

      if (dy > dx && dy > kTouchSlop) {
        // vertical drag - accept
        resolve(GestureDisposition.accepted);
        _dragDistance = Offset.zero;
      } else if (dx > kTouchSlop && dx > dy) {
        // horizontal drag - stop tracking
        stopTrackingPointer(event.pointer);
        _dragDistance = Offset.zero;
      }
    }
  }

  @override
  String get debugDescription => 'horizontal drag (platform view)';

  @override
  void didStopTrackingLastPointer(int pointer) {}
}
