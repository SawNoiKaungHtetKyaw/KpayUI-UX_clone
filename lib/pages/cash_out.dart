import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kpay/constants.dart';

class CashOut extends StatelessWidget {
  const CashOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Constants.primary,
            statusBarIconBrightness: Brightness.light
          ),
          title:const Text("Cash Out"),
          backgroundColor: Constants.primary,
          shadowColor: Constants.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              _buildCard(
                "assets/images/bank.png",
                "Agent",
              ),
              _buildCard("assets/images/atm.jpg", "ATM"),
              _buildCard("assets/images/kbz_bank.jpg", "KBZ Bank Account"),
            ],
          ),
        ));
  }

  Widget _buildCard(image, text) {
    return Padding(
      padding:const EdgeInsets.only(bottom: 3),
      child: Card(
        child: Container(
          padding:const EdgeInsets.all(8),
          height: 60,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                Image.asset(
                  image,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(text),
              ],
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey.shade400,
            )
          ]),
        ),
      ),
    );
  }
}
