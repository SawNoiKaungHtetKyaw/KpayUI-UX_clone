import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputPassword extends StatefulWidget {
  const InputPassword({Key? key}) : super(key: key);

  @override
  State<InputPassword> createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent.withOpacity(0.7),
      body: SafeArea(child: _buildCheckPassword()),
    );
  }

  Widget _buildCheckPassword() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width - 20,
          child: Column(children: [
            Row(
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Text(
                    "x",
                    style: TextStyle(fontSize: 30, color: Colors.grey.shade400),
                  ),
                ),
                Text("Enter PIN")
              ],
            )
          ]),
        )
      ]),
    );
  }
}
