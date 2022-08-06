import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kpay/constants.dart';
import 'package:kpay/pages/flash_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const FlashScreen(),
    },
    theme: ThemeData(
        appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Constants.primary,
                statusBarIconBrightness: Brightness.light))),
  ));
}
