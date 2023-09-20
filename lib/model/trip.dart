import 'package:uuid/uuid.dart';

class Trip {
  final String id = const Uuid().v4();

  final String tripName;

  final int distance;

  final double consumption;

  final double fuelAmount;

  final double cost;

  DateTime updatedDate = DateTime.now();

  final DateTime createdDate = DateTime.now();

  Trip(
      {required this.tripName,
      required this.distance,
      required this.consumption,
      required this.fuelAmount,
      required this.cost,
      required this.updatedDate});
}
