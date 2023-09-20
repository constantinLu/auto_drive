import 'package:flutter/material.dart';

Size displaySize(BuildContext context) {
  debugPrint('Size = ${MediaQuery.of(context).size}');
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  debugPrint('Height = ${height}');
  return height;
}

double displayWidth(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  debugPrint('Width = $width');
  return width;
}



