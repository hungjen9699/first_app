import 'package:first_app/objects/userDTO.dart';
import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class DetailScreen extends StatefulWidget {
  final UserDTO dto;
  const DetailScreen({Key key, this.dto}) : super(key: key);
  @override
  _DetailScreentate createState() => _DetailScreentate();
}

class _DetailScreentate extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
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
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40.0),
              topLeft: Radius.circular(40.0),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    color: Color.fromRGBO(243, 243, 255, 1),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50.0),
                      topLeft: Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  margin: EdgeInsets.only(top: 110, right: 20),
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: Offset(1, 3), // changes position of shadow
                        ),
                      ]),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color.fromRGBO(6, 13, 217, 1),
                    size: 16,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Hero(
                    tag: widget.dto.id + "image",
                    child: Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.symmetric(horizontal: 30),
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
                                  color: Color.fromRGBO(6, 13, 217, 1),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                        child: fromHeroContext.widget,
                      );
                    },
                    child: Material(
                      type: MaterialType.transparency,
                      child: Container(
                        height: 255,
                        width: MediaQuery.of(context).size.width,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                            ),
                            Container(
                              height: 220,
                              child: SingleChildScrollView(
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                      BorderRadius.circular(
                                                          100),
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
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              width: 160,
                                              height: 40,
                                              child: FlatButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                color: Color.fromRGBO(
                                                    243, 243, 255, 1),
                                                child: Text(
                                                  'Add to Cart',
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              width: 160,
                                              height: 40,
                                              child: FlatButton(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                color: Color.fromRGBO(
                                                    6, 13, 217, 1),
                                                child: Text(
                                                  'Buy Now',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
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
    );
  }
}
