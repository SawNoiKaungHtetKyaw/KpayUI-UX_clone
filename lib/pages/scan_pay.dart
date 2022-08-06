import 'package:flutter/material.dart';
import 'package:kpay/constants.dart';

class ScanAndPay extends StatefulWidget {
  const ScanAndPay({Key? key}) : super(key: key);

  @override
  State<ScanAndPay> createState() => _ScanAndPayState();
}

class _ScanAndPayState extends State<ScanAndPay> {
  @override
  int visible = 0;
  bool check = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          elevation: 0,
          leading: InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.arrow_back)),
          backgroundColor: Constants.primary,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 70,
              color: Constants.primary,
            ),
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _choosePayment("Scan", 0),
                    _choosePayment("Manual", 1),
                    _choosePayment("Pay", 2),
                  ],
                ),
                SizedBox(
                  height: 3,
                ),
                _scan()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _choosePayment(text, chooseNum) {
    return InkWell(
      onTap: () {
        setState(() {
          visible = chooseNum;
        });
      },
      child: Container(
          color: Constants.primary,
          height: 30,
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(
                    color: visible == chooseNum
                        ? Colors.white
                        : Colors.grey.shade400,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 2,
              ),
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: visible == chooseNum
                        ? Color.fromARGB(255, 94, 195, 242)
                        : Constants.primary),
              )
            ],
          )),
    );
  }

  Widget _scan() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 522,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 65),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  offset: Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 1)
            ]),
        child: Column(children: [
          SizedBox(
            height: 50,
          ),
          Image.asset("assets/images/qrcode_pay.jpg"),
          SizedBox(
            height: 60,
          ),
          Center(
              child: Text(
            """Click button,put QR code in the frame
                          and pay""",
            style: TextStyle(color: Constants.primary),
          )),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(10), primary: Constants.primary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/scanner.png",
                    width: 20,
                    height: 20,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "Scan",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  activeColor: Constants.primary,
                  side: BorderSide(color: Colors.grey.shade400, width: 2),
                  value: this.check,
                  onChanged: (value) {
                    this.check = value!;
                    setState(() {});
                  }),
              Text(
                "Do not display again",
                style: TextStyle(color: Colors.grey.shade400),
              )
            ],
          )
        ]),
      ),
    );
  }
}
