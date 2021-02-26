import 'dart:convert';

import 'package:first_app/clean_architecture/data/userusecase/models/user_get_result_model.dart';
import 'package:first_app/clean_architecture/data/userusecase/models/user_model.dart';
import 'package:first_app/clean_architecture/domain/userusecase/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<UserModel>> getListUser(String page) async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'app-id': '603756f92fc8f323d48d7697'
    };
    var apiPath = Uri.encodeFull(
        "https://dummyapi.io/data/api/user?limit=20&page=" + page);
    try {
      final response = await http.get(apiPath, headers: requestHeaders);
      final responseJson = json.decode(
        utf8.decode(response.bodyBytes),
      );

      UserGetResultModel userGerResult =
          UserGetResultModel.fromJson(responseJson);
      return userGerResult.list;
    } catch (e) {
      throw ("error");
    }
  }
}

class UserGetResult {
  final List<UserModel> list;
  UserGetResult._({
    this.list,
  });
  factory UserGetResult.fromJson(Map<String, dynamic> json) {
    return new UserGetResult._(
      list: json['data'] != null
          ? (json['data'] as List)
              .map(
                (i) => UserModel.fromJson(i),
              )
              .toList()
          : null,
    );
  }
}
