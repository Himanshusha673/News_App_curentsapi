class AppUrl {
  static var baseUrl = 'https://reqres.in';

  static var newsBaseUrl = 'https://api.currentsapi.services/v1/';

  static var loginEndPint = baseUrl + '/api/login';

  static var registerApiEndPoint = baseUrl + '/api/register';

  static var latestNewsEndPoint = newsBaseUrl +
      'latest-news?language=en&apiKey=nRU66CbShKn7xkbfmG-TEtFhNkhE7k7n-MoZZi3fkeEtrNvg';

  static var categoryNewsEndPoint = newsBaseUrl + 'latest-news?category=';
}
