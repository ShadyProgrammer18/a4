

 import 'package:flutter/material.dart';

class AppBtn extends StatelessWidget {
   final String text;
  final Function onPressed;
  final bool outlineBtn;
  AppBtn({this.text, this.onPressed, this.outlineBtn});
   @override
   Widget build(BuildContext context) {
     bool _outlineBtn = outlineBtn ?? false;
     return GestureDetector(
       onTap: onPressed,
       child: Container(
         decoration: BoxDecoration(
           color: _outlineBtn ? Colors.transparent : Colors.orange.withOpacity(.5),
           border: Border.all(
             color: Colors.transparent  ,
             width: 0.0,
           ),
           borderRadius: BorderRadius.circular(5),
         ),
         margin: EdgeInsets.symmetric(
           horizontal: 3.0,
           vertical: 4.0,
         ),
         child: Text(
           text ?? "Text",
          style: TextStyle(
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
            color: Colors.orange[500],
            fontSize: 13,
            ),
         ),
       ),
     );
   }
 }