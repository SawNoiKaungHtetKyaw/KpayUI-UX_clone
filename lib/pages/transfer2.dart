import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpay/api/user.dart';
import 'package:kpay/constants.dart';
import 'package:kpay/pages/cash_in.dart';
import 'package:kpay/pages/payment_successful.dart';

class Transfer2 extends StatefulWidget {
  String? name, phone, password;
  Transfer2({Key? key, this.name, this.phone, this.password}) : super(key: key);

  @override
  State<Transfer2> createState() =>
      _Transfer2State(this.name, this.phone, this.password);
}

class _Transfer2State extends State<Transfer2> {
  String? name, phone, passwords;
  _Transfer2State(this.name, this.phone, this.passwords);
  TextEditingController _amountController = TextEditingController();
  bool afCheck = true;
  bool showPasswordPage = false;
  String amount = "";
  List<String> password = ["", "", "", "", "", ""];
  List<String> keyboard = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "",
    "0",
    "\u232B",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Stack(children: [
          _showTransferAmount(),
          showPasswordPage ? _buildCheckPassword() : _showTransferAmount(),
        ]),
      ),
    );
  }

  Widget _showTransferAmount() {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: Constants.primary,
            ),
            child: Row(children: [
              SizedBox(
                width: 18,
              ),
              InkWell(
                onTap: (() => Navigator.pop(context)),
                child: Icon(
                  Icons.keyboard_backspace,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Transfer",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: Offset(0.5, 0.5),
                        blurRadius: 0.8,
                        spreadRadius: 0.5)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(color: Colors.grey.shade300),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Transfer to",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          name.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "*******${phone!.substring(phone!.length - 4)}",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Amount",
                          style: TextStyle(
                              color: Colors.grey.shade500, fontSize: 11),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextField(
                          controller: _amountController,
                          autofocus: afCheck,
                          keyboardType: TextInputType.none,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 38,
                          ),
                          cursorColor: Color.fromARGB(255, 54, 181, 58),
                          decoration: InputDecoration(
                              suffix: Text(
                                "(Ks)",
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 12),
                              ),
                              contentPadding: EdgeInsets.zero,
                              isDense: true,
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Add notes (optional)",
                          style:
                              TextStyle(fontSize: 10, color: Constants.primary),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: _amountController.text.isEmpty
                                    ? Color.fromARGB(255, 96, 138, 197)
                                    : Constants.primary,
                                padding: EdgeInsets.all(10)),
                            onPressed: () {
                              if (_amountController.text.isEmpty) {
                              } else if (int.parse(_amountController.text) >
                                  int.parse(Constants.balance)) {
                                _buildenoughDialog();
                              } else {
                                showPasswordPage = true;
                                setState(() {});
                              }
                            },
                            child: Text(
                              "Transfer",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildKeyboard(),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildenoughDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 174,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.error,
                    color: Color.fromARGB(255, 245, 86, 75),
                    size: 50,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("You don't have enough balance"),
                  SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade300),
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade300),
                                      right: BorderSide(
                                          width: 0.5,
                                          color: Colors.grey.shade300))),
                              child: Center(
                                  child: Text(
                                "No, thanks",
                                style: TextStyle(color: Colors.grey.shade500),
                              )),
                            ),
                          )),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CashIn()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade300),
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade300),
                                      left: BorderSide(
                                          width: 0.5,
                                          color: Colors.grey.shade300))),
                              child: Center(
                                  child: Text(
                                "Cash In",
                                style: TextStyle(color: Constants.primary),
                              )),
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }

  Widget _buildCheckPassword() {
    return Container(
      color: Colors.transparent.withOpacity(0.75),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        SizedBox(
          height: 20,
        ),
        Container(
          width: MediaQuery.of(context).size.width - 45,
          height: 230,
          decoration: BoxDecoration(color: Colors.white),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        showPasswordPage = false;
                      });
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Enter PIN",
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.grey.shade200,
              height: 0.5,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "Transfer to Kaung Htet Kyaw",
                    style: TextStyle(color: Colors.grey.shade800, fontSize: 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_amountController.text + ".00",
                            style:
                                TextStyle(color: Colors.black, fontSize: 25)),
                        Text("\t(Ks)",
                            style:
                                TextStyle(color: Colors.black, fontSize: 12)),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    height: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.wallet,
                          color: Color.fromARGB(255, 54, 181, 58),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Balance (${Constants.balance}.00 Ks)",
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey.shade500),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    height: 0.5,
                  ),
                  Container(
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6),
                        itemBuilder: (context, index) {
                          return Center(
                            child: Text(password[index]),
                          );
                        }),
                  )
                ],
              ),
            )
          ]),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildKeyboard1(),
            ],
          ),
        )
      ]),
    );
  }

  Widget _buildKeyboard() {
    return Container(
      color: Colors.grey.shade300,
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Text(
            "Finish",
            style: TextStyle(
                color: Color.fromARGB(255, 54, 181, 58),
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border: Border.symmetric(
                  horizontal:
                      BorderSide(color: Colors.grey.shade400, width: 0.8))),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: keyboard.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 0.8,
                  mainAxisSpacing: 0.8),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (index == 11) {
                        if (amount.isNotEmpty) {
                          _amountController.text =
                              amount.substring(0, amount.length - 1);
                          amount = _amountController.text;
                          //show Curser last
                          _amountController.selection =
                              TextSelection.fromPosition(TextPosition(
                                  offset: _amountController.text.length));
                        }
                      } else if (index == 9) {
                      } else {
                        amount = "${amount}${keyboard[index]}";
                        _amountController.text = amount;
                        _amountController.selection =
                            TextSelection.fromPosition(TextPosition(
                                offset: _amountController.text.length));
                      }
                    });
                  },
                  child: Container(
                    color: index == 9 || index == 11
                        ? Colors.grey.shade400
                        : Colors.grey.shade300,
                    child: Center(
                        child: Text(
                      keyboard[index],
                      style: TextStyle(
                          color:
                              index == 11 ? Colors.grey.shade600 : Colors.black,
                          fontSize: 20),
                    )),
                  ),
                );
              }),
        )
      ]),
    );
  }

  Widget _buildKeyboard1() {
    return Container(
      color: Colors.grey.shade300,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Text(
            "Safe Input",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade400,
              border: Border.symmetric(
                  horizontal:
                      BorderSide(color: Colors.grey.shade400, width: 0.8))),
          child: GridView.builder(
              shrinkWrap: true,
              itemCount: keyboard.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2.5,
                  crossAxisSpacing: 0.8,
                  mainAxisSpacing: 0.8),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      if (index == 11) {
                        if (password[5] != "") {
                          password[5] = "";
                        } else if (password[4] != "") {
                          password[4] = "";
                        } else if (password[3] != "") {
                          password[3] = "";
                        } else if (password[2] != "") {
                          password[2] = "";
                        } else if (password[1] != "") {
                          password[1] = "";
                        } else if (password[0] != "") {
                          password[0] = "";
                        }
                      } else if (index == 9) {
                      } else {
                        if (password[0] == "") {
                          password[0] = keyboard[index];
                        } else if (password[1] == "") {
                          password[1] = keyboard[index];
                        } else if (password[2] == "") {
                          password[2] = keyboard[index];
                        } else if (password[3] == "") {
                          password[3] = keyboard[index];
                        } else if (password[4] == "") {
                          password[4] = keyboard[index];
                        } else if (password[5] == "") {
                          password[5] = keyboard[index];

                          var ps = StringBuffer();
                          password.forEach((item) {
                            ps.write(item);
                          });

                          if (passwords == "$ps") {
                            Constants.balance =
                                (double.parse(Constants.balance) -
                                        double.parse(_amountController.text))
                                    .toString();

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PaymentSuccessful(
                                          amount: _amountController.text,
                                        )));
                          } else {
                            log("message");
                          }
                        }
                      }
                    });
                  },
                  child: Container(
                    color: index == 9 || index == 11
                        ? Colors.grey.shade400
                        : Colors.grey.shade300,
                    child: Center(
                        child: Text(
                      keyboard[index],
                      style: TextStyle(
                          color:
                              index == 11 ? Colors.grey.shade600 : Colors.black,
                          fontSize: 20),
                    )),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
