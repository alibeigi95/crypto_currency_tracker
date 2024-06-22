class CryptoCurrencyViewModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  int? marketCapRank;
  double? currentPrice;
  double? marketCap;
  double? high24;
  double? low24;
  double? priceChange24;
  double? priceChangePercentage24;
  double? circulationSupply;
  double? ath;
  double? atl;

  CryptoCurrencyViewModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.marketCapRank,
    required this.currentPrice,
    required this.marketCap,
    required this.high24,
    required this.low24,
    required this.priceChange24,
    required this.priceChangePercentage24,
    required this.circulationSupply,
    required this.ath,
    required this.atl,
  });

  factory CryptoCurrencyViewModel.fromJson(Map<String, dynamic> json) {
    return CryptoCurrencyViewModel(
      id: json['id'] as String?,
      symbol: json['symbol'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      marketCapRank: json['market_cap_rank'] as int?,
      currentPrice: (json['current_price'] as num?)?.toDouble(),
      marketCap: (json['market_cap'] as num?)?.toDouble(),
      high24: (json['high_24h'] as num?)?.toDouble(),
      low24: (json['low_24h'] as num?)?.toDouble(),
      priceChange24: (json['price_change_24h'] as num?)?.toDouble(),
      priceChangePercentage24: (json['price_change_percentage_24h'] as num?)?.toDouble(),
      circulationSupply: (json['circulating_supply'] as num?)?.toDouble(),
      ath: (json['ath'] as num?)?.toDouble(),
      atl: (json['atl'] as num?)?.toDouble(),
    );
  }
}
