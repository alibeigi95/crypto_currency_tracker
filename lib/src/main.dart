import 'package:crypto_currency_tracker/exports.dart';
import 'package:crypto_currency_tracker/src/models/crypto_currency.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(
            bottom: 0,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Crypto Tracker',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                    onPressed: () => themeProvider.toggleTheme(),
                    icon: (themeProvider.themeMode == ThemeMode.light)
                        ? const Icon(Icons.dark_mode)
                        : const Icon(Icons.light_mode),
                  ),
                ],
              ),
              Expanded(
                child: Consumer<MarketProvider>(
                  builder: (
                    BuildContext context,
                    MarketProvider marketProvider,
                    Widget? child,
                  ) {
                    if (marketProvider.isLoading == true) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (marketProvider.markets.isNotEmpty) {
                        return ListView.builder(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          itemCount: marketProvider.markets.length,
                          itemBuilder: (context, index) {
                            CryptoCurrencyViewModel cryptoCurrencyViewModel =
                                marketProvider.markets[index];
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(
                                    cryptoCurrencyViewModel.image!),
                              ),
                              title: Text(
                                  "${cryptoCurrencyViewModel.name!} #${cryptoCurrencyViewModel.marketCapRank}"),
                              subtitle: Text(cryptoCurrencyViewModel.symbol!
                                  .toUpperCase()),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cryptoCurrencyViewModel.currentPrice!
                                        .toStringAsFixed(4),
                                    style: const TextStyle(
                                      color: Colors.cyan,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Builder(
                                    builder: (context) {
                                      double priceChange =
                                          cryptoCurrencyViewModel
                                              .priceChange24!;
                                      double priceChangePercentage =
                                          cryptoCurrencyViewModel
                                              .priceChangePercentage24!;

                                      if (priceChange < 0) {
                                        return Text(
                                          "${priceChangePercentage.toStringAsFixed(2)} % (${priceChange.toStringAsFixed(4)})",
                                          style: const TextStyle(
                                              color: Colors.red),
                                        );
                                      } else {
                                        return Text(
                                          "${priceChangePercentage.toStringAsFixed(2)} % (+${priceChange.toStringAsFixed(4)})",
                                          style: const TextStyle(
                                              color: Colors.green),
                                        );
                                      }
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      } else {
                        return const Text('data not found');
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
