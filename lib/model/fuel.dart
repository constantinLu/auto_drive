import 'package:auto_drive/model/station.dart';
import 'package:uuid/uuid.dart';

class Fuel {
  final String _id = const Uuid().v4();

  final Station _station;

  final String _type;

  final String _money;

  final String _updatedDate;

  final String _cratedDate;

  Fuel(this._station, this._type, this._money, this._updatedDate, this._cratedDate);

  String get cratedDate => _cratedDate;

  String get updatedDate => _updatedDate;

  String get money => _money;

  String get type => _type;

  Station get station => _station;

  String get id => _id;
}
