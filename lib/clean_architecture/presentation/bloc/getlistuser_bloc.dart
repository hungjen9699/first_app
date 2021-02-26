import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:first_app/clean_architecture/data/userusecase/models/user_model.dart';
import 'package:first_app/clean_architecture/domain/userusecase/usecases/user_use_case.dart';
import 'package:first_app/clean_architecture/domain/userusecase/usecases/user_use_case_impl.dart';
part 'getlistuser_event.dart';
part 'getlistuser_state.dart';

class GetListUserBloc extends Bloc<GetListUserEvent, GetListUserState> {
  int currentPage = 0;
  List<UserModel> listUser = new List<UserModel>();
  List<UserModel> listShow = new List<UserModel>();
  String filterValue = "all";
  UserUseCases userUseCase = new UserUseCasesImpl();
  @override
  GetListUserState get initialState => GetListUserLoading();

  @override
  Stream<GetListUserState> mapEventToState(GetListUserEvent event) async* {
    if (event is GetMoreUser) {
      yield WaitingForLoad();
      try {
        List<UserModel> listDTO =
            await userUseCase.getListUser(currentPage.toString());
        currentPage += 1;
        listUser.addAll(listDTO);
        yield* _mapAppStartedToState(
          filterList(listUser),
        );
      } catch (e) {
        yield GetListUserError();
      }
    } else if (event is GetListUser) {
      try {
        List<UserModel> listDTO =
            await userUseCase.getListUser(currentPage.toString());
        currentPage += 1;
        listUser.addAll(listDTO);
        yield* _mapAppStartedToState(
          filterList(listUser),
        );
      } catch (e) {
        yield GetListUserError();
      }
    } else if (event is ResetData) {
      yield GetListUserLoading();
      try {
        List<UserModel> listDTO = await userUseCase.getListUser("0");
        currentPage = 1;
        listUser = listDTO;
        yield* _mapAppStartedToState(
          filterList(listUser),
        );
      } catch (e) {
        yield GetListUserError();
      }
    } else if (event is FilterData) {
      yield* _mapAppStartedToState(
        filterList(listUser),
      );
    }
  }

  List<UserModel> filterList(List<UserModel> list) {
    List<UserModel> listTmp = new List<UserModel>();
    if (filterValue == "all") {
      listTmp = listUser;
    } else {
      for (UserModel dto in listUser) {
        if (dto.title == filterValue) {
          listTmp.add(dto);
        }
      }
    }
    return listTmp;
  }

  Stream<GetListUserState> _mapAppStartedToState(
      List<UserModel> listDTO) async* {
    if (listDTO != null) {
      yield GetListUserSuccess(listDTO);
    } else {
      yield GetListUserError();
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
