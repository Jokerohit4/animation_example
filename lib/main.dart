import 'package:animation_example/animated_corner_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) {
    runApp(const MyApp());
  });
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center, /// Align to the center of the row
            children: [
              AnimatedCornerBox(),
              SizedBox(width: 20),
              AnimatedCornerBox(isLeftCorner: true,),
            ],
          ),
        ),
      ),
    );
  }
}



