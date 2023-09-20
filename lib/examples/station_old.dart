import 'package:uuid/uuid.dart';

class Station {
  final String id = const Uuid().v4();
  final String companyName;
  final String logo;
  final String address;

  Station(this.companyName, this.logo, this.address);
}
