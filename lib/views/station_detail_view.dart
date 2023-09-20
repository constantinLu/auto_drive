import 'package:auto_drive/examples/fuel_old.dart';
import 'package:flutter/material.dart';

class StationDetailView extends StatelessWidget {
  Fuel fuel;

  StationDetailView(this.fuel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          child: Image.network(
            fuel.station.logo,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          fuel.station.address,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, color: Colors.grey),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
