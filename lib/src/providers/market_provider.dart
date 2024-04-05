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

    /*Timer(
      const Duration(seconds: 3),
      () {
        fetchData();
      },
    );*/
  }
}
