import 'package:flutter/material.dart';
import 'pages/indexPage.dart';
import 'package:provide/provide.dart';
import './provide/doubleball.dart';

void main() {
  var providers = Providers();
  var doubleListProvide = DoubleListProvide();
  providers
  ..provide(Provider<DoubleListProvide>.value(doubleListProvide));
  runApp(ProviderNode(child: MyApp(),providers: providers));
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        title: '双色球自选APP',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blueAccent
        ),
        home: Scaffold(
          appBar: AppBar(title: Text('双色球选号'),),
          backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
          body: IndexPage()
        )
      )
    );
  }
}

