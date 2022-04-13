
import 'package:flutter/material.dart';

class CustomPhoneNum extends StatelessWidget {

  final TextEditingController phonenumberTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
       margin: EdgeInsets.symmetric(
        vertical: 10.0,
         horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),  
      ),
      child: TextField(
        controller: phonenumberTextEditingController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[500],
        cursorHeight: 26,
        cursorWidth: 2.4,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w500,
            fontSize: 20
          ),
           contentPadding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 17.0
          ),
        ),
      ),
    );
  }
}