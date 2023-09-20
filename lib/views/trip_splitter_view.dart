import 'package:flutter/material.dart';

class TripSplitter extends StatefulWidget {
  const TripSplitter({super.key});

  @override
  State<TripSplitter> createState() => _TripSplitterState();
}

class _TripSplitterState extends State<TripSplitter> {
  final _formKey = GlobalKey<FormState>();

  String? _fuelType = 'DIESEL';

  String? _price;

  String? _distance;

  String? _kmPerL;

  @override
  Widget build(BuildContext context) {
    // Responsive adjustments
    double screenWidth = MediaQuery.of(context).size.width;
    double formWidth = screenWidth > 600 ? 600 : screenWidth * 0.9;
    double padding = (screenWidth - formWidth) / 2;

    return Scaffold(
      appBar: AppBar(title: const Text('Fuel Form')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Form(
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
                  items: <String>['GAS', 'DIESEL'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  decoration: const InputDecoration(labelText: 'Fuel Type'),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Price'),
                  validator: validateNumber,
                  onSaved: (value) => _price = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Distance'),
                  validator: validateNumber,
                  onSaved: (value) => _distance = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'km/l'),
                  validator: validateNumber,
                  onSaved: (value) => _kmPerL = value,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculate,
                  child: const Text('Calculate'),
                )
              ],
            ),
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
      double kmPerL = double.parse(_kmPerL!);

      double totalCost = (distance / kmPerL) * price;

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Calculation Result'),
            content: Text('Total cost for the trip is: ${totalCost.toStringAsFixed(2)} RON'),
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
