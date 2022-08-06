import 'package:flutter/material.dart';
import 'package:kpay/constants.dart';
import 'package:kpay/pages/forget_pin.dart';
import 'package:kpay/pages/link_to_bank_acc.dart';

class BankAccount extends StatefulWidget {
  const BankAccount({Key? key}) : super(key: key);

  @override
  State<BankAccount> createState() => _BankAccountState();
}

class _BankAccountState extends State<BankAccount> {
  bool page = true;
  bool checkPin1 = false;
  bool checkPin2 = false;
  bool checkPin3 = false;
  bool checkPin4 = false;
  bool checkPin5 = false;
  bool checkPin6 = false;
  List<String> pinNo = [];
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
        page ? _buildAddBankAcc(context) : _buildEnterPIN(context)
      ])),
    );
  }

  Widget _buildEnterPIN(context) {
    return Container(
      padding: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    setState(() {
                      page = true;
                      pinNo = [];
                      _allCheck();
                    });
                  },
                  child: Icon(Icons.close))
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter your PIN",
                  style: TextStyle(color: Constants.primary, fontSize: 18),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _pin(checkPin1),
                    _pin(checkPin2),
                    _pin(checkPin3),
                    _pin(checkPin4),
                    _pin(checkPin5),
                    _pin(checkPin6),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                        itemCount: keyboard.length,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.5,
                        ),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (index == 11) {
                                  if (pinNo.length != 0) {
                                    if (pinNo.length == 6) {
                                      pinNo.remove(pinNo[pinNo.length - 1]);
                                      checkPin6 = false;
                                    } else if (pinNo.length == 5) {
                                      pinNo.remove(pinNo[pinNo.length - 1]);
                                      checkPin5 = false;
                                    } else if (pinNo.length == 4) {
                                      pinNo.remove(pinNo[pinNo.length - 1]);
                                      checkPin4 = false;
                                    } else if (pinNo.length == 3) {
                                      pinNo.remove(pinNo[pinNo.length - 1]);
                                      checkPin3 = false;
                                    } else if (pinNo.length == 2) {
                                      pinNo.remove(pinNo[pinNo.length - 1]);
                                      checkPin2 = false;
                                    } else if (pinNo.length == 1) {
                                      pinNo.remove(pinNo[pinNo.length - 1]);
                                      checkPin1 = false;
                                    }

                                    print(pinNo);
                                  }
                                } else {
                                  if (pinNo.length == 0) {
                                    pinNo.add(keyboard[index]);
                                    checkPin1 = true;
                                  } else if (pinNo.length == 1) {
                                    pinNo.add(keyboard[index]);
                                    checkPin2 = true;
                                  } else if (pinNo.length == 2) {
                                    pinNo.add(keyboard[index]);
                                    checkPin3 = true;
                                  } else if (pinNo.length == 3) {
                                    pinNo.add(keyboard[index]);
                                    checkPin4 = true;
                                  } else if (pinNo.length == 4) {
                                    pinNo.add(keyboard[index]);
                                    checkPin5 = true;
                                  } else if (pinNo.length == 5) {
                                    pinNo.add(keyboard[index]);
                                    checkPin6 = true;
                                    _buildAddBankAcc(context);
                                    page = true;
                                    pinNo = [];
                                    _allCheck();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                LinkToBankAcc()));
                                  }
                                  print(pinNo);
                                }
                              });
                            },
                            child: Container(
                              color: Colors.grey.shade200,
                              child: Center(
                                  child: Text(
                                keyboard[index],
                                style: TextStyle(
                                    color: Colors.grey.shade900, fontSize: 25),
                              )),
                            ),
                          );
                        }),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgetPIN()));
                  },
                  child: Text(
                    "Forget PIN >",
                    style: TextStyle(color: Constants.primary, fontSize: 14),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _pin(checkPin) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 12,
        height: 12,
        decoration: BoxDecoration(
            color: checkPin ? Constants.accent : Colors.grey.shade200,
            shape: BoxShape.circle,
            border: checkPin
                ? Border.all(color: Colors.grey.shade200)
                : Border.all(color: Colors.grey.shade800)),
      ),
    );
  }

  Widget _buildAddBankAcc(context) {
    return Column(
      children: [
        _buildAppBar(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: InkWell(
            onTap: () {
              setState(() {
                page = false;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 110,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: Colors.grey.shade100,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 1.2,
                        blurRadius: 0.6)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.add_circle_outline,
                      size: 45,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Text(
                    "Add Bank Account",
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildAppBar(context) {
    return Container(
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
          "KBZ Bank Account",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ]),
    );
  }

  _allCheck() {
    checkPin1 = false;
    checkPin2 = false;
    checkPin3 = false;
    checkPin4 = false;
    checkPin5 = false;
    checkPin6 = false;
  }
}
