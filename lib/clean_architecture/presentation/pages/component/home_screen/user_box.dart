import 'package:first_app/clean_architecture/data/userusecase/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

import '../../detail_screen.dart';

class UserBox extends StatefulWidget {
  final UserModel dto;
  const UserBox({Key key, this.dto}) : super(key: key);
  @override
  _UserBoxState createState() => _UserBoxState();
}

class _UserBoxState extends State<UserBox> {
  Color _color = Colors.grey;
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) {
              return DetailScreen(dto: widget.dto);
            },
            transitionsBuilder: (context, animation1, animation2, child) {
              return FadeTransition(
                opacity: animation1,
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 450),
          ),
        );
      },
      child: Container(
        width: 50,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 120,
              top: 10,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _color == Colors.grey
                        ? _color = Colors.red
                        : _color = Colors.grey;
                    isLike == false ? isLike = true : isLike = false;
                  });
                },
                child: Container(
                  height: 25,
                  width: 25,
                  child: Center(
                    child: AnimatedSwitcher(
                      child: !isLike
                          ? Container(
                              key: UniqueKey(),
                              height: 20.0,
                              width: 20.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.grey,
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 14,
                              ),
                            )
                          : Container(
                              key: UniqueKey(),
                              height: 24.0,
                              width: 24.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.red,
                              ),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                      duration: Duration(milliseconds: 250),
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: widget.dto.id + "image",
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage(widget.dto.picture),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              widget.dto.title + ". " + widget.dto.firstName,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            child: Text(
                              "\$129.6",
                              style: TextStyle(
                                  color: Color.fromRGBO(6, 13, 217, 1),
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 60),
                            child: RatingBar(
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              halfFilledIcon: Icons.star_half,
                              isHalfAllowed: true,
                              filledColor: Colors.amber,
                              emptyColor: Colors.amber,
                              halfFilledColor: Colors.amberAccent,
                              size: 12,
                              onRatingChanged: (double rating) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Hero(
                  tag: widget.dto.id + "info",
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
                      margin: EdgeInsets.only(left: 20),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomPageRoute<T> extends PageRoute<T> {
  CustomPageRoute(this.child);
  @override
  Color get barrierColor => Colors.black;

  @override
  String get barrierLabel => null;

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);
}
