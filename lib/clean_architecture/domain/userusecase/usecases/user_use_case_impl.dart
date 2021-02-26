import 'package:first_app/clean_architecture/data/userusecase/models/user_model.dart';
import 'package:first_app/clean_architecture/data/userusecase/repositories/user_repository_impl.dart';
import 'package:first_app/clean_architecture/domain/userusecase/repositories/user_repository.dart';
import 'package:first_app/clean_architecture/domain/userusecase/usecases/user_use_case.dart';

class UserUseCasesImpl implements UserUseCases {
  UserRepository userRepository;

  @override
  Future<List<UserModel>> getListUser(String page) async {
    userRepository = new UserRepositoryImpl();
    return await userRepository.getListUser(page);
  }
}
