import 'package:first_app/objects/userDTO.dart';
import 'package:flutter/material.dart';

class UserBox extends StatelessWidget {
  final UserDTO dto;

  const UserBox({Key key, this.dto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 100,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 2.0, // has the effect of softening the shadow
              spreadRadius: 2.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            )
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 10,
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.red,
                // image: DecorationImage(
                //   image: NetworkImage(dto.picture),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(dto.title + ". " + dto.firstName + " " + dto.lastName,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    dto.email,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
