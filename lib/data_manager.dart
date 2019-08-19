import 'package:children_activity_flutter/cld_act_data.dart';

class DataMgr {
  cld_act_data _data;
  factory DataMgr() =>_getInstance();
  static DataMgr get instance => _getInstance();
  static DataMgr _instance;
  DataMgr._internal() {
    // 初始化
  }
  static DataMgr _getInstance() {
    if (_instance == null) {
      _instance = new DataMgr._internal();
    }
    return _instance;
  }

  cld_act_data getData() {
    return _data;
  }

  setData( cld_act_data newData ) {
    _data = newData;
  }

}