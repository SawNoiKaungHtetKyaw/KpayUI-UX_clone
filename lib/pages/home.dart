import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:kpay/constants.dart';
import 'package:kpay/pages/cash_in.dart';
import 'package:kpay/pages/cash_out.dart';
import 'package:kpay/pages/exchange_rate.dart';
import 'package:kpay/pages/scan_pay.dart';
import 'package:kpay/pages/transfer.dart';

import '../api/user.dart';
import 'bank_account.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List images = [
    "assets/images/img1.png",
    "assets/images/img2.jpg",
    "assets/images/img3.jpg",
  ];
  String balance = Constants.balance;
  bool wallet = true;
  bool my = false;
  bool life = false;
  bool currentState = true;
  bool checkVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.grey.shade200,
          bottomNavigationBar: _buildBottomNav(),
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Constants.primary,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      _buildAppBar(),
                      _buildBalanceCard(),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildScanAndReceive(),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildList(),
                      _buildPromotion(),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  Widget _buildPromotion() {
    return Column(
      children: [
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Promotion",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 13),
            ),
            Text(
              "View All",
              style: TextStyle(color: Constants.primary, fontSize: 13),
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 130,
          child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(images[index]);
            },
            itemCount: images.length,
            autoplay: true,
          ),
        ),
      ],
    );
  }

  Widget _buildList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 0.5,
                spreadRadius: 1,
                offset: const Offset(1, 1))
          ]),
      child: Column(children: [
        _eachList(Icons.shopping_bag_outlined, "KBZPay Loan Center", 1),
        InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Transfer()));
            },
            child: _eachList(Icons.attach_money_sharp, "Transfer", 1)),
        _eachList(Icons.location_on, "Nearby", 1),
        InkWell(
            onTap: () {
              print("Bank Account");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BankAccount()));
            },
            child: _eachList(Icons.credit_card_outlined, "Bank Account", 1)),
        InkWell(onTap: () {}, child: _eachList(Icons.history, "History", 323)),
        
      ]),
    );
  }

  Widget _eachList(icon, text, int bottomLine) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(
              bottom: bottomLine == 323
                  ? BorderSide.none
                  : BorderSide(width: 1, color: Colors.grey.shade300))),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Icon(
              icon,
              color: Constants.iconColor,
              size: 30,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        const Icon(
          Icons.keyboard_arrow_right,
          color: Colors.grey,
        )
      ]),
    );
  }

  Widget _buildScanAndReceive() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                primary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ScanAndPay()));
              },
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Image.asset(
                    "assets/images/scan-qrcode.png",
                    scale: 8,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Scan and Pay",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  )
                ],
              )),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 10),
                primary: Colors.white,
              ),
              onPressed: () {},
              child: Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.qr_code_scanner,
                    color: Constants.primary,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Receive",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  )
                ],
              )),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 50,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            "KBZPay",
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Container(
                  width: 30,
                  height: 30,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      color: Constants.secondy, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.search,
                    size: 20,
                    color: Colors.white,
                  )),
              const SizedBox(
                width: 15,
              ),
              Container(
                  width: 30,
                  height: 30,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                      color: Constants.secondy, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.notifications_outlined,
                    size: 20,
                    color: Colors.white,
                  ))
            ],
          )
        ]),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return SizedBox(
      height: 140,
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Balance ",
                          style: TextStyle(color: Constants.primary)),
                      TextSpan(
                          text: "(Ks)",
                          style: TextStyle(
                              color: Constants.primary, fontSize: 12)),
                    ])),
                    IconButton(
                        iconSize: 18,
                        onPressed: () {
                          if (checkVisible) {
                            setState(() {
                              checkVisible = false;
                            });
                          } else {
                            setState(() {
                              checkVisible = true;
                            });
                          }
                        },
                        icon: checkVisible
                            ? Icon(
                                Icons.visibility_outlined,
                                color: Constants.primary,
                              )
                            : Icon(
                                Icons.visibility_off_outlined,
                                color: Constants.primary,
                              )),
                  ],
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Constants.primary,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: checkVisible ? balance : "******",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600)),
                      TextSpan(
                          text: checkVisible ? ".00" : "",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600))
                    ])),
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/usa.jpg",
                          width: 20,
                          height: 20,
                        ),
                        const Text(
                          " 1 USD = ",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        Image.asset(
                          "assets/images/myanmar.png",
                          width: 20,
                          height: 20,
                        ),
                        const Text(
                          " 1859 MMK",
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ExchageRate())),
                            child: const Icon(Icons.arrow_right))
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CashIn()));
                      },
                      child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Constants.primary)),
                          child: Center(
                            child: Text(
                              "Cash In",
                              style: TextStyle(
                                  color: Constants.primary, fontSize: 12),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CashOut()));
                      },
                      child: Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(color: Constants.primary)),
                          child: Center(
                            child: Text(
                              "Cash Out",
                              style: TextStyle(
                                  color: Constants.primary, fontSize: 12),
                            ),
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.white,
      child: _BottomItem(),
    );
  }

  Widget _BottomItem() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () {
              setState(() {
                wallet = true;
                life = false;
                my = false;
              });
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Icon(
                    Icons.account_balance_wallet,
                    color: (wallet) ? Constants.primary : Colors.grey.shade400,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Wallet",
                    style: TextStyle(
                      fontSize: 13,
                      color:
                          (wallet) ? Constants.primary : Colors.grey.shade400,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                wallet = false;
                life = true;
                my = false;
              });
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Icon(
                    Icons.star,
                    color: (life) ? Constants.primary : Colors.grey.shade400,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Life",
                    style: TextStyle(
                      fontSize: 13,
                      color: (life) ? Constants.primary : Colors.grey.shade400,
                    ),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                wallet = false;
                life = false;
                my = true;
              });
            },
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    color: (my) ? Constants.primary : Colors.grey.shade400,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "My",
                    style: TextStyle(
                      fontSize: 13,
                      color: (my) ? Constants.primary : Colors.grey.shade400,
                    ),
                  )
                ],
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
