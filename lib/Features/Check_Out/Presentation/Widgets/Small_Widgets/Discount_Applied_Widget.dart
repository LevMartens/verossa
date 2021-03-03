import 'package:flutter/cupertino.dart';

class DiscountApplied extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
              children: [
                Text('Discount'),
                Spacer(),
                Text('-10%', style: TextStyle(fontWeight: FontWeight.w600),),
                SizedBox(width: 15,)
              ],
            );
  }
}
