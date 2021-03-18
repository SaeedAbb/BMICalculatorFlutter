import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final Function onPressed;

  ReusableCard({@required this.color, this.cardChild, this.onPressed});

  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        height: 200,
        width: 170,
      ),
    );
  }
}
