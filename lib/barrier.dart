import 'package:flutter/material.dart';

class Barrier extends StatelessWidget {
  final size;

  Barrier(this.size);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: 100,
      decoration: BoxDecoration(
        color:Colors.green,
        border:Border.all(width: 15,color: Colors.green[800]),
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}