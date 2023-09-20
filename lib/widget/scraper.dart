import 'package:auto_drive/examples/fuel_old.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;

import '../examples/station_old.dart';

class Scraper extends StatefulWidget {
  const Scraper({Key? key}) : super(key: key);

  @override
  State<Scraper> createState() => _ScraperState();
}

class _ScraperState extends State<Scraper> {
  // Strings to store the extracted Article titles
  List<Fuel> stationViewDataList = [];

  // boolean to show CircularProgressIndication
  // while Web Scraping awaits

  //benzina-standard
  //benzina-premium

  //roman-neamt

  //rompetrol
  //mol

  Future<List<Fuel>> extractData() async {
    final List<Fuel> responseList = [];
    final url = 'https://www.plinul.ro/pret/benzina-standard/iasi-iasi/rompetrol';
    // Getting the response from the targeted url
    await Future.delayed(Duration(seconds: 2), () async {
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

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: stationViewDataList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              child: Center(child: Text('Entry ${stationViewDataList[index].station.companyName}')),
            );
          }),
      FloatingActionButton.small(onPressed: () {extractData();})
    ]);
  }
}
