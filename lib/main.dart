import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salonproject/states/authen.dart';
import 'package:salonproject/states/main_customer.dart';
import 'package:salonproject/states/main_hairdserse.dart';
import 'package:salonproject/utility/my_constant.dart';

var getPages = <GetPage<dynamic>>[
  GetPage(
    name: Myconstant.keyAuthen,
    page: () => const Authen(),
  ),
  GetPage(
    name: Myconstant.keyCustomer,
    page: () => const MainCustomer(),
  ),
  GetPage(
    name: Myconstant.keyHairdresser,
    page: () => const MainHairdresser(),
  ),
];

String keyPage = Myconstant.keyAuthen;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: keyPage,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          backgroundColor: Myconstant.bg,
          foregroundColor: Myconstant.dark,
          elevation: 0,
        ),
      ),
    );
  }
}
