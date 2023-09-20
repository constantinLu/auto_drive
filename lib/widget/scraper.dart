import 'package:auto_drive/model/fuel.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import '../model/station.dart';

class Scraper extends StatefulWidget {
  const Scraper({Key? key}) : super(key: key);

  @override
  State<Scraper> createState() => _ScraperState();
}

class _ScraperState extends State<Scraper> {
  // Strings to store the extracted Article titles
  List<Fuel> stationViewDataList = [];

  Future<List<Fuel>> extractData() async {
    final List<Fuel> responseList = [];
    const url = 'https://www.plinul.ro/pret/benzina-standard/iasi-iasi/rompetrol';

    // Getting the response from the targeted url
    await Future.delayed(const Duration(seconds: 2), () async {
      final response = await http.Client().get(Uri.parse(url));
      // Status Code 200 means response has been received successfully
      if (response.statusCode == 200) {
        // Getting the html document from the response
        var document = parser.parse(response.body);
        try {
          final rawStations = document.getElementsByClassName('cursor-pointer');
          rawStations.forEach((rawData) {
            final stationDto = Station(
                rawData.children[0].children[0].attributes["title"]!, // station name
                rawData.children[0].children[0].attributes["src"]!, //station logo
                rawData.children[1].text //station address
                );
            final rawFuelResponse = Fuel(
              stationDto,
              rawData.children[2].text, //fuel type
              rawData.children[3].text, //fuel amount in LEI
              rawData.children[4].text, //fuel updated date of the data
              DateTime.now().toString(), //created date local.
            );
            responseList.add(rawFuelResponse);
          });
          setState(() {
            stationViewDataList.addAll(responseList);
          });
          return responseList;
        } catch (e) {
          return responseList;
        }
      } else {
        return responseList;
      }
    });
    return responseList;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: stationViewDataList.length,
          itemBuilder: (BuildContext context, int index) {
            Fuel currentFuel = stationViewDataList[index];
            Station currentStation = currentFuel.station;

            return ListTile(
              leading: CircleAvatar(
                // Displaying the station logo inside the CircleAvatar.
                // Make sure the logo URL provided by the scraper is accessible.
                // Otherwise, you might need to handle potential errors with displaying the image.
                backgroundImage: NetworkImage(currentStation.logo),
              ),
              title: Text(currentStation.companyName),
              subtitle:
                  Text('Fuel Type: ${currentFuel.type}\nAddress: ${currentStation.address}'),
              trailing: Text('${currentFuel.money} LEI'),
            );
          }),

      /// floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: extractData,
        child: Text("Scrap"),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.endFloat, // Positioning it to the bottom right
    );
  }
}
