import 'package:uuid/uuid.dart';

class Station {
  final String _id = const Uuid().v4();
  final String _companyName;
  final String _logo;
  final String _address;

  Station(this._companyName, this._logo, this._address);

  String get id => _id;

  String get logo => _logo;

  String get companyName => _companyName;

  String get address => _address;
}
