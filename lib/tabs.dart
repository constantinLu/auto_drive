import 'package:auto_drive/util/palette.dart';
import 'package:auto_drive/views/trip_splitter_view.dart';
import 'package:auto_drive/widget/scraper.dart';
import 'package:flutter/material.dart';

import 'util/assets.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

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
            labelColor: Palette.black_,
            tabs: [
              Tab(
                icon: ImageIcon(AssetImage(iconGarage), color: Palette.black_),
                text: "My Garage",
              ),
              Tab(icon: Icon(Icons.call_split, color: Palette.black_), text: "Split Trip"),
              Tab(icon: Icon(Icons.alarm, color: Palette.black_), text: "Reminders"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            //Scraper
            Scraper(),
            TripSplitter(),
            Center(
              child: Text("This will be the reminders, for insurance, etc"),
            ),
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
            child: CircleAvatar(backgroundColor: Palette.black_, child: Text("LC"))));
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
