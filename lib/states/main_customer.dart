import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salonproject/bodys/all_hairdresser.dart';
import 'package:salonproject/bodys/choose_hairdresser.dart';
import 'package:salonproject/utility/my_constant.dart';
import 'package:salonproject/widgets/widget_drawer.dart';
import 'package:salonproject/widgets/widget_images.dart';
import 'package:salonproject/widgets/widget_menu_listtle.dart';
import 'package:salonproject/widgets/widget_text.dart';

class MainCustomer extends StatefulWidget {
  const MainCustomer({super.key});

  @override
  State<MainCustomer> createState() => _MainCustomerState();
}

class _MainCustomerState extends State<MainCustomer> {
  int indexBody = 0;
  var bodys = <Widget>[
    const AllHairdresser(),
    const ChooseHairdresser(),
  ];
  var titles = <String>['ช่างทั้งหมด', 'ช่างที่เลือกใช้งาน'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: WidgetText(
        text: titles[indexBody],
        textStyle: Myconstant().h2Style(),
      )),
      drawer: WidgetDrawer(
        contentWidget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            WidgetMenuListtle(
              leadWidget: const WidgetImage(
                path: 'images/menu1.png',
              ),
              title: titles[0],
              tapFunc: () {
                indexBody = 0;
                setState(() {});
                Get.back();
              },
            ),
            WidgetMenuListtle(
              leadWidget: const WidgetImage(
                path: 'images/menu2.png',
              ),
              title: titles[1],
              tapFunc: () {
                indexBody = 1;
                setState(() {});
                Get.back();
              },
            ),
          ],
        ),
      ),
      body: bodys[indexBody],
    );
  }
}
