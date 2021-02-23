import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/objects/userDTO.dart';
import 'package:first_app/repository/user_repository.dart';
part 'getlistuser_event.dart';
part 'getlistuser_state.dart';

class GetListUserBloc extends Bloc<GetListUserEvent, GetListUserState> {
  int currentPage = 1;
  List<UserDTO> listUser = new List<UserDTO>();
  List<UserDTO> listShow = new List<UserDTO>();
  String filterValue = "all";
  @override
  GetListUserState get initialState => GetListUserLoading();

  @override
  Stream<GetListUserState> mapEventToState(GetListUserEvent event) async* {
    UserRepository _userRepository = new UserRepository();
    if (event is GetMoreUser) {
      yield WaitingForLoad();
      List<UserDTO> listDTO =
          await _userRepository.fetchUsers(currentPage.toString());
      currentPage += 1;
      for (UserDTO dto in listDTO) {
        listUser.add(dto);
      }
      yield GetMoreUserSuccess();
    } else if (event is GetListUser) {
      List<UserDTO> listDTO =
          await _userRepository.fetchUsers(currentPage.toString());
      currentPage += 1;
      for (UserDTO dto in listDTO) {
        listUser.add(dto);
      }
      yield* _mapAppStartedToState(filterList(listUser));
    } else if (event is ResetData) {
      yield GetListUserLoading();
      List<UserDTO> listDTO = await _userRepository.fetchUsers("1");
      currentPage = 1;
      listUser = listDTO;
      yield ResetListSuccess();
    } else if (event is FilterData) {
      yield GetListUserSuccess();
    }
    listShow = filterList(listUser);
  }

  List<UserDTO> filterList(List<UserDTO> list) {
    List<UserDTO> listTmp = new List<UserDTO>();
    if (filterValue == "all") {
      listTmp = listUser;
    } else {
      for (UserDTO dto in listUser) {
        if (dto.title == filterValue) {
          listTmp.add(dto);
        }
      }
    }
    return listTmp;
  }

  Stream<GetListUserState> _mapAppStartedToState(List<UserDTO> listDTO) async* {
    if (listDTO != null) {
      yield GetListUserSuccess();
    } else {
      yield GetListUserError();
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
