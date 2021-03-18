import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String text;
  BottomButton({@required this.onTap, @required this.text});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        color: Color(0xFFEB1555),
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              text,
              style: KLargeButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}
