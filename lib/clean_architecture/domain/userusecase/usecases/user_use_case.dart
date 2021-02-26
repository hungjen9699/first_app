import 'package:first_app/clean_architecture/data/userusecase/models/user_model.dart';

abstract class UserUseCases {
  Future<List<UserModel>> getListUser(String page);
}
