import 'package:first_app/bloc/getlistuser_bloc.dart';
import 'package:first_app/component/skeleton_user_box.dart';
import 'package:first_app/objects/userDTO.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'user_box.dart';

class GetDataScaffold extends StatefulWidget {
  final ScrollController scrollController;
  final List<UserDTO> myList;
  final GetListUserBloc getBloc;

  const GetDataScaffold(
      {Key key, this.scrollController, this.getBloc, this.myList})
      : super(key: key);
  @override
  _GetDataScaffoldState createState() => _GetDataScaffoldState();
}

class _GetDataScaffoldState extends State<GetDataScaffold> {
  bool isLike = false;
  @override
  void initState() {
    super.initState();
  }

  Future<void> _resetData() {
    widget.getBloc.add(
      ResetData(),
    );
    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              Icons.crop_free_sharp,
              color: Colors.black,
            ),
            Icon(
              Icons.search,
              color: Colors.black,
            )
          ],
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          color: Color.fromRGBO(243, 243, 255, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50.0),
            topLeft: Radius.circular(50.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 25, top: 40),
              child: Text(
                "Choose Brand",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      widget.getBloc.filterValue = "all";
                      widget.getBloc.add(
                        FilterData(),
                      );
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 80,
                      width: 120,
                      decoration: widget.getBloc.filterValue == "all"
                          ? decorateSelectBox()
                          : normalBox(),
                      child: Icon(Icons.mark_email_read),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.getBloc.filterValue = "ms";
                      widget.getBloc.add(
                        FilterData(),
                      );
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 80,
                      width: 120,
                      decoration: widget.getBloc.filterValue == "ms"
                          ? decorateSelectBox()
                          : normalBox(),
                      child: Icon(Icons.sanitizer_outlined),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.getBloc.filterValue = "mr";
                      widget.getBloc.add(
                        FilterData(),
                      );
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 80,
                      width: 120,
                      decoration: widget.getBloc.filterValue == "mr"
                          ? decorateSelectBox()
                          : normalBox(),
                      child: Icon(Icons.king_bed_sharp),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.getBloc.filterValue = "miss";
                      widget.getBloc.add(
                        FilterData(),
                      );
                    },
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      height: 80,
                      width: 120,
                      decoration: widget.getBloc.filterValue == "miss"
                          ? decorateSelectBox()
                          : normalBox(),
                      child: Icon(Icons.miscellaneous_services),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, top: 40),
              child: Text(
                "Beats Products",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _resetData,
                child: GridView.builder(
                  itemCount: widget.myList.length + 1,
                  controller: widget.scrollController,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == widget.myList.length) {
                      return SkeletonUserBox();
                    }
                    return UserBox(
                      dto: widget.myList[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

BoxDecoration decorateSelectBox() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.15),
        spreadRadius: 5,
        blurRadius: 10,
        offset: Offset(1, 3), // changes position of shadow
      ),
    ],
  );
}

BoxDecoration normalBox() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(
      Radius.circular(15.0),
    ),
  );
}
