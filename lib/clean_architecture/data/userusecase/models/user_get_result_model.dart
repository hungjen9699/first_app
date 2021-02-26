import 'package:first_app/clean_architecture/domain/userusecase/entities/user_get_result.dart';

import 'user_model.dart';

class UserGetResultModel extends UserGetResult {
  UserGetResultModel({List<UserModel> list})
      : super(
          list: list,
        );

  factory UserGetResultModel.fromJson(Map<String, dynamic> json) {
    return UserGetResultModel(
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
