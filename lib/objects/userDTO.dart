class UserDTO {
  final String id;
  final String lastName;
  final String firstName;
  final String email;
  final String title;
  final String picture;

  UserDTO._({
    this.id,
    this.lastName,
    this.firstName,
    this.email,
    this.title,
    this.picture,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return new UserDTO._(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      email: json['email'],
      title: json['title'],
      picture: json['picture'],
    );
  }
}
