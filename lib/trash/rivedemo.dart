// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:rive/rive.dart';

// class MyRiveAnimation extends StatefulWidget {
//   @override
//   _MyRiveAnimationState createState() => _MyRiveAnimationState();
// }

// class _MyRiveAnimationState extends State<MyRiveAnimation>
//     with SingleTickerProviderStateMixin {
//   final riveFileName = 'lib/asset/truck.riv';
//   Artboard _artboard;

//   @override
//   void initState() {
//     _loadRiveFile();
//     super.initState();
//   }

//   // loads a Rive file
//   void _loadRiveFile() async {
//     final bytes = await rootBundle.load(riveFileName);
//     final file = RiveFile();

//     if (file.import(bytes),) {
//       // Select an animation by its name
//       setState(() => _artboard = file.mainArtboard
//         ..addController(
//           SimpleAnimation('idle'),
//         ),);
//     }
//   }

//   /// Show the rive file, when loaded
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedIcon(
//       icon: AnimatedIcons.menu_arrow,
//       semanticLabel: 'Show menu',
//       progress: null,
//     );
//   }
// }
