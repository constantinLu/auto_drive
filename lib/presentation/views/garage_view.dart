import 'package:auto_drive/infra/util/data.dart';
import 'package:flutter/material.dart';

import '../../infra/util/assets.dart';

class GarageView extends StatelessWidget {
  const GarageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
              height: 300,
              child: Center(
                  child: Padding(
                      padding: EdgeInsets.only(left: 3), child: Image(image: AssetImage(lambo))))),
          const SizedBox(height: 40, width: 200, child: Card(child: Center(child: Text("Stats")))),
          const SizedBox(height: 10),
          SizedBox(
            height: 150,
            width: 200,
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alias: ${audi.name}'),
                    Text('Model: ${audi.model}'),
                    Text('Brand: ${audi.brand}'),
                    Text('Details: ${audi.modelDetails}'),
                    Text('Vin: ${audi.vin}'),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
