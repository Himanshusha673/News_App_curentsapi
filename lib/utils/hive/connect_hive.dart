import 'package:hive/hive.dart';

class ConnectHive {
  ///* --------------- Box name --------------- *///
  static const String boxNameNewsData = "bookmarkedData";

  ///* --------------- initialize Box --------------- *///

  static final Box boxNewsData = Hive.box(boxNameNewsData);
}
