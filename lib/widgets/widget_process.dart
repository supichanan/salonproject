// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class WidgetProcess extends StatelessWidget {
  final Color? color;
  const WidgetProcess({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: CircularProgressIndicator(color: color,));
  }
}
