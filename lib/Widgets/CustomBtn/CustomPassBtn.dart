
import 'package:flutter/material.dart';

class CustomPassBtn extends StatefulWidget {
  
  @override
  _CustomPassBtnState createState() => _CustomPassBtnState();
}

class _CustomPassBtnState extends State<CustomPassBtn> {

TextEditingController passwordTextEditingController = TextEditingController();
 bool obscureText = true; 

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
        keyboardType: TextInputType.phone,
        controller: passwordTextEditingController,
        obscureText: obscureText,
        cursorColor: Colors.orange[500],
        cursorHeight: 26,
        cursorWidth: 2.4,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(obscureText ? Icons.visibility_off 
            : Icons.visibility, color: Colors.orange,), 
            onPressed: (){
              obscureText = !obscureText;
              setState(() {
                              
                            });
            } ),
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