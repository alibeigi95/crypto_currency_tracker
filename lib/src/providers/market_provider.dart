import 'dart:async';

import 'package:crypto_currency_tracker/src/models/api.dart';
import 'package:crypto_currency_tracker/src/models/crypto_currency.dart';
import 'package:flutter/cupertino.dart';

class MarketProvider with ChangeNotifier {
  bool isLoading = true;
  List<CryptoCurrencyViewModel> markets = [];

  MarketProvider() {
    fetchData();
  }

  void fetchData() async {
    List<dynamic> _markets = await API.getMarkets();

    List<CryptoCurrencyViewModel> temp = [];
    for (var market in _markets) {
      CryptoCurrencyViewModel newCrypto =
          CryptoCurrencyViewModel.fromMap(market);
      temp.add(newCrypto);
    }
    markets = temp;
    isLoading = false;
    notifyListeners();

    Timer(
      const Duration(seconds: 60),
      () {
        fetchData();
        print('Fetching data');
      },
    );
  }

  CryptoCurrencyViewModel fetchDataById(final String id) {
    CryptoCurrencyViewModel crypto =
        markets.where((e) => e.id == id).toList()[0];
    return crypto;
  }
}
