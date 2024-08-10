import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:montra_app/constants/colors.dart';
import 'package:montra_app/constants/icons.dart';

class Currency extends StatefulWidget {
  const Currency({super.key});

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  String currency = 'INR';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _currencyBox('Indian Rupee (INR)', 'INR'),
              _currencyBox('United States (USD)', 'USD'),
              _currencyBox('Indonesia (IDR)', 'IDR'),
              _currencyBox('Japan (JPY)', 'JPY'),
              _currencyBox('Russia (RUB)', 'RUB'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _currencyBox(String title, String code) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currency = code;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            code == currency
                ? SvgPicture.asset(
                    AppIcons.successLogo,
                    width: 30,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
