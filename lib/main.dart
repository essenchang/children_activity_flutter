import 'dart:convert';
import 'dart:io';

import 'package:children_activity_flutter/cld_act_data.dart';
import 'package:children_activity_flutter/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '台北市立動物園'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new StoreListPage(widget: widget);
  }
}

class StoreListPage extends StatefulWidget {
  const StoreListPage({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  _StoreListPageState createState() => _StoreListPageState();
}

class _StoreListPageState extends State<StoreListPage> {
  bool isShowList = false;

  @override
  void initState() {
    super.initState();
    _getDataFromWeb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.widget.title),
        leading: Icon(Icons.dehaze),
        actions: <Widget>[
          // action button
          IconButton(
            icon: Icon(Icons.apps),
            onPressed: () {
              setState(() {
                isShowList = !isShowList;
              });
            },
          )
        ],
      ),
      body: isShowList ? _getListView() : _getCardView(),
    );
  }

  GridView _getCardView() {
    cld_act_data data = DataMgr.instance.getData();
    if (data == null) {
      print('_getCardView zooDat == null');

      return null;
    }

    return GridView.builder(
      itemCount: data.datas.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemBuilder: _getCardItem,
    );
  }

  Widget _getCardItem(context, index) {
    Datas item = DataMgr.instance.getData().datas[index];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        children: <Widget>[
          //Image.asset("images/ic_placeholder.png"),
          Image.network(item.imageUrl,
              width: 100, height: 100, fit: BoxFit.fitHeight),

          SizedBox(
            width: 8,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.title,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  item.discountInfo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  item.startDate+"~"+item.endDate,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView _getListView() {
    print('_getListView');

    cld_act_data data = DataMgr.instance.getData();
    if (data == null) {
      print('_getListView zooDat == null');

      return null;
    }

    return ListView.separated(
      itemCount: data.datas.length,
      itemBuilder: _getListItem,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          color: Color(0xFFAACCAA),
          height: 2,
        );
      },
    );
  }

  Widget _getListItem(context, index) {
    Datas item = DataMgr.instance.getData().datas[index];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: <Widget>[
          //Image.asset("images/ic_placeholder.png"),
          Image.network(item.imageUrl,
              width: 100, height: 100, fit: BoxFit.fitHeight),

          SizedBox(
            width: 8,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.title,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  item.discountInfo,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  item.startDate+"~"+item.endDate,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _getDataFromWeb() async {
    var url =
        'https://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=4';
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    //print('Response body: ${response.body}');

    // 中文 Utf8 處理.
    Utf8Decoder decoder = Utf8Decoder();
    String result = decoder.convert(response.bodyBytes);
    print('Response body: ${result}');
    result = "{\"datas\":"+result+"}";

    //zooData = ZooData.fromJson(json.decode(result));
    print('before setState');
    setState(() {
      cld_act_data data = cld_act_data.fromJson(json.decode(result));
      DataMgr.instance.setData(data);

      print('in setState');
    });
  }
}
