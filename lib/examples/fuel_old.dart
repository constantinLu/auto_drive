import 'package:auto_drive/examples/station_old.dart';
import 'package:uuid/uuid.dart';

class Fuel {
  final String id = const Uuid().v4();

  final Station station;

  final String type;

  final String money;

  final String updatedDate;

  final String cratedDate;

  Fuel(this.station, this.type, this.money, this.updatedDate, this.cratedDate);
}
