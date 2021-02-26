import 'package:first_app/clean_architecture/domain/userusecase/entities/user.dart';

class UserModel extends User {
  UserModel({
    String id,
    String lastName,
    String firstName,
    String email,
    String title,
    String picture,
  }) : super(
          id: id,
          lastName: lastName,
          firstName: firstName,
          email: email,
          title: title,
          picture: picture,
        );
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      title: json['title'],
      picture: json['picture'],
    );
  }
}
