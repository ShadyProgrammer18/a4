import 'package:a4/Screens/home.dart';
import 'package:a4/Screens/loginScreen.dart';
import 'package:a4/Widgets/CustomBtn/CustomRegBtn.dart';
import 'package:a4/Widgets/CustomBtn/progressDialog.dart';
import 'package:a4/Widgets/appbtn.dart';
import 'package:a4/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  static const String idScreen = "register";

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController firstnameTextEditingController = TextEditingController();
  TextEditingController lastnameTextEditingController = TextEditingController();
  TextEditingController phonenumberTextEditingController = TextEditingController();

  bool obscureText = true;  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
               children: [
                 Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 200, 0),
                  child: Text("Create Account",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontWeight: FontWeight.w700,
                    color: Colors.black, 
                    fontSize: 20
                  ),
                  ),
                ),
                 Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
                      child: Text("Do You already have an account?",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.grey, 
                        fontSize: 13
                  ),
                      ),
                    ),
                    AppBtn(
                      onPressed: (){
                       Navigator.pushNamedAndRemoveUntil(
                            context, LoginScreen.idScreen, (route) => false);
                      } ,
                      outlineBtn: true,
                      text: "Login!",
                    ),
                    SizedBox(width: 4,),
                     ],
                ),
                  Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 20, 258, 0),
                       child: Text(
                         "First Name",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                          ),
                     ),
                     _customFirstName(),
                      Padding(
                       padding: const EdgeInsets.fromLTRB(0, 20, 258, 0),
                       child: Text("Last Name",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          ),
                     ),
                     _customLastName(),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 20, 232, 0),
                       child: Text("Email Address",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          ),
                     ),
                     _customEmail(), 
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 20, 225, 0),
                       child: Text("Phone Number",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          ),
                     ),
                     _customPhoneNumber(),
                     Padding(
                       padding: const EdgeInsets.fromLTRB(0, 20, 262, 0),
                       child: Text("Password",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          ),
                     ),
                     _customPass(),
                       Padding(
                       padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                       child: Text("By clicking on the create account button, you are ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            color: Colors.black54,
                            fontSize: 13,
                          ),
                          ),
                     ),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.fromLTRB(19, 0, 0, 14),
                           child: Text("agreeing to our",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 13,
                            ),
                            ),
                         ),
                         Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 20, 14),
                            child: AppBtn(
                              text: "terms and condition",
                              onPressed: (){
                                print("clicked");
                              },
                              outlineBtn: true,
                            ),
                          ),
                       ],
                     ) 
                   ],
                 ),
                   CustomRegBtn(
                   outlineBtn: false,
                   onPressed: () {
                     if(firstnameTextEditingController.text.length < 3)
                     {
                      displayToastMessage("Name must be atleast 3 characters", context);
                     }
                     else if(lastnameTextEditingController.text.length < 3)
                     {
                     displayToastMessage("Name must be atleast 3 characters", context);  
                     }
                     else if(!emailTextEditingController.text.contains("@"))
                     {
                      displayToastMessage("Email Address is not Valid", context);
                     }
                     else if(phonenumberTextEditingController.text.isEmpty)
                     {
                       displayToastMessage("Phone Number is mandatory", context);
                     }
                     else if(passwordTextEditingController.text.length < 6)
                     {
                       displayToastMessage("Password must be atleast 6 characters", context);
                     }
                     else
                     {
                       registerNewUser(context); 
                     } 
                   },
                   text: "Register",
                   ),
               ],
              
            ),
            ),
        ),
      ),
    );
  }

  Container _customPhoneNumber() {
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
      keyboardType: TextInputType.phone,
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

  Container _customLastName() {
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
      controller: lastnameTextEditingController,
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

  Container _customFirstName() {
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
      controller: firstnameTextEditingController,
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

  Container _customPass() {
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
      keyboardType: TextInputType.emailAddress,
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

  Container _customEmail() {
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
      controller: emailTextEditingController,
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async
  {
    showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (BuildContext context) {
     return ProgressDialog(message: "Registering, Please wait....",);
    });
   final User firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(
     email: emailTextEditingController.text, 
     password: passwordTextEditingController.text
     ).catchError((errMsg){
        Navigator.pop(context);
      displayToastMessage("The email address is already in use by another account", context); 
     })).user;

     if(firebaseUser != null)
     {
       Map userDataMap = {
         "firstname": firstnameTextEditingController.text.trim(),
         "lastname": lastnameTextEditingController.text.trim(),
         "email": emailTextEditingController.text.trim(),
         "phonenumber": phonenumberTextEditingController.text.trim(),

       };
       usersRef.child(firebaseUser.uid).set(userDataMap);
       displayToastMessage("Congratulations, your account has been created", context);

       Navigator.pushNamedAndRemoveUntil(context, Home.idScreen, (route) => false);
     }
     else
      { 
        Navigator.pop(context);
        displayToastMessage("User account has not been created", context);

     }
  }
}

displayToastMessage(String message, BuildContext context)
{
 Fluttertoast.showToast(msg: message);
}