import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';

@freezed
abstract class Vehicle implements _$Vehicle {
  const Vehicle._();

  factory Vehicle({
    required String id,
    required String name,
    required String brand,
    required String model,
    required String modelDetails,
    required String vin,
  }) = _Vehicle;
}


//tempData
