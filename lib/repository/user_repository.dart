import 'package:first_app/objects/userDTO.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserRepository {
  static final UserRepository _userRepository = UserRepository._internal();
  factory UserRepository() {
    return _userRepository;
  }
  Future<List<UserDTO>> fetchUsers(String page) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'app-id': '603756f92fc8f323d48d7697'
    };
    var apiPath = Uri.encodeFull(
        "https://dummyapi.io/data/api/user?limit=10&page=" + page);
    try {
      final response = await http.get(apiPath, headers: requestHeaders);
      final responseJson = json.decode(
        utf8.decode(response.bodyBytes),
      );
      UserGetResult userGerResult = UserGetResult.fromJson(responseJson);
      return userGerResult.list;
    } catch (e) {
      print(e);
      return null;
    }
  }

  UserGetResult parserListUser(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<UserGetResult>(
          (json) => UserGetResult.fromJson(json),
        )
        .toList();
  }

  UserRepository._internal();
}

class UserGetResult {
  final List<UserDTO> list;

  UserGetResult._({
    this.list,
  });

  factory UserGetResult.fromJson(Map<String, dynamic> json) {
    return new UserGetResult._(
      list: json['data'] != null
          ? (json['data'] as List)
              .map(
                (i) => UserDTO.fromJson(i),
              )
              .toList()
          : null,
    );
  }
}
