part of 'getlistuser_bloc.dart';

abstract class GetListUserState extends Equatable {
  const GetListUserState();
  @override
  List<Object> get props => [];
}

class GetListUserLoading extends GetListUserState {}

class GetListUserSuccess extends GetListUserState {
  final List<UserModel> listDTO;
  const GetListUserSuccess(this.listDTO);
  @override
  List<Object> get props => [listDTO];
}

class WaitingForLoad extends GetListUserState {}

class GetListUserError extends GetListUserState {}
