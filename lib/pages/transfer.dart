import 'package:flutter/material.dart';
import 'package:kpay/pages/transfer2.dart';

import '../constants.dart';

class Transfer extends StatefulWidget {
  const Transfer({Key? key}) : super(key: key);

  @override
  State<Transfer> createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  TextEditingController _phoneController = TextEditingController(text: "09");
  bool check = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildAppBar(),
                _buildInputPhoneNo(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: check
                              ? Constants.primary
                              : Color.fromARGB(255, 96, 138, 197),
                          padding: EdgeInsets.all(12)),
                      onPressed: () {
                        if (_phoneController.text.length < 9) {
                          check = true;
                          _myAlertDialog(context);
                        } else if (_phoneController.text.isEmpty) {
                          check = false;
                        } else if (_phoneController.text.isNotEmpty) {
                          check = true;
                          Constants.user.forEach((element) {
                            if (element.phone == _phoneController.text) {
                              String name = element.name.toString();
                              String phone = element.phone.toString();
                              String password = element.password.toString();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Transfer2(
                                          name: name,
                                          phone: phone,
                                          password: password)));
                            }
                          });
                        }
                      },
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputPhoneNo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  offset: Offset(0.5, 0.5),
                  blurRadius: 0.8,
                  spreadRadius: 0.3)
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Transfer to Phone Number",
            style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: _phoneController,
            onChanged: ((value) {
              value.isEmpty ? check = false : check = true;
              setState(() {});
            }),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
              enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.grey.shade300, width: 1)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Constants.primary, width: 1)),
              suffixIconConstraints: BoxConstraints(maxHeight: 10),
              suffixIcon: Container(
                transform: Matrix4.translationValues(0.0, -10.0, 0.0),
                child: InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.perm_contact_cal,
                    size: 30,
                    color: Constants.primary,
                  ),
                ),
              ),
            ),
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 50,
          child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              "Transfer",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ]),
        ));
  }

  _myAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Center(
              // Aligns the container to center
              child: Container(
            // A simplified version of dialog.
            width: MediaQuery.of(context).size.width - 50,
            height: 130,
            child: AlertDialog(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                content: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Invalid Phone Number, Please try again",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                    ),
                    OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Got it",
                        style: TextStyle(
                            color: Constants.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    )
                  ],
                )),
          ));
        });
  }
}
