import 'package:uuid/uuid.dart';

class Fuel {
  final String id = const Uuid().v4();

  final String fuelType;

  final String amount;

  DateTime updatedDate = DateTime.now();

  final DateTime createdDate = DateTime.now();

  Fuel({required this.fuelType, required this.amount, required this.updatedDate});
}


