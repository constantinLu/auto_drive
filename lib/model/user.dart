import 'package:uuid/uuid.dart';

class User {
  final String id = const Uuid().v4();

  final String firstName;

  final String lastName;

  final String email;

  final String password;

  User(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});
}
