import 'package:auto_drive/presentation/views/garage_view.dart';
import 'package:auto_drive/presentation/views/reminder_view.dart';
import 'package:auto_drive/presentation/views/report_view.dart';
import 'package:auto_drive/presentation/views/trip_splitter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystique/mystique.dart';

import '../../application/bloc/scraper/scraper_bloc.dart';
import '../../infra/util/assets.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: const Avatar(),
          title: const AppBarTitle(),
          actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
        ),
        body: const TabBarView(
          children: [
            GarageView(),
            ReportView(),
            TripSplitterView(),
            ReminderView(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 15,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          clipBehavior: Clip.antiAlias,
          child: TabBar(
            indicator: const BoxDecoration(
              shape: BoxShape.circle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)),
            ),
            labelColor: kcRevolutWhite,
            tabs: [
              Tab(icon: ImageIcon(AssetImage(iconGarage), size: 30), text: "My Garage"),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Tab(icon: Icon(Icons.auto_graph, size: 30), text: "Report"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Tab(
                    icon: Icon(
                      Icons.call_split,
                      size: 30,
                    ),
                    text: "Split Trip"),
              ),
              const Tab(icon: Icon(Icons.alarm, size: 30), text: "Reminders"),
            ].map((widget) => widget).toList(),
          ),
        ),

        /// floating action button
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<ScraperBloc>().add(const ScraperEvent.fetchFuels());
          },
          child: const Icon(Icons.add),
        ),
        primary: false,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked, // Positioning it to the bottom right
      ),
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(left: 3), child: Image.asset(logo));
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "Welcome!",
      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
    ));
  }
}
