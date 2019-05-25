import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    @required this.num,
  });

  final String num;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      margin: EdgeInsets.all(10.0),
      child: OutlineButton(
        onPressed: () {},
        highlightedBorderColor: Color(0xFFF6CAA9),
        disabledBorderColor: Color(0xFFD9D9D9),
        child: Text(
          num,
          style: kButtonTextStyle,
        ),
      ),
    );
  }
}
