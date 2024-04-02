class CryptoCurrencyViewModel {
  String? id;
  String? symbol;
  String? name;
  String? image;
  int? marketCapRank;
  double? currentPrice;
  double? markerCap;
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
    required this.markerCap,
    required this.high24,
    required this.low24,
    required this.priceChange24,
    required this.priceChangePercentage24,
    required this.circulationSupply,
    required this.ath,
    required this.atl,
  });

  factory CryptoCurrencyViewModel.fromMap(dynamic map) =>
      CryptoCurrencyViewModel(
        id: map['id'],
        symbol: map['symbol'],
        name: map['name'],
        image: map['image'],
        marketCapRank: map['marketCapRank'],
        currentPrice: map['currentPrice'],
        markerCap: map['markerCap'],
        high24: map['high24'],
        low24: map['low24'],
        priceChange24: map['priceChange24'],
        priceChangePercentage24: map['priceChangePercentage24'],
        circulationSupply: map['circulationSupply'],
        ath: map['ath'],
        atl: map['atl'],
      );
}
