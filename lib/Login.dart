import 'package:flutter/material.dart';
import 'TodoApp.dart';

class Login_Page extends StatefulWidget{
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login_Page>{
  late String emailAddress;
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context){
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1C1B33), // Dark purple shade
                    Color(0xFF3E0E56),
                    Color(0xFF1C1B33)// Deep violet shade
                  ],
                ),
              ),
             child:Column(
                mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 200,
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //         image: AssetImage("assets/background.jpg"),
                  //         fit: BoxFit.cover
                  //     )
                  // ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child:Center(
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Text("Let's Connect With Us!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),),
                          Form(
                              key: _formKey,
                              child: Column(
                                  children: [
                                    SizedBox(height: 60,),
                                    TextFormField(
                                      style: TextStyle(
                                          color: Colors.white,
                                        fontSize: 20
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          hintText: "abc@gmail.com",
                                          labelText: "Email Address",
                                          labelStyle: TextStyle(
                                            color: Colors.white, // Label color
                                            fontSize: 18,
                                          ),
                                          hintStyle: TextStyle(
                                            color: Colors.grey, // Hint text color
                                            fontSize: 16,
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1, color:Colors.white),
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1, color: Colors.white)
                                          )
                                      ),
                                      validator: (value){
                                        if( value == null || value.isEmpty){
                                          return "Email Adress cannot be Empyt";
                                        }
                                        if(!RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$').hasMatch(value)) {
                                          return "Enter a valid email";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 20,),
                                    TextFormField(
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20
                                      ),
                                      obscureText: true,
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: InputDecoration(
                                          hintText: "*******",
                                          labelText: ("Password"),
                                          labelStyle: TextStyle(
                                            color: Colors.white, // Label color
                                            fontSize: 18,
                                          ),
                                          hintStyle: TextStyle(
                                            color: Colors.grey, // Hint text color
                                            fontSize: 16,
                                          ),
                                          suffixIcon: Icon(Icons.remove_red_eye, color: Colors.white,),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1, color:Colors.white),
                                              borderRadius : BorderRadius.circular(10)
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(width: 1, color: Colors.white)
                                          )
                                      ),
                                      validator: (value){
                                        if(value == null ||value.isEmpty ){
                                          return "Password must be filled";
                                        }
                                        if(value.length < 6){
                                          return "Password must be atleast 6 characters";
                                        }
                                        return null;

                                      },
                                    ),
                                    SizedBox(height: 40,),
                                    TextButton(
                                      onPressed: () => {
                                        if(_formKey.currentState!.validate()){
                                          Navigator.push(context,MaterialPageRoute(builder: (context) => TodoApp()))
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Color(0xFF6246E3),
                                          padding: EdgeInsets.all(5),
                                          minimumSize : Size(410, 30),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(40)
                                          )
                                      ),
                                      child : Text("Login",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                    ),
                                    Row(
                                      children: [
                                        Expanded(child: Divider(
                                          height: 80,
                                          color: Colors.grey,
                                          thickness: 1,
                                        )),
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                          child:Text(
                                              "or", style: TextStyle(fontSize: 15, color: Colors.white)
                                          ),
                                        ),

                                        Expanded(child: Divider(
                                          height: 80,
                                          color: Colors.grey,
                                          thickness: 1,
                                        )),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () => {print("Sign Up With Apple")},
                                        style: TextButton.styleFrom(
                                            foregroundColor: Colors.white,
                                            backgroundColor: Colors.black,
                                            padding: EdgeInsets.all(5),
                                            minimumSize : Size(410, 30),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(40)
                                            )
                                        ),
                                        child:Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.apple, color: Colors.white,size: 40,),
                                            SizedBox(width: 20,),
                                            Text("Sign Up With Apple", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
                                          ],
                                        )
                                    ),
                                    SizedBox(height: 20,),
                                    TextButton(
                                      onPressed: () => {"Sign Up With Google"},
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black,
                                          padding: EdgeInsets.all(5),
                                          minimumSize: Size(410, 30),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(40),
                                              side: BorderSide(color: Colors.grey, width: 2)
                                          )
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(width: 10,),
                                          Image.asset('assets/googleIcon.png', height: 35),
                                          SizedBox(width: 20,),
                                          Text(
                                            "Sign Up With Google",
                                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 30,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Don't have an account? ", style: TextStyle(fontSize: 15, color: Colors.white),),
                                        InkWell(
                                            onTap: () => "Sign In Tapping",
                                            child: Text(" Sign up", style: TextStyle(color:Color(0xFF6246E3), fontWeight: FontWeight.w900, fontSize: 15),)
                                        ),
                                      ],
                                    )
                                  ]
                              ))
                        ],

                      )
                  ),
                ),
                SizedBox(height: 100,)
              ],
            )
          )
    )
    );

  }
}
