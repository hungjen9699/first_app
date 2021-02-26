import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String lastName;
  final String firstName;
  final String email;
  final String title;
  final String picture;

  User(
      {this.id,
      this.lastName,
      this.firstName,
      this.email,
      this.title,
      this.picture});

  @override
  List<Object> get props => [
        id,
        lastName,
        firstName,
        email,
        title,
        picture,
      ];
}
