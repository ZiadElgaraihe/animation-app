import 'package:flutter/material.dart';

//This is a custom widget that is used to make the waved container used in the ui
class WaveClipPath extends StatelessWidget {
  final String title;
  const WaveClipPath({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      //Use clipPath() to paint the wave
      clipper: WaveClipper(),
      child: Container(
        alignment: Alignment.center,
        color: Colors.purple,
        height: 275,
        //The width of the container is the width of the screen
        width: double.infinity,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

/*
I make this class extends from CustomClipper<Path> that allow me to paint 
It has two methods:
1) shouldReclip() and it's bool function
2) getClip() and it takes the size of the container that clipPath contains and
   returns something of type Path and Path is the way helps me to paint
   the shape I want
*/
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double w = size.width; //Width of the container
    double h = size.height; //Height of the container
    path.lineTo(0, 0);
    path.lineTo(0, h - 40); //This make a line from (0,0) to (0, height - 40)
    //quadraticBezierTo() is used to match between two points cross a third
    //point with circular road
    path.quadraticBezierTo(w * 0.25, h - 50, w * 0.5, h - 25);
    path.quadraticBezierTo(w * 0.75, h, w, h - 25);
    path.lineTo(w, 0);
    //close() is used to make a line between the first point and the last one
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
