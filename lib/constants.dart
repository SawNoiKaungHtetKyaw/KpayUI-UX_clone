import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kpay/api/user.dart';

class Constants {
  static Color primary = const Color.fromARGB(255, 1, 68, 161);
  static Color iconColor = const Color.fromARGB(255, 33, 126, 255);
  static Color secondy = const Color.fromARGB(255, 1, 68, 161);
  static Color accent = const Color.fromARGB(255, 54, 181, 58);
  static String balance = "598";


  static List<User> user = [
    User(name: "Kaung Htet Kyaw", phone: "09962030473", password: "051101"),
    User(name: "Nann Kham Su Wai", phone: "09251521655", password: "051200"),
    User(name: "KYAW ZAYA", phone: "09790439800", password: "111111"),
    User(name: "MRS SOI KYI LIN", phone: "09400040500", password: "222222"),
  ];

  
}
