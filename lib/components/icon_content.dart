import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.iconType, this.label);

  final IconData iconType;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //iconType,
        Icon(
          //FontAwesomeIcons.mars,
          iconType,
          size:80.0,
        ),
        SizedBox(
          height:15.0,
        ),
        Text(
          //'MALE',
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}