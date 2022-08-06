import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpay/constants.dart';
import 'package:kpay/pages/home.dart';

class PaymentSuccessful extends StatelessWidget {
  final String? amount;
  const PaymentSuccessful({Key? key, this.amount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            Icon(
              Icons.check_circle_rounded,
              size: 50,
              color: Constants.primary,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Payment Successful",
              style: TextStyle(color: Constants.primary),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Transfer To Kaung Htet Kyaw",
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$amount.00",
                    style: TextStyle(color: Colors.black, fontSize: 28)),
                Text("\t(Ks)",
                    style: TextStyle(color: Colors.black, fontSize: 12)),
              ],
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Constants.primary,
                      padding: EdgeInsets.symmetric(horizontal: 90)),
                  onPressed: (() {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  }),
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 70,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
