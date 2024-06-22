import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class API {
  static Future<List<dynamic>> getMarkets() async {
    Uri requestPath = Uri.parse(
        "https://api.coingecko.com/api/v3/coi ns/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&locale=en");

    try {
      final response = await http.get(requestPath).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final decodedResult = jsonDecode(response.body);
        List<dynamic> markets = decodedResult as List<dynamic>;
        return markets;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } on SocketException catch (e) {
      print('SocketException: $e');
      return [];
    } on http.ClientException catch (e) {
      print('ClientException: $e');
      return [];
    } on TimeoutException catch (e) {
      print('TimeoutException: $e');
      return [];
    } catch (e) {
      print('Unexpected error: $e');
      return [];
    }
  }
}

