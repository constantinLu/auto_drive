import 'package:auto_drive/application/bloc/scraper/scraper_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mystique/mystique.dart';

import '../../domain/model/fuel.dart';
import '../../domain/model/station.dart';

class FuelListWidget extends StatefulWidget {
  const FuelListWidget();

  @override
  State<FuelListWidget> createState() => _FuelListWidgetState();
}

class _FuelListWidgetState extends State<FuelListWidget> {
  @override
  void initState() {
    super.initState();
    context.read<ScraperBloc>().add(const ScraperEvent.fetchFuels());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScraperBloc, ScraperState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return state.map(
          initial: (_) => const Center(child: Text("Fetching data...")),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          failed: (_) => const Center(child: Text("Something went wrong")),
          successful: (fuelListState) => ExpansionTile(
            title: const Text("Fuel List"),
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
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
                          trailing: Text(currentFuel.money),
                          onTap: () {
                            Clipboard.setData(ClipboardData(text: money(currentFuel.money)!));
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Center(
                                child: Text(
                                  'Price copied!',
                                  style: TextStyle(color: kcRevolutWhite),
                                ),
                              ),
                              backgroundColor: kcDarkGreyColor,
                            ));
                          },
                        ),
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}

String? money(String input) {
  final regex =
      RegExp(r'(\d+\.\d+)'); // Regular expression to match any number with a decimal point
  final match = regex.firstMatch(input); // Finds the first match in the string

  if (match != null) {
    return match.group(1); // Returns the matched number
  } else {
    return ''; // Returns an empty string if no match is found
  }
}
