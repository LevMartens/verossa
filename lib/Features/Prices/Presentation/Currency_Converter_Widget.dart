import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'Prices_Provider.dart';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15.0,
      ),
      child: Column(
        children: [
          Padding(
            padding:
            const EdgeInsets.only(left: 57.0, bottom: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Text(
                  'Pick a currency',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 300,
              child: CupertinoPicker(
                itemExtent: 32,
                onSelectedItemChanged: (selectedIndex) async {

                  Provider.of<PricesProvider>(context, listen: false).setCurrencyTo(context, selectedIndex);

                  //await getCurrencyData(selectedIndex);

                  //setState(() {});
                },
                children: [
                  Text('AUD'),
                  Text('USD'),
                  Text('CAD'),
                  Text('INR'),
                  Text('GBP'),
                  Text('EUR'),
                  Text('JPY'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
