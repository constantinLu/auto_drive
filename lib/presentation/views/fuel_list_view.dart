import 'package:auto_drive/application/bloc/scraper/scraper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/model/fuel.dart';
import '../../domain/model/station.dart';

class FuelListTab extends StatefulWidget {
  const FuelListTab();

  @override
  State<FuelListTab> createState() => _FuelListTabState();
}

class _FuelListTabState extends State<FuelListTab> {
  @override
  void initState() {
    super.initState();
    context.read<ScraperBloc>().add(const ScraperEvent.fetchFuels());
  }

  @override
  Widget build(BuildContext context) {
    // Strings to store the extracted Article titles
    List<Fuel> stationViewDataList = [];
    return BlocConsumer<ScraperBloc, ScraperState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.map(
          initial: (_) => const Center(child: Text("Fetching data...")),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          failed: (_) => const Center(child: Text("Something went wrong")),
          successful: (fuelListState) => Scaffold(
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: fuelListState.fuels.length,
                itemBuilder: (BuildContext context, int index) {
                  Fuel currentFuel = fuelListState.fuels[index];
                  Station currentStation = currentFuel.station;
                  return Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(currentStation.logo),
                      ),
                      title: Text(currentStation.companyName),
                      subtitle: Text(
                          'Fuel Type: ${currentFuel.type}\nAddress: ${currentStation.address}'),
                      trailing: Text('${currentFuel.money} LEI'),
                      onTap: () {
                        // do something
                      },
                    ),
                  );
                }),

            /// floating action button
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.read<ScraperBloc>().add(ScraperEvent.fetchFuels());
              },
              child: const Icon(Icons.refresh),
            ),
            floatingActionButtonLocation:
              FloatingActionButtonLocation.endFloat, // Positioning it to the bottom right
          ),
        );
      },
    );
  }
}
