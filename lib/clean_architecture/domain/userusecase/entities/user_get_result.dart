import 'package:equatable/equatable.dart';
import 'package:first_app/clean_architecture/data/userusecase/models/user_model.dart';

class UserGetResult extends Equatable {
  final List<UserModel> list;

  UserGetResult({
    this.list,
  });

  @override
  List<Object> get props => [list];
}
