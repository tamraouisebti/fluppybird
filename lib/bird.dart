import 'package:flutter/material.dart';

class Bird extends StatefulWidget {
  @override
  _BirdState createState() => _BirdState();
}

class _BirdState extends State<Bird> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset('images/flappybird.png',
      
        
      ),
    );
  }
}