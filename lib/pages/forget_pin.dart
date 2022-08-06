import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kpay/constants.dart';

class ForgetPIN extends StatelessWidget {
  const ForgetPIN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Constants.primary,
        title: Text("Face verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Verify your face and reset PIN.",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            _buildStep("assets/images/step1.jpg", "1",
                "Positon your face within this frame"),
            SizedBox(
              height: 15,
            ),
            _buildStep("assets/images/step2.jpg", "2", "Blink your eyes"),
            SizedBox(
              height: 15,
            ),
            _buildStep("assets/images/step3.jpg", "3", "Shake your head"),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 1,
                  color: Colors.grey.shade400,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 15,
                          height: 15,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 216, 112, 105),
                              shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              "!",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "Please keep your face within the frame, otherwise the process will stop.",
                        style: TextStyle(
                            color: Colors.grey.shade400, fontSize: 13),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Constants.primary),
                        onPressed: () {},
                        child: const Text(
                          "Start",
                          style: TextStyle(fontSize: 16),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildStep(image, step, text) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 0.8, color: Colors.grey.shade300)),
          child: Container(
              width: 70,
              height: 70,
              color: Colors.grey.shade200,
              child: Image.asset(image)),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Step $step",
              style: TextStyle(
                  color: Colors.grey.shade800, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 8,
            ),
            Text(text,
                style: TextStyle(color: Colors.grey.shade500, fontSize: 12))
          ],
        )
      ],
    );
  }
}
