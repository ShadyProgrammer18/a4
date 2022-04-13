
import 'package:flutter/material.dart';

class CustomRegBtn extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool outlineBtn;
  CustomRegBtn({this.text, this.onPressed,this.outlineBtn});
  @override
  Widget build(BuildContext context) {
    bool _outlineBtn = outlineBtn ?? false;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 45.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _outlineBtn ? Colors.transparent : Colors.orange.withOpacity(.5),
          border: Border.all(
            color: Colors.orange.withOpacity(.5),
            width: 0
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 0.5,
        ),
        child: Text(
          text ?? "Text",
          style: TextStyle(
            fontFamily: "Lato",
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: _outlineBtn ? Colors.black : Colors.white
            ),
          ),
      ),
    );
  }
}
