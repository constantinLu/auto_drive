import 'package:auto_drive/infra/util/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(child: Padding(padding: EdgeInsets.only(left: 3), child: Image(image: AssetImage(graph)))));
  }
}
