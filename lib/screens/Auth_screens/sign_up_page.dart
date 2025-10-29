import 'package:flutter/material.dart';
import 'package:newsapp_first/auth_services/auth_service.dart';
import 'package:newsapp_first/screens/Auth_screens/login_page.dart';
import 'package:newsapp_first/screens/Auth_screens/welcome_screen.dart';
import 'package:newsapp_first/screens/bottomNav/BottomNav.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final auth=AuthService();
  TextEditingController name=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  @override
  void dispose() {
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
  }
/*body: Stack(
        fit: StackFit.expand,
        children: [

          Image.asset('images/loginArt.png',fit: BoxFit.none),


          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2,child: Image.asset('images/bannerArt.png',scale: 3,)),
              Expanded(
                flex: 3,
                  child: Column(
                children: [
                  Text("SIGNUP",style: TextStyle(
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
                      controller:name ,
                      decoration: InputDecoration(
                          filled: true,
                          hintText: "Name",
                          label: Text("Name"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(
                      left:MediaQuery.of(context).size.width<1000?MediaQuery.of(context).size.width*0.1:MediaQuery.of(context).size.width*0.3,
                      right:MediaQuery.of(context).size.width<1000?MediaQuery.of(context).size.width*0.1:MediaQuery.of(context).size.width*0.3,
                      bottom: 10,
                    ),
                    child: TextField(
                      style: ShadowStyles(),
                      controller: email,
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
                      controller: password,
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
                           final user= await auth.SignUpUser(email.text, password.text);
              if( user != null){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
              }else{
                AlertDialog(

                );
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
                      Text("Already Have an account? "),
              TextButton(onPressed: (){}, child: Text("Login",style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width*0.05,
              ),)),
                    ],
                  ),
                ],
              )),


            ],
          )
        ],
      ),*/
  @override
  Widget build(BuildContext context) {
    /*return Scaffold(
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("SignUp",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: MediaQuery.of(context).size.width*0.1
          ),),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: TextField(
              controller: name,
              decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
            ),
            child: TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: () async{
              final user= await auth.SignUpUser(email.text, password.text);
              if( user != null){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
              }else{
                AlertDialog(

                );
              }

          }, child: Text("SIGNUP")),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already Have an account? "),
              TextButton(onPressed: (){}, child: Text("Login",style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width*0.05,
              ),)),
            ],
          )
        ],
      ),
    );*/
    return Scaffold(

      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('images/signupcover.png',fit: BoxFit.none,color: Colors.blue.withAlpha(100),),
          Positioned(
              top: 10,
              child: IconButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
              }, icon: Icon(Icons.arrow_back))
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 2,child: Image.asset('images/signup_bannerArt.png',scale: 3,)),
              Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text("SIGNUP",style: TextStyle(
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
                          controller:name ,
                          decoration: InputDecoration(
                              filled: true,
                              hintText: "Name",
                              label: Text("Name"),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Padding(
                        padding: EdgeInsets.only(
                          left:MediaQuery.of(context).size.width<1000?MediaQuery.of(context).size.width*0.1:MediaQuery.of(context).size.width*0.3,
                          right:MediaQuery.of(context).size.width<1000?MediaQuery.of(context).size.width*0.1:MediaQuery.of(context).size.width*0.3,
                          bottom: 10,
                        ),
                        child: TextField(
                          style: ShadowStyles(),
                          controller: email,
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
                          controller: password,
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
                            final user= await auth.SignUpUser(email.text, password.text);
                            if( user != null){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNav()));
                            }else{
                              AlertDialog(

                              );
                            }
                          },
                          child: Text("Register",
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height*0.02,

                            ),
                          )
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already Have an account? "),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          }, child: Text("Login",style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width*0.02,
                          ),)),
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