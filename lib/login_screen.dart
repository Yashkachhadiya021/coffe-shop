import 'package:caffee/firebase/auth_service.dart';
import 'package:caffee/sample.dart';
import 'package:caffee/signup_screen.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailcontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background.png'),fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            height: 400,
            width: 300,
            decoration: BoxDecoration(
                color: Colors.brown.withOpacity(0.9),

                borderRadius: BorderRadius.circular(20)
            ),
            child: Center(
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 65, 10, 40),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 270,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: TextFormField(
                              controller: _emailcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                hintText: "Enter email",
                                icon: Icon(Icons.email),
                              ),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 270,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: TextField(
                              controller: _passwordcontroller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none
                                ),
                                hintText: "Enter Password",
                                icon: Icon(Icons.lock),
                              ),),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xFFce8050),
                          ),
                          child: FilledButton(
                              style: FilledButton.styleFrom(backgroundColor: Color(0xFFce8050)),
                              onPressed: () async {
                                final message = await AuthService().login(
                                    email: _emailcontroller.text, password: _passwordcontroller.text);
                                if(message!.contains('Success')) {
                                  print('successfully');
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        Sample(),));
                                }

                              }, child: Text("Login",style: TextStyle(color: Colors.white),)),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Center(child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(),));
                        },
                        child: Text("Signup",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
