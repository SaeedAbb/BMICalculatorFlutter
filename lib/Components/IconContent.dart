import 'package:flutter/material.dart';
import 'constants.dart';

class GenderWidget extends StatelessWidget {
  final IconData fontAwesomeIcons;
  final String textContext;

  GenderWidget(this.fontAwesomeIcons, this.textContext);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          fontAwesomeIcons,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          textContext,
          style: KLabelTextStyle,
        )
      ],
    );
  }
}
