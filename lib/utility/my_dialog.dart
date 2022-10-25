// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salonproject/utility/my_constant.dart';
import 'package:salonproject/widgets/widget_process.dart';
import 'package:salonproject/widgets/widget_text.dart';
import 'package:salonproject/widgets/widget_text_buttom.dart';

class MyDialog {
  final BuildContext context;
  MyDialog({
    required this.context,
  });

  void processDialog() {
    Get.dialog(WillPopScope(
      child: const WidgetProcess(),
      onWillPop: () async {
        return false;
      },
    ));
  }

  void normalDialog({required String title, required String subTitle}) {
    Get.dialog(
      AlertDialog(
        icon: Icon(
          Icons.alarm,
          size: 48,
          color: Myconstant.active,
        ),
        title: WidgetText(
          text: title,
          textStyle: Myconstant().h2Style(),
        ),
        content: WidgetText(text: subTitle),
        actions: [
          WidgetTextButton(
            label: 'Cancel',
            pressFunc: () {
              Get.back();
            },
          )
        ],
      ),
      barrierDismissible: false,
    );
  }
}
