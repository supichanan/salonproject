import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salonproject/models/user_model.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    FirebaseAuth.instance.authStateChanges().listen(
      (event) async {
        if (event == null) {
          runApp(const MyApp());
        } else {
          await FirebaseFirestore.instance
              .collection('user')
              .doc(event.uid)
              .get()
              .then((value) {
            UserModel userModel = UserModel.fromMap(value.data()!);
            switch (userModel.typeUser) {
              case 'Customer':
                keyPage = Myconstant.keyCustomer;
                runApp(const MyApp());
                break;
              case 'Hairdresser':
                keyPage = Myconstant.keyHairdresser;
                runApp(const MyApp());
                break;
              default:
            }
          });
        }
      },
    );
  });
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
