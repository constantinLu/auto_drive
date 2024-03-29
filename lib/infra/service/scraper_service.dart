import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../domain/model/fuel.dart';
import '../../domain/model/station.dart';

class ScraperService {
  Future<List<Fuel>> extractData() async {
    final List<Fuel> responseList = [];
    const url = 'https://www.plinul.ro/pret/benzina-standard/iasi-iasi/rompetrol';

    // Getting the response from the targeted url
    await Future.delayed(const Duration(seconds: 1), () async {
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
}
