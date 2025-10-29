import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:newsapp_first/auth_services/auth_service.dart';
import 'package:newsapp_first/screens/Auth_screens/sign_up_page.dart';
import 'package:newsapp_first/screens/Auth_screens/welcome_screen.dart';
import 'package:newsapp_first/screens/bottomNav/BottomNav.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _auth=AuthService();
  TextEditingController emails=TextEditingController();
  TextEditingController passwords=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emails.dispose();
    passwords.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset('images/loginArt.png',fit: BoxFit.none),
          Positioned(
              top: 10,
              left: 10,
              child: IconButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
              }, icon: Icon(Icons.arrow_back))
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2,child: Image.asset('images/bannerArt.png',scale: 3,)),
              Expanded(
                flex: 3,
                  child: Column(
                children: [
                  Text("LOGIN",style: TextStyle(
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        offset: Offset(1, 1),
                      ),
                      BoxShadow(
                        offset: Offset(-1, -1),
                      ),
                      BoxShadow(
                        offset: Offset(1, -1),
                      ),
                      BoxShadow(
                        offset: Offset(-1, 1),
                      ),
                    ],
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height*0.06,
                  ),),
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(
                      left:MediaQuery.of(context).size.width<1000?MediaQuery.of(context).size.width*0.1:MediaQuery.of(context).size.width*0.3,
                      right:MediaQuery.of(context).size.width<1000?MediaQuery.of(context).size.width*0.1:MediaQuery.of(context).size.width*0.3,
                      bottom: 10,
                    ),
                    child: TextField(
                      style: ShadowStyles(),
                      controller: emails,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "Email",
                          label: Text("Email"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding:  EdgeInsets.only(
                      left:MediaQuery.of(context).size.width<1000?MediaQuery.of(context).size.width*0.1:MediaQuery.of(context).size.width*0.3,
                      right: MediaQuery.of(context).size.width<1000?MediaQuery.of(context).size.width*0.1:MediaQuery.of(context).size.width*0.3,
                      bottom: 10,
                    ),
                    child: TextField(
                      style: ShadowStyles(),
                      controller: passwords,
                      obscureText: true,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "Password",
                          label: Text("Password"),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () async{
                        final user=await _auth.LoginUser(emails.text, passwords.text);
                        if(user!= null){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>BottomNav()));
                        }
                      },
                      child: Text("Login",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*0.02,

                        ),
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? Create one!! "),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                      }, child: Text("Sign Up"
                        ,style: TextStyle(
                          color: Colors.orange,
                          fontSize: MediaQuery.of(context).size.height*0.02,

                        ),
                      )
                      )
                    ],
                  ),
                ],
              )),


            ],
          )
        ],
      ),


    );
  }
}

TextStyle ShadowStyles(){
  return TextStyle(
      color: Colors.black,

  );
}
