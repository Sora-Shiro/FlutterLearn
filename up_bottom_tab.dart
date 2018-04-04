/*
 * Introduction:
 * Material
 * BottomNavigationBar + TabBar + TabBarView
 *
 */

import 'package:flutter/material.dart';
// import 'package:app/left_page.dart';
// import 'package:app/mid_page.dart';
// import 'package:app/right_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MaterialApp',
      theme: new ThemeData(
          brightness: Brightness.dark
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  int _bottomIndex = 1;
  var _tabTexts = ['A', 'B', 'C'];
  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('App'),
          bottom: new TabBar(controller: _tabController, tabs: <Tab>[
            new Tab(text: _tabTexts[0]),
            new Tab(text: _tabTexts[1]),
            new Tab(text: _tabTexts[2]),
          ]),
        ),
        body: new Container(
          padding: const EdgeInsets.all(2.0),
          child: new TabBarView(
            controller: _tabController,
            children: <Widget>[
              new LeftPage(),
              new MidPage(),
              new RightPage(),
            ],
          ),
        ),
        bottomNavigationBar: new GestureDetector(
          onTap: () {
            setState(() {
              //
            });
          },
          child: new BottomNavigationBar(
            currentIndex: _bottomIndex,
            items: [
              new BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                title: new Text(_tabTexts[0]),
              ),
              new BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                title: new Text(_tabTexts[1]),
              ),
              new BottomNavigationBarItem(
                icon: const Icon(Icons.star),
                title: new Text(_tabTexts[2]),
              )
            ],
            onTap: (int index) {
              print(index);
              setState(() {
                this._bottomIndex = index;
              });
            },
          ),
        )

    );
  }
}
