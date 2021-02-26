import 'package:first_app/clean_architecture/data/userusecase/models/user_model.dart';
import 'package:first_app/clean_architecture/presentation/bloc/getlistuser_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component/home_screen/error_scaffold.dart';
import 'component/home_screen/get_data_scaffold.dart';
import 'component/home_screen/loading_scaffold.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> myList = new List<UserModel>();
  ScrollController _scrollController = ScrollController();
  GetListUserBloc _getBloc = new GetListUserBloc();
  @override
  initState() {
    super.initState();
    _getBloc.add(
      GetListUser(),
    );
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
    });
  }

  _getMoreData() {
    _getBloc.add(
      GetMoreUser(),
    );
  }

  @override
  void dispose() {
    _getBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getBloc,
      child: BlocBuilder<GetListUserBloc, GetListUserState>(
        builder: (context, state) {
          if (state is GetListUserLoading) {
            return LoadingScaffold(
              scrollController: _scrollController,
            );
          } else if (state is GetListUserSuccess) {
            myList = state.listDTO;
            return GetDataScaffold(
              scrollController: _scrollController,
              getBloc: _getBloc,
              myList: myList,
            );
          } else if (state is WaitingForLoad) {
            return GetDataScaffold(
              scrollController: _scrollController,
              getBloc: _getBloc,
              myList: myList,
            );
          } else
            return ErrorScaffold();
        },
      ),
    );
  }
}
