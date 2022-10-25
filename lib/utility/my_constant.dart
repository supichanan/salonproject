import 'package:flutter/material.dart';

class Myconstant {
  static String urlAvatar =
      'https://firebasestorage.googleapis.com/v0/b/salonproject-8e542.appspot.com/o/3430601_avatar_female_normal_woman_icon.png?alt=media&token=e1796a1c-a2e4-488b-a610-7b8c674730a6';

  static var types = <String>[
    'Customer',
    'Hairdresser',
  ];
  static String keyAuthen = '/authen';
  static String keyCustomer = '/customer';
  static String keyHairdresser = '/hairdresser';

  static Color dark = Colors.black;
  static Color bg = Colors.white;
  static Color active = const Color.fromARGB(255, 204, 97, 163);

  TextStyle h1Style() => TextStyle(
        fontSize: 36,
        color: dark,
        fontWeight: FontWeight.bold,
      );

  TextStyle h2Style() => TextStyle(
        fontSize: 20,
        color: dark,
        fontWeight: FontWeight.w700,
      );

  TextStyle h3Style() => TextStyle(
        fontSize: 14,
        color: dark,
        fontWeight: FontWeight.normal,
      );

  TextStyle h3ActiveStyle() => TextStyle(
        fontSize: 16,
        color: active,
        fontWeight: FontWeight.bold,
      );

  TextStyle h3ButtonStyle() => TextStyle(
        fontSize: 16,
        color: bg,
        fontWeight: FontWeight.bold,
      );
}
