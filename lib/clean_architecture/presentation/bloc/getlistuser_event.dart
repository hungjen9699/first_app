part of 'getlistuser_bloc.dart';

abstract class GetListUserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetListUser extends GetListUserEvent {}

class GetMoreUser extends GetListUserEvent {}

class ResetData extends GetListUserEvent {}

class FilterData extends GetListUserEvent {}
