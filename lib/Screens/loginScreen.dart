
import 'package:a4/Screens/RegisterPage.dart';
import 'package:a4/Screens/home.dart';
import 'package:a4/Widgets/CustomBtn/progressDialog.dart';
import 'package:a4/Widgets/appbtn.dart';
import 'package:a4/Widgets/CustomBtn/custombtn.dart';
import 'package:a4/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String idScreen = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
            children: [
              Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/images/logo.png",width: 130,height: 130,),
               ),
               Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 205, 0),
                    child: Text("Login as a Rider",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                      color: Colors.black, 
                      fontSize: 18
                    ),
                    ),
                  ),
                   Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14, 0, 0, 0),
                        child: Text("Don't have an account?",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          color: Colors.grey, 
                          fontSize: 14
                    ),
                        ),
                      ),
                     AppBtn(
                        onPressed: (){
                          Navigator.pushNamedAndRemoveUntil(
                            context, RegisterPage.idScreen, (route) => false);  
                            },
                        text: "Create it!",
                        outlineBtn: true,
                     )
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 40, 240, 0),
                      child: Text("Email Address",
                        style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 13,
                            ),
                            ),
                       ),
                       _customEmail(),
                    Padding(
                       padding: const EdgeInsets.fromLTRB(0, 25, 265, 0),
                       child: Text("Password",
                       style: TextStyle(
                       fontFamily: "Poppins",
                       fontWeight: FontWeight.w500,
                       color: Colors.grey[500],
                       fontSize: 13,
                            ),
                            ),
                       ),
                        _customPass(),
                  CustomBtn(
                    onPressed: (){
                      if(!emailTextEditingController.text.contains("@"))
                     {
                      displayToastMessage("Email Address is not Valid", context);
                     }
                      else if(passwordTextEditingController.text.isEmpty)
                     {
                       displayToastMessage("Password is mandatory", context);
                     }
                     else
                     {
                       loginAndAuthenticateUser(context);
                     }
                      
                    },
                    text: "Login",
                    outlineBtn: false,
                    ),
                
            ],
            ),
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

void loginAndAuthenticateUser(BuildContext context) async
{
  showDialog(
    context: context,
    barrierDismissible: false, 
    builder: (BuildContext context) {
     return ProgressDialog(message: "Authenticating, Please wait....",);
    });
final User firebaseUser = (await _firebaseAuth.signInWithEmailAndPassword(
     email: emailTextEditingController.text, 
     password: passwordTextEditingController.text
     ).catchError((errMsg){
       Navigator.pop(context);
      displayToastMessage("The Password is invalid", context); 
     })).user;
      if(firebaseUser != null)
     {
      
       final DatabaseEvent event = await 
      usersRef.child(firebaseUser.uid).once();
       {
         if(event.snapshot.value != null)
        {
          Navigator.pushNamedAndRemoveUntil(context, Home.idScreen, (route) => false);     
          displayToastMessage("Login successful", context);
         }  
         else
         {
           Navigator.pop(context);
           _firebaseAuth.signOut();
            displayToastMessage("No record exists for this user.Please create new account.", context);

         }  
       }
     }
     else
      {
        Navigator.pop(context);
        displayToastMessage("Error occured, can not be signed-in", context);

     }
}

}