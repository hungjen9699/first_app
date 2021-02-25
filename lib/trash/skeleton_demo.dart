// import 'package:first_app/component/skeleton_user_box.dart';
// import 'package:first_app/home_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class SkeletonDemo extends StatefulWidget {
//   @override
//   _WelcomeScreenState createState() => _WelcomeScreenState();
// }

// class _WelcomeScreenState extends State<SkeletonDemo> {
//   @override
//   initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             Icon(
//               Icons.crop_free_sharp,
//               color: Colors.black,
//             ),
//             Icon(
//               Icons.search,
//               color: Colors.black,
//             )
//           ],
//         ),
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         decoration: new BoxDecoration(
//           color: Color.fromRGBO(243, 243, 255, 1),
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(50.0),
//             topLeft: Radius.circular(50.0),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 25, top: 40),
//               child: Text(
//                 "Choose Brand",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     height: 80,
//                     width: 120,
//                     decoration: normalBox(),
//                     child: Icon(Icons.mark_email_read),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     height: 80,
//                     width: 120,
//                     decoration: normalBox(),
//                     child: Icon(Icons.usb),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     height: 80,
//                     width: 120,
//                     decoration: normalBox(),
//                     child: Icon(Icons.access_alarm),
//                   ),
//                   Container(
//                     margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                     height: 80,
//                     width: 120,
//                     decoration: normalBox(),
//                     child: Icon(Icons.label),
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(left: 25, top: 40),
//               child: Text(
//                 "Beats Products",
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: 10,
//                 gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.75,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   return SkeletonUserBox();
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
