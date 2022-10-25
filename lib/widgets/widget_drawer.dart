// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:salonproject/utility/my_constant.dart';
import 'package:salonproject/widgets/widget_images.dart';
import 'package:salonproject/widgets/widget_menu_listtle.dart';

class WidgetDrawer extends StatelessWidget {
  final Widget? contentWidget;
  const WidgetDrawer({
    Key? key,
    this.contentWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(accountName: null, accountEmail: null),
          contentWidget ?? const SizedBox(),
          const Spacer(),
          WidgetMenuListtle(
            leadWidget: const WidgetImage(
              path: 'images/door.png',
            ),
            title: 'Sign Out',
            tapFunc: () async {
              await FirebaseAuth.instance.signOut().then((value) {
                Get.offAllNamed(Myconstant.keyAuthen);
              });
            },
          ),
        ],
      ),
    );
  }
}
