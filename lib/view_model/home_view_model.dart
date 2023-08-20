import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/response/api_response.dart';

import '../model/news_article_model.dart';
import '../respository/home_repository.dart';
import '../utils/hive/connect_hive_News_data.dart';

class HomeViewViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  List<News> bookmarkedNews = [];
  ApiResponse<AtricleModel> newsList = ApiResponse.loading();
  Map<String, bool> expandedStateMap = {};
  // Declare the Hive instance

  setNewsStatus(ApiResponse<AtricleModel> response) {
    newsList = response;
    notifyListeners();
  }

  void toggleDescriptionExpansion(String articleId) {
    if (expandedStateMap.containsKey(articleId)) {
      expandedStateMap[articleId] = !expandedStateMap[articleId]!;
    } else {
      expandedStateMap[articleId] = true;
    }
    notifyListeners();
  }

  bool isDescriptionExpanded(String articleId) {
    return expandedStateMap.containsKey(articleId) &&
        expandedStateMap[articleId]!;
  }

  Future<void> fetchlatestNews() async {
    setNewsStatus(ApiResponse.loading());

    _myRepo.fetchlatestNews().then((value) {
      setNewsStatus(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setNewsStatus(ApiResponse.error(error.toString()));
    });
  }

  Future<void> searchNews(String keyword) async {
    setNewsStatus(ApiResponse.loading());
    log("here1 ");

    _myRepo.searchNewsbyKeyword(keyword).then((value) {
      setNewsStatus(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setNewsStatus(ApiResponse.error(error.toString()));
    });
  }

  Future<void> toggleBookmark(News news) async {
    final box = await Hive.openBox<News>('bookmarkNewsData');
    if (bookmarkedNews.contains(news)) {
      bookmarkedNews.remove(news);
      box.delete(news.id);
      log("removed");
    } else {
      log("added");
      bookmarkedNews.add(news);

      await box.put(news.id, news);
    }

    // await ConnectHiveNewsData.openBox(); // Open the Hive box before saving
    // ConnectHiveNewsData.setBookMarkDataData(bookmarkedNews);

    log(bookmarkedNews.length.toString());

    notifyListeners();
  }

  Future<void> loadBookmarkedNews() async {
    setNewsStatus(ApiResponse.loading());
    final box = await Hive.openBox<News>('bookmarkNewsData');
    bookmarkedNews = box.values.toList();
    log(bookmarkedNews.length.toString());
    notifyListeners();
  }

  Future<void> clearBookmarkData() async {
    final box = await Hive.openBox<News>('bookmarkNewsData');
    await box.clear();
    bookmarkedNews.clear();
  }

  Future<bool> isNewsInHive(News news) async {
    final box = await Hive.openBox<News>('bookmarkNewsData');
    return box.containsKey(news.id);
  }

  Future<void> categoryWiseNews(String category) async {
    setNewsStatus(ApiResponse.loading());

    _myRepo.searchNewsbyCategory(category).then((value) {
      print(value.news![0].title.toString());
      setNewsStatus(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setNewsStatus(ApiResponse.error(error.toString()));
    });
  }
}
