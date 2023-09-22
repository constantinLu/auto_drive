import 'package:auto_drive/presentation/views/fuel_list_view.dart';
import 'package:auto_drive/presentation/views/trip_splitter_view.dart';
import 'package:flutter/material.dart';
import 'package:mystique/mystique.dart';

import '../infra/util/assets.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: const Avatar(),
          title: const AppBarTitle(),
          actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
          bottom: const TabBar(
            labelColor: kcBlackFull,
            tabs: [
              Tab(icon: ImageIcon(AssetImage(iconGarage), color: kcBlackFull), text: "My Garage"),
              Tab(icon: Icon(Icons.call_split, color: kcBlackFull), text: "Split Trip"),
              Tab(icon: Icon(Icons.alarm, color: kcBlackFull), text: "Reminders"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            //Scraper
            FuelListTab(),
            TripSplitterView(),
            Center(child: Text("This will be the reminders, for insurance, etc")),
          ],
        ),
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
            padding: EdgeInsets.all(12),
            child: CircleAvatar(backgroundColor: kcBlackFull, child: Text("LC"))));
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "Hello",
      style: TextStyle(fontWeight: FontWeight.w400),
      textScaleFactor: 0.7,
    ));
  }
}
