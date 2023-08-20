import 'dart:developer';

import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiService.dart';
import '../model/news_article_model.dart';
import '../res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiService();

  Future<AtricleModel> fetchlatestNews() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.latestNewsEndPoint, {});
      return response = AtricleModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AtricleModel> searchNewsbyKeyword(String keyword) async {
    try {
      log("here2");
      dynamic response = await _apiServices.getGetApiResponse(
          // "${AppUrl.baseUrl}search?keywords=$keyword&language=en",
          "${AppUrl.newsBaseUrl}search?keywords=$keyword&language=en' -H 'Authorization: nRU66CbShKn7xkbfmG-TEtFhNkhE7k7n-MoZZi3fkeEtrNvg' -H 'cache-control: no-cacheon",
          {
            'Authorization': 'nRU66CbShKn7xkbfmG-TEtFhNkhE7k7n-MoZZi3fkeEtrNvg',
            'cache-control': 'no-cache',
          });
      return response = AtricleModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<AtricleModel> searchNewsbyCategory(String categoy) async {
    try {
      log("here2");
      String url =
          "${AppUrl.categoryNewsEndPoint}$categoy&apiKey=nRU66CbShKn7xkbfmG-TEtFhNkhE7k7n-MoZZi3fkeEtrNvg";
      log('url is:$url');
      dynamic response = await _apiServices.getGetApiResponse(
          // "${AppUrl.baseUrl}search?keywords=$keyword&language=en",
          url,
          {
            'Authorization': 'nRU66CbShKn7xkbfmG-TEtFhNkhE7k7n-MoZZi3fkeEtrNvg',
            'cache-control': 'no-cache',
          });
      return response = AtricleModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
