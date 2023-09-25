import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mystique/mystique.dart';

import '../widget/fuel_list_widget.dart';

class TripSplitterView extends StatefulWidget {
  const TripSplitterView({super.key});

  @override
  State<TripSplitterView> createState() => _TripSplitterViewState();
}

class _TripSplitterViewState extends State<TripSplitterView> {
  final _formKey = GlobalKey<FormState>();

  String? _fuelType = 'DIESEL';

  String? _price;

  String? _distance;

  String? _kmPerL;

  String? _noPeople;

  @override
  Widget build(BuildContext context) {
    // Responsive adjustments
    double screenWidth = MediaQuery.of(context).size.width;
    double formWidth = screenWidth > 600 ? 600 : screenWidth * 0.9;
    double padding = (screenWidth - formWidth) / 2;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            children: [
              const FuelListWidget(),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    DropdownButtonFormField<String>(
                      value: _fuelType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _fuelType = newValue;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a fuel type';
                        }
                        return null;
                      },
                      items:
                          <String>['GAS', 'DIESEL'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      decoration: const InputDecoration(labelText: 'Fuel Type'),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: 'Price'),
                      validator: validateNumber,
                      onSaved: (value) => _price = value,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: 'Distance'),
                      validator: validateNumber,
                      onSaved: (value) => _distance = value,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(labelText: 'Liters pe 100 km'),
                      validator: validateNumber,
                      onSaved: (value) => _kmPerL = value,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(labelText: 'No. people'),
                      validator: validateNumber,
                      onSaved: (value) => _noPeople = value,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _calculate,
                      child: const Text('Calculate'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    }
    if (double.tryParse(value) == null) {
      return 'Enter a valid number';
    }
    return null;
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      double price = double.parse(_price!);
      double distance = double.parse(_distance!);
      double lperKm = double.parse(_kmPerL!);
      double noPeople = double.parse(_noPeople!);

      double totalCost = (distance / lperKm) * price;
      double costByPerson = totalCost / noPeople;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text('Trip Calculator')),
            content: SizedBox(
              width: 120,
              height: 60,
              child: InkWell(
                child: Column(
                  children: [
                    Text('Cost for the trip is: ${totalCost.toStringAsFixed(2)} RON'),
                    Text('Price by person is: ${costByPerson.toStringAsFixed(2)} RON'),
                    Text('Number of persons: $_noPeople')
                  ],
                ),
                onTap: () {
                  String text1 = extractText(
                      Text('Cost for the trip is: ${totalCost.toStringAsFixed(2)} RON'));
                  String text2 = extractText(
                      Text('Price by person is: ${costByPerson.toStringAsFixed(2)} RON'));
                  String text3 = extractText(Text('Number of persons: $_noPeople'));

                  Clipboard.setData(ClipboardData(text: "$text1\n$text2\n$text3"));
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
            ),
            actions: [
              TextButton(
                child: const Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        },
      );
    }
  }
}

String extractText(Text widget) {
  return widget.data!;
}
