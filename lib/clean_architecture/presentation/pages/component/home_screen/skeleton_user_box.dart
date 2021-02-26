import 'package:flutter/material.dart';

import '../general/load_animation.dart';

class SkeletonUserBox extends StatefulWidget {
  @override
  _SkeletonUserBoxState createState() => _SkeletonUserBoxState();
}

class _SkeletonUserBoxState extends State<SkeletonUserBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: new BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 120,
            top: 10,
            child: LoadAnimation(
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[100],
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
              LoadAnimation(
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoadAnimation(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 20.0,
                        width: 120.0,
                        color: Colors.grey[100],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LoadAnimation(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 20.0,
                        width: 120.0,
                        color: Colors.grey[100],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    LoadAnimation(
                      child: Container(
                        margin: EdgeInsets.only(left: 20),
                        height: 20.0,
                        width: 120.0,
                        color: Colors.grey[100],
                      ),
                    ),
                    // Container(
                    //     margin: EdgeInsets.only(left: 20),
                    //     child: Container(
                    //       height: 20,
                    //       width: 120,
                    //       color: Colors.grey[100],
                    //     ),),
                  ],
                ),
              ),
            ],
          )
        ],
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
