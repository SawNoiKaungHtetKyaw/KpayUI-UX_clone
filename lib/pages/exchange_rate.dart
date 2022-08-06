import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpay/constants.dart';

class ExchageRate extends StatefulWidget {
  const ExchageRate({Key? key}) : super(key: key);

  @override
  State<ExchageRate> createState() => _ExchageRateState();
}

class _ExchageRateState extends State<ExchageRate> {
  @override
  Widget build(BuildContext context) {
    String dateTimeFormart = DateTime.now().toString();
    String dateTime = dateTimeFormart.split(".")[0];

    String usd = "1";
    String mmk = "1589";

    TextEditingController _usdController = TextEditingController(text: usd);
    TextEditingController _mmkController = TextEditingController(text: mmk);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Constants.primary,
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Constants.primary,
        title: const Text("Exchange rate"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Indicative Rate",
                  style: TextStyle(
                      color: Color.fromARGB(255, 182, 182, 182),
                      fontSize: 12.5),
                ),
                Text(
                  "Update at $dateTime",
                  style: const TextStyle(
                      color: Color.fromARGB(255, 182, 182, 182),
                      fontSize: 12.5),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(children: [
              Row(
                children: [
                  Image.asset("assets/images/usa.jpg", width: 30, height: 18),
                  SizedBox(
                    width: 8,
                  ),
                  Text("USD")
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 3),
                child: TextFormField(
                  onChanged: (content) {
                    content.isEmpty ? content = "0" : content;
                    double result = double.parse(content) * double.parse(mmk);
                    String i = result.toStringAsFixed(3);
                    print(i);
                    _mmkController
                      ..text = (i).toString()
                      ..selection = TextSelection.collapsed(offset: 0);
                  },
                  controller: _usdController,
                  cursorColor: const Color.fromARGB(255, 54, 181, 58),
                  cursorHeight: 24,
                  style: TextStyle(fontSize: 18.5),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 2),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 54, 181, 58)))),
                  textAlign: TextAlign.end,
                  autofocus: true,
                ),
              ),
              Row(
                children: [
                  Image.asset("assets/images/myanmar.png",
                      width: 30, height: 18),
                  SizedBox(
                    width: 8,
                  ),
                  Text("MMK")
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 3),
                child: TextFormField(
                  controller: _mmkController,
                  cursorColor: const Color.fromARGB(255, 54, 181, 58),
                  onChanged: (content) {
                    content.isEmpty ? content = "0" : content;
                    double result = (double.parse(content) / double.parse(mmk));
                    String i = result.toStringAsFixed(3);
                    _usdController
                      ..text = (i).toString()
                      ..selection = TextSelection.collapsed(offset: 0);
                  },
                  cursorHeight: 24,
                  style: TextStyle(fontSize: 18.5),
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 2),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300)),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 2,
                              color: Color.fromARGB(255, 54, 181, 58)))),
                  textAlign: TextAlign.end,
                  autofocus: true,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
