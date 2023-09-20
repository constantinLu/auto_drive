import 'package:uuid/uuid.dart';

class Station {
  final String id = const Uuid().v4();
  final String companyName;
  final String logo;
  final String address;
  final String fuel;
  final DateTime createdDate = DateTime.now();

  Station(
      {required this.companyName,
        required this.logo,
        required this.address,
        required this.fuel,
      });
}
