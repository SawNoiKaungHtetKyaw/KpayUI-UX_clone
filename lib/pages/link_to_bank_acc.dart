import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpay/constants.dart';

class LinkToBankAcc extends StatefulWidget {
  const LinkToBankAcc({Key? key}) : super(key: key);

  @override
  State<LinkToBankAcc> createState() => _LinkToBankAccState();
}

class _LinkToBankAccState extends State<LinkToBankAcc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primary,
        title: Text(
          "Link with your bank account",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Please enter your bank account or card number",
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 22),
                  showCursor: true,
                  cursorColor: Constants.accent,
                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3),
                          borderSide: BorderSide(color: Constants.accent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Constants.accent)),
                      prefix: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Image.asset(
                          "assets/images/kbz_bank_logo.png",
                          scale: 13,
                        ),
                      ),
                      suffixIcon: IconButton(
                        color: Constants.primary,
                        onPressed: () {},
                        icon: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Constants.primary),
                            child: Center(
                                child: Icon(
                              Icons.question_mark,
                              size: 13,
                              color: Colors.white,
                            ))),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Constants.primary),
                          onPressed: () {},
                          child: Text("Submit", style: TextStyle(fontSize: 16))),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
