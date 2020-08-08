import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomRaisedButton {
  SocialSignInButton({
    @required String assetName,
    @required String text,
    Color color,
    Color textColor,
    VoidCallback onPressed,
  })  : assert(assetName != null),
        assert(text != null),
        super(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(assetName),
                Text(text, style: TextStyle(color: textColor, fontSize: 15)),
                Opacity(opacity: 0, child: Image.asset(assetName)),
              ],
            ),
          ),
          color: color,
          onPressed: onPressed,
        );
}
