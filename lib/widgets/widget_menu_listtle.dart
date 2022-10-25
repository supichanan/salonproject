// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:salonproject/utility/my_constant.dart';
import 'package:salonproject/widgets/widget_text.dart';

class WidgetMenuListtle extends StatelessWidget {
  final Widget leadWidget;
  final String title;
  final Function()? tapFunc;

  const WidgetMenuListtle({
    Key? key,
    required this.leadWidget,
    required this.title,
    this.tapFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        onTap: tapFunc,
        leading: SizedBox(
          width: 36,
          height: 36,
          child: leadWidget,
        ),
        title: WidgetText(
          text: title,
          textStyle: Myconstant().h2Style(),
        ),
      ),
    );
  }
}
