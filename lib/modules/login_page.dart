import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_regiester_profile/firebase/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});



  @override
  State<LoginPage> createState() => _LoginPageState();
}
bool _passwordVisible = false;
final emailController = TextEditingController();
final passwordController = TextEditingController();
final focusEmail = FocusNode();
final focusPassword = FocusNode();

class _LoginPageState extends State<LoginPage> {
  void loginUser(){
    FireAuth(FirebaseAuth.instance).signInUsingEmailPassword(email: emailController.text,
        password: passwordController.text,
        context: context);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        focusPassword.unfocus();
        focusEmail.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: const Text('Login With Email',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Serif',color: Colors.white)),
            backgroundColor: Colors.indigo,
            ),
        body:
    SingleChildScrollView(
    child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 40,),
    const Image(image: AssetImage('assets/emailLogin.png'),width: 270,),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                child: TextFormField(
                  controller: emailController,
                  focusNode: focusEmail,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: "Email",
                    hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.indigo),
                    focusedBorder: OutlineInputBorder(borderSide:
                    const BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: Colors.grey.shade100,
                    filled: true,

                  ),
                ),
              ),

              Padding(
    padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                child: TextFormField(
                  controller: passwordController,
                  focusNode: focusPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.indigo),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.indigo,
                      ),
                      onPressed: () {
                        setState(() {
                          _passwordVisible = !_passwordVisible;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(borderSide:
                    const BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: Colors.grey.shade100,
                    filled: true,

                  ),
                ),
              ),
              const SizedBox(height: 15,),
              SizedBox(
                height:50,
                width: 200,
                child: ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.indigo,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(30)),),

    onPressed: (){
                            focusEmail.unfocus();
                            focusPassword.unfocus();
                            loginUser();
                          },
    child:const Padding(
    padding: EdgeInsets.only(left: 15,right: 15,top: 10,bottom: 10),
    child: Text('Login',
    style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Serif',color: Colors.white)),

    ),
    ),
              ),
    ],
    ),
      ),
    ),
    );

      }
    }





