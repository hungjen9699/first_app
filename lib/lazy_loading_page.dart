import 'package:first_app/bloc/getlistuser_bloc.dart';
import 'package:first_app/component/user_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'objects/userDTO.dart';

class LazyLoadingPage extends StatefulWidget {
  @override
  _LazyLoadingPageState createState() => _LazyLoadingPageState();
}

class _LazyLoadingPageState extends State<LazyLoadingPage> {
  List<UserDTO> myList = new List<UserDTO>();
  ScrollController _scrollController = ScrollController();
  GetListUserBloc _getBloc = new GetListUserBloc();
  List<String> _dropDownValues = ["all", "ms", "miss", "mr"];
  String _value = "all";
  TextEditingController _searchQueryController = TextEditingController();
  @override
  initState() {
    super.initState();
    _getBloc.add(GetListUser());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreData();
      }
      if (_scrollController.position.pixels ==
          _scrollController.position.minScrollExtent) {
        _resetData();
      }
    });
  }

  _getMoreData() {
    _getBloc.add(GetMoreUser());
  }

  _resetData() {
    _getBloc.add(ResetData());
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
            return Scaffold(
                appBar: AppBar(
                    title: Row(
                  children: <Widget>[
                    DropdownButton(
                      hint: Text(
                          'Please choose a location'), // Not necessary for Option 1
                      value: _value,
                      onChanged: (newValue) {
                        setState(() {
                          _value = newValue;
                        });
                      },
                      items: _dropDownValues.map((value) {
                        return DropdownMenuItem(
                          child: new Text(value),
                          value: value,
                        );
                      }).toList(),
                    ),
                  ],
                )),
                body: Container(
                  child: Text("Loading..."),
                ));
          } else if (state is GetListUserSuccess ||
              state is ResetListSuccess ||
              state is GetMoreUserSuccess ||
              state is WaitingForLoad) {
            myList = _getBloc.listShow;
            return Scaffold(
              appBar: AppBar(
                  title: Row(
                children: <Widget>[
                  DropdownButton(
                    // Not necessary for Option 1
                    value: _value,
                    onChanged: (newValue) {
                      setState(() {
                        _value = newValue;
                        _getBloc.filterValue = newValue;
                        _getBloc.add(FilterData());
                      });
                    },
                    items: _dropDownValues.map((value) {
                      return DropdownMenuItem(
                        child: new Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                ],
              )),
              body: ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, i) {
                  if (i == myList.length) {
                    return CupertinoActivityIndicator();
                  }
                  return ListTile(
                    title: UserBox(
                      dto: myList[i],
                    ),
                  );
                },
                itemCount: myList.length + 1,
              ),
            );
          } else
            return Container();
        },
      ),
    );
  }
}
