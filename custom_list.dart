/*
 * Introduction:
 * Material
 * CustomScrollView + SliverChildBuilderDelegate + ListTile
 * Becareful of ListTile.isThreeLine
 *
 */

import 'package:flutter/material.dart';


class LeftPage extends StatefulWidget {

  @override
  _LeftPageState createState() => new _LeftPageState();

}

class _LeftPageState extends State<LeftPage> with TickerProviderStateMixin {

  List _listData;

  @override
  void initState() {
    super.initState();
    getListData();
  }

  void getListData() {
    _listData = [
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "title_text": "title_1_isThreeLine[true]",
        "trailing": null,
        "subtitle_text": "Detail: asdfghjkkl\nzxcvbnm",
        "isThreeLine": true,
      },
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "title_2_isThreeLine[false]",
        "subtitle_text": "Detail: asdfghjkkl\nzxcvbnm",
        "isThreeLine": false,
      },
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "title_3_isThreeLine[true]",
        "subtitle_text": "",
        "isThreeLine": true,
      },
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "title_4_isThreeLine[false]",
        "subtitle_text": "",
        "isThreeLine": false,
      },
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "title_5_isThreeLine[false]",
        "subtitle_text": "",
        "isThreeLine": false,
      },
      {
        "leading": new Icon(
          Icons.event,
          color: Colors.white,
        ),
        "trailing": null,
        "title_text": "title_6_isThreeLine[true]",
        "subtitle_text": "",
        "isThreeLine": true,
      },
    ];
  }

  Widget generateListItem(BuildContext buildContext, int index) {
    if (index & 1 == 0) {
      var data = _listData[index ~/ 2];
      return new ListTile(
        leading: data["leading"],
        trailing: data["trailing"],
        isThreeLine: data["isThreeLine"],
        title: new Text(
          data["title_text"],
          style: new TextStyle(
              color: Colors.white
          ),
        ),
        subtitle: new Text(
          data["subtitle_text"],
          style: new TextStyle(
              color: Colors.white
          ),
        ),
        enabled: true,
        onTap: () {
          setState(() {

          });
        },
      );
    } else {
      return new Divider(
        color: Colors.white70,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(_listData.length);
    return new Container(
        child: new Container(
            child: new CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                new SliverPadding(
                    padding: const EdgeInsets.all(20.0),
                    sliver: new SliverList(
                      delegate: new SliverChildBuilderDelegate(
                        generateListItem,
                        childCount: 2 * _listData.length - 1,
                      ),
                    )
                )
              ],
            )
        )
    );
  }
}