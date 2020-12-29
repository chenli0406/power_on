import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  static const period = const Duration(seconds: 2);
  static const time = const Duration(seconds: 1);
  List<dynamic> listData = [];
  List<dynamic> listLength = [];
  List<dynamic> listLengthTwo = [];
  SwiperController _swiperController;
  // 初始化
  void initState() {
    super.initState();
    getHttp();
    getlistData();
  }

  @override
  void dispose() {
    super.dispose();
    getlistData();
  }

  // 定时器
  void getlistData() {
    // Timer.periodic(period, (timer){
    //    getHttp();
    // });
  }
  // 获取数据
  void getHttp() async {
    try {
      Response response =
          await Dio().get('https://jsonplaceholder.typicode.com/photos');
      setState(() {
        listData = response.data;
      });
      return print(listData);
    } catch (e) {
      return print(e);
    }
  }

  _tende() {
    return new ListView.builder(
      
      physics: ClampingScrollPhysics(),
      itemCount: listData != null && listData.length > 0 ? listData.length : 0,
      shrinkWrap: true,
      padding: EdgeInsets.all(0.0),
      itemBuilder: (BuildContext context, int position) {
        return new Container(
          // margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
          height: 50.0,
          decoration: new BoxDecoration(
            // color: listData[position].id % 2 == 0
             color:Color.fromRGBO(55, 102, 141, 0.6)
                // : Color(0xff013C6D),
          ),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.only(
                        right: 15.0, left: 15.0, top: 15.0, bottom: 10.0),
                    width: 100,
                    child: new Text(
                      listData[position].title,
                      style: TextStyle(
                          color: Color(0xffeeeeee),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  new Container(
                    width: 150,
                    margin: EdgeInsets.only(
                        right: 15.0, left: 15.0, bottom: 10.0, top: 15.0),
                    child: new Text(
                      listData[position].title,
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  new Container(
                    width: 200,
                    margin: EdgeInsets.only(
                        right: 15.0, left: 15.0, bottom: 10.0, top: 15.0),
                    child: new Text(
                      listData[position].title,
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  new Container(
                    width: 200,
                    margin: EdgeInsets.only(
                        right: 15.0, left: 15.0, bottom: 10.0, top: 15.0),
                    child: new Text(
                      listData[position].title,
                      style: TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 20,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  _renderList() {
    if(listData.length >= 10){
         listLength = listData.sublist(0,10);
         listLengthTwo = listData.sublist(10,20);
    }
    // Timer.periodic(time, (timer){
    //   print("111111");
    //    listLength = listData.sublist(10,20);
    // });

    List<Widget> containerBox = [];
    for (var i in listLength) {
      containerBox.add(new Container(
        // margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
        height: 50.0,
        decoration: new BoxDecoration(
          color: i["id"] % 2 == 0
              ? Color.fromRGBO(55, 102, 141, 0.6)
              : Color(0xff013C6D),
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Container(
                  margin: EdgeInsets.only(
                      right: 15.0, left: 15.0, top: 15.0, bottom: 10.0),
                  width: 100,
                  child: new Text(
                    i["title"],
                    style: TextStyle(
                        color: Color(0xffeeeeee),
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                new Container(
                  width: 150,
                  margin: EdgeInsets.only(
                      right: 15.0, left: 15.0, bottom: 10.0, top: 15.0),
                  child: new Text(
                    i["title"],
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                new Container(
                  width: 200,
                  margin: EdgeInsets.only(
                      right: 15.0, left: 15.0, bottom: 10.0, top: 15.0),
                  child: new Text(
                    i["title"],
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                new Container(
                  width: 200,
                  margin: EdgeInsets.only(
                      right: 15.0, left: 15.0, bottom: 10.0, top: 15.0),
                  child: new Text(
                    i["title"],
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ));
    }
    return Column(children: containerBox);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff013C6D),
      body: new CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          new SliverPadding(
            padding: const EdgeInsets.all(0.0),
            sliver: new SliverList(
                delegate: new SliverChildListDelegate(<Widget>[
              new Container(
                child: new Column(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(
                        right: 200.0,
                        left: 200.0,
                      ),
                      height: 80,
                      // decoration: new BoxDecoration(
                      //   color: Color(0xff0078D7),
                      // ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text('窗口取证',
                              style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold)),
                          new Text('45号',
                              style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                    new Container(
                      margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
                      height: 60.0,
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(55, 102, 141, 0.8),
                      ),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(
                                    right: 15.0,
                                    left: 15.0,
                                    top: 15.0,
                                    bottom: 10.0),
                                width: 100,
                                child: new Text(
                                  '姓名',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(0xffeeeeee),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              new Container(
                                width: 150,
                                margin: EdgeInsets.only(
                                    right: 15.0,
                                    left: 15.0,
                                    bottom: 10.0,
                                    top: 15.0),
                                child: new Text(
                                  '电话号码',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 26,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              new Container(
                                width: 200,
                                margin: EdgeInsets.only(
                                    right: 15.0,
                                    left: 15.0,
                                    bottom: 10.0,
                                    top: 15.0),
                                child: new Text(
                                  '事项名称',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 26,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              new Container(
                                width: 200,
                                margin: EdgeInsets.only(
                                    right: 15.0,
                                    left: 15.0,
                                    bottom: 10.0,
                                    top: 15.0),
                                child: new Text(
                                  '证照名称',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                    fontSize: 26,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    _renderList()
                  ],
                ),
              )
            ])),
          )
        ],
      ),
    );
  }
}
