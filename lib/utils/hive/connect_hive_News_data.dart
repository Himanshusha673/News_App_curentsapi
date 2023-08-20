import 'package:hive/hive.dart';

import '../../model/news_article_model.dart';
import 'connect_hive.dart';

class ConnectHiveNewsData {
  ///* --------------- key --------------- *///
  static const _bookMarkedData = "bookMarkedData";

  ///* --------------- function --------------- *///
  /// openBox
  static openBox() async => await Hive.openBox(ConnectHive.boxNameNewsData);

  /// clear
  static get clear async => await ConnectHive.boxNewsData.clear();

  static setBookMarkDataData(List<News> data) {
    ConnectHive.boxNewsData.put(_bookMarkedData, data);
  }

  //get all profile data of user
  static List<News> getBookMarkData() {
    List<News> data = ConnectHive.boxNewsData.get(_bookMarkedData);
    return data;
  }
}
