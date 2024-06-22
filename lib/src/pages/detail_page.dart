import 'package:crypto_currency_tracker/exports.dart';
import 'package:crypto_currency_tracker/src/models/crypto_currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final String id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Consumer<MarketProvider>(
            builder: (
              BuildContext context,
              marketProvider,
              child,
            ) {
              CryptoCurrencyViewModel currentCrypto =
                  marketProvider.fetchDataById(widget.id);

              return ListView(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(currentCrypto.image!),
                    ),
                    title: Text(
                        "${currentCrypto.name!}(${currentCrypto.symbol!.toUpperCase()})",
                        style: const TextStyle(fontSize: 20)),
                    subtitle: Text(
                      currentCrypto.currentPrice!.toStringAsFixed(4),
                      style: const TextStyle(
                          fontSize: 30,
                          color: Colors.cyan,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                    children: [
                      _titleAndDetail(
                          title: 'Market Cap',
                          detail: currentCrypto.marketCap!.toStringAsFixed(2),
                          crossAxisAlignment: CrossAxisAlignment.start),
                      _titleAndDetail(
                          title: 'Market Cap Rank',
                          detail: currentCrypto.marketCapRank.toString(),
                          crossAxisAlignment: CrossAxisAlignment.end)
                    ],
                  )
                ],
              );
            },
          ),
        ),
      );

  Widget _titleAndDetail(
          {required String title,
          required String detail,
          required CrossAxisAlignment crossAxisAlignment}) =>
      Column(
        crossAxisAlignment: crossAxisAlignment,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            detail,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      );
}
