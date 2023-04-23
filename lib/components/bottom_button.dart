import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton(this.onTap, this.buttonTitle);
  final String buttonTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
          color: kBottomContainerColour,
          margin: const EdgeInsets.only(top:10.0),
          //padding: EdgeInsets.only(bottom: 20.0),
          width: double.infinity,
          height:kBottomContainerHeight,
          child: Center(
            child: Text(buttonTitle, style:kLargeButtonTextStyle),
          )
      ),
    );
  }
}