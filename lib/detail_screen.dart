import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

import 'objects/userDTO.dart';

class DetailScreen extends StatefulWidget {
  final UserDTO dto;

  const DetailScreen({Key key, this.dto}) : super(key: key);
  @override
  _DetailScreentate createState() => _DetailScreentate();
}

class _DetailScreentate extends State<DetailScreen> {
  ScrollController _scrollController = ScrollController();
  double _bottomValue = 0;
  // var _debouncer = Debouncer(milliseconds: 100);
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 255, 1),
      body: Stack(
        overflow: Overflow.visible,
        children: [
          NotificationListener<ScrollNotification>(
            // ignore: missing_return
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                // _debouncer.run(() => setState(() {
                //       _bottomValue = -60;
                //     }),);
                print("hgfhg");

                setState(() {
                  _bottomValue = -60;
                });
              } else if (scrollNotification is ScrollEndNotification) {
                setState(() {
                  _bottomValue = 0;
                });
              }
            },
            child: CustomScrollView(
              controller: _scrollController,
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  floating: true,
                  pinned: true,
                  snap: false,
                  expandedHeight: 400,
                  // bottom: PreferredSize(
                  //   preferredSize: const Size.fromHeight(0.0),
                  //   child: Container(
                  //     child: Text(
                  //       widget.dto.title +
                  //           ". " +
                  //           widget.dto.firstName +
                  //           " " +
                  //           widget.dto.lastName,
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 16,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      margin: EdgeInsets.only(top: 80),
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(243, 243, 255, 1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),
                      ),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Column(
                            children: [
                              Hero(
                                tag: widget.dto.id + "image",
                                child: Container(
                                  height: 200,
                                  width: 200,
                                  margin: EdgeInsets.only(
                                      left: 30, right: 30, top: 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red,
                                    image: DecorationImage(
                                      image: NetworkImage(widget.dto.picture),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Hero(
                                tag: widget.dto.id + "info1",
                                flightShuttleBuilder: (
                                  BuildContext flightContext,
                                  Animation<double> animation,
                                  HeroFlightDirection flightDirection,
                                  BuildContext fromHeroContext,
                                  BuildContext toHeroContext,
                                ) {
                                  return SingleChildScrollView(
                                    child: toHeroContext.widget,
                                  );
                                },
                                child: Material(
                                  type: MaterialType.transparency,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          child: RatingBar(
                                            filledIcon: Icons.star,
                                            emptyIcon: Icons.star_border,
                                            halfFilledIcon: Icons.star_half,
                                            isHalfAllowed: true,
                                            filledColor: Colors.amber,
                                            emptyColor: Colors.amber,
                                            halfFilledColor: Colors.amberAccent,
                                            size: 14,
                                            onRatingChanged: (double rating) {},
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          widget.dto.title +
                                              ". " +
                                              widget.dto.firstName +
                                              " " +
                                              widget.dto.lastName,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "\$129.6",
                                          style: TextStyle(
                                              color:
                                                  Color.fromRGBO(6, 13, 217, 1),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  iconTheme: IconThemeData(
                    color: Colors.black, //change your color here
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        height: 600,
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50.0),
                            topLeft: Radius.circular(50.0),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Container(
                                height: double.infinity,
                                color: Color.fromRGBO(243, 243, 255, 1),
                              ),
                            ),
                            Container(
                              height: double.infinity,
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(50.0),
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(top: 30, left: 30),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Colors",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 20,
                                            width: 20,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 1,
                                                    blurRadius: 10,
                                                    offset: Offset(1,
                                                        3), // changes position of shadow
                                                  ),
                                                ]),
                                            child: Icon(
                                              Icons.circle,
                                              color: Colors.purple,
                                              size: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.pink,
                                            ),
                                            child: Icon(
                                              Icons.circle,
                                              color: Colors.pink,
                                              size: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            height: 15,
                                            width: 15,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              color: Colors.teal,
                                            ),
                                            child: Icon(
                                              Icons.circle,
                                              color: Colors.teal,
                                              size: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text(
                                      "Details",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Input Type: 3.5mm stereo jack",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "Other Features: Bluetooth, Foldable, Noise",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "Isolation, Stereo, Stereo Bluetooth, Wireless",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "Form Factor: On-Ear",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "Connections: Bluetooth, Wireless",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "Speaker Configurations: Stereo",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            bottom: _bottomValue,
            left: 0,
            right: 0,
            height: 60,
            duration: new Duration(milliseconds: 300),
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: 150,
                    height: 40,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color.fromRGBO(243, 243, 255, 1),
                      child: Text(
                        'Add to Cart',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    width: 150,
                    height: 40,
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      color: Color.fromRGBO(6, 13, 217, 1),
                      child: Text(
                        'Buy Now',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
