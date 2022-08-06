import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kpay/pages/home.dart';

class FlashScreen extends StatefulWidget {
  const FlashScreen({Key? key}) : super(key: key);

  @override
  State<FlashScreen> createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  Timer? timer;
  int skip = 5;
  load() async {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: ((context) => const Home())),
          ModalRoute.withName('/'));
    });
  }

  timing() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localskip = skip - 1;
      if (localskip == 0) {
        timer.cancel();
      }
      setState(() {
        skip = localskip;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load();
    timing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 65,
                      height: 28,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 170, 170, 170),
                          borderRadius: BorderRadius.circular(40)),
                      child: Center(
                        child: Text(
                          "Skip $skip",
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 140,
            ),
            Image.asset(
              "assets/images/kpayLogo.png",
              scale: 3,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Welcome to KBZPay",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 11, 66, 110)),
            )
          ]),
        ),
      ),
    );
  }
}
