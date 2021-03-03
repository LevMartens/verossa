import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:verossa/Features/Prices/Presentation/Prices_Provider.dart';

class SummaryTotal extends StatefulWidget {
  @override
  _SummaryTotalState createState() => _SummaryTotalState();
}

class _SummaryTotalState extends State<SummaryTotal> {

  @override
  Widget build(BuildContext context) {
    String totalPriceForSummary = Provider.of<PricesProvider>(context, listen: true).totalPriceForCheckOutSummary;

    return Container(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, top:7),
                  child: Container(
                    child: Text('Total', style: TextStyle(fontSize: 17), ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Including \$4.54 AUD in GST', style: TextStyle(fontWeight: FontWeight.w300)),
              )
            ],
          ),
          Spacer(),
          Text(totalPriceForSummary, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),),
          SizedBox(width: 15,)

        ],
      ),
    );
  }
}
