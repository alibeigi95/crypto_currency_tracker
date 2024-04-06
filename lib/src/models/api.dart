import 'dart:convert';

import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> getMarkets() async {
    Uri requestPath = Uri.parse(
        "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en");
    final result = await http.get(requestPath);
    final decodedResult = jsonDecode(result.body);
    List<dynamic> markets = decodedResult as List<dynamic> ;
    return markets;
  }
}
