part of 'getlistuser_bloc.dart';

abstract class GetListUserState extends Equatable {
  const GetListUserState();
  @override
  List<Object> get props => [];
}

class GetListUserLoading extends GetListUserState {}

class GetListUserWaiting extends GetListUserState {}

// class GetListUserSuccess extends GetListUserState {
//   final List<UserDTO> listDTO;
//   const GetListUserSuccess(this.listDTO);
//   @override
//   List<Object> get props => [listDTO];
// }

// class ResetListSuccess extends GetListUserState {
//   final List<UserDTO> listDTO;
//   const ResetListSuccess(this.listDTO);
//   @override
//   List<Object> get props => [listDTO];
// }

// class GetMoreUserSuccess extends GetListUserState {
//   final List<UserDTO> listDTO;
//   const GetMoreUserSuccess(this.listDTO);
//   @override
//   List<Object> get props => [listDTO];
// }

class GetListUserSuccess extends GetListUserState {}

class ResetListSuccess extends GetListUserState {}

class GetMoreUserSuccess extends GetListUserState {}

class FilterListUserSuccess extends GetListUserState {}

class WaitingForLoad extends GetListUserState {}

class GetListUserError extends GetListUserState {}
