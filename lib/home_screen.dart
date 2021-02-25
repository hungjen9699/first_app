import 'package:first_app/component/error_scaffold.dart';
import 'package:first_app/component/loading_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/getlistuser_bloc.dart';
import 'component/get_data_scaffold.dart';
import 'objects/userDTO.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserDTO> myList = new List<UserDTO>();
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
