class cld_act_data {
  List<Datas> datas;

  cld_act_data({this.datas});

  cld_act_data.fromJson(Map<String, dynamic> json) {
    if (json['datas'] != null) {
      datas = new List<Datas>();
      json['datas'].forEach((v) {
        datas.add(new Datas.fromJson(v));
      });
    }
  }

//  cld_act_data.setDatasFromJson(Map<String, dynamic> json) {
//    json
//  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.datas != null) {
      data['datas'] = this.datas.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Datas {
  String version;
  String uID;
  String title;
  String category;
  List<ShowInfo> showInfo;
  String showUnit;
  String discountInfo;
  String descriptionFilterHtml;
  String imageUrl;
  List<String> masterUnit;
  List<String> subUnit;
  List<String> supportUnit;
  List<String> otherUnit;
  String webSales;
  String sourceWebPromote;
  String comment;
  String editModifyDate;
  String sourceWebName;
  String startDate;
  String endDate;
  int hitRate;

  Datas(
      {this.version,
        this.uID,
        this.title,
        this.category,
        this.showInfo,
        this.showUnit,
        this.discountInfo,
        this.descriptionFilterHtml,
        this.imageUrl,
        this.masterUnit,
        this.subUnit,
        this.supportUnit,
        this.otherUnit,
        this.webSales,
        this.sourceWebPromote,
        this.comment,
        this.editModifyDate,
        this.sourceWebName,
        this.startDate,
        this.endDate,
        this.hitRate});

  Datas.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    uID = json['UID'];
    title = json['title'];
    category = json['category'];
    if (json['showInfo'] != null) {
      showInfo = new List<ShowInfo>();
      json['showInfo'].forEach((v) {
        showInfo.add(new ShowInfo.fromJson(v));
      });
    }
    showUnit = json['showUnit'];
    discountInfo = json['discountInfo'];
    descriptionFilterHtml = json['descriptionFilterHtml'];
    imageUrl = json['imageUrl'];
    masterUnit = json['masterUnit'].cast<String>();
    subUnit = json['subUnit'].cast<String>();
    supportUnit = json['supportUnit'].cast<String>();
    otherUnit = json['otherUnit'].cast<String>();
    webSales = json['webSales'];
    sourceWebPromote = json['sourceWebPromote'];
    comment = json['comment'];
    editModifyDate = json['editModifyDate'];
    sourceWebName = json['sourceWebName'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    hitRate = json['hitRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['version'] = this.version;
    data['UID'] = this.uID;
    data['title'] = this.title;
    data['category'] = this.category;
    if (this.showInfo != null) {
      data['showInfo'] = this.showInfo.map((v) => v.toJson()).toList();
    }
    data['showUnit'] = this.showUnit;
    data['discountInfo'] = this.discountInfo;
    data['descriptionFilterHtml'] = this.descriptionFilterHtml;
    data['imageUrl'] = this.imageUrl;
    data['masterUnit'] = this.masterUnit;
    data['subUnit'] = this.subUnit;
    data['supportUnit'] = this.supportUnit;
    data['otherUnit'] = this.otherUnit;
    data['webSales'] = this.webSales;
    data['sourceWebPromote'] = this.sourceWebPromote;
    data['comment'] = this.comment;
    data['editModifyDate'] = this.editModifyDate;
    data['sourceWebName'] = this.sourceWebName;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['hitRate'] = this.hitRate;
    return data;
  }
}

class ShowInfo {
  String time;
  String location;
  String locationName;
  String onSales;
  String price;
  String latitude;
  String longitude;
  String endTime;

  ShowInfo(
      {this.time,
        this.location,
        this.locationName,
        this.onSales,
        this.price,
        this.latitude,
        this.longitude,
        this.endTime});

  ShowInfo.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    location = json['location'];
    locationName = json['locationName'];
    onSales = json['onSales'];
    price = json['price'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    endTime = json['endTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['location'] = this.location;
    data['locationName'] = this.locationName;
    data['onSales'] = this.onSales;
    data['price'] = this.price;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['endTime'] = this.endTime;
    return data;
  }
}
