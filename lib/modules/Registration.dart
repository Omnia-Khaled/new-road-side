import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_regiester_profile/firebase/firebase_auth.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final nameController=TextEditingController();
  final phoneController =TextEditingController();
  final confPasswordController =TextEditingController();
  final carTypeController =TextEditingController();
  final carModelController = TextEditingController();
  final licController =TextEditingController();

  final registerKey =GlobalKey<FormState>();

  final focusName=FocusNode();
  final focusEmail =FocusNode();
  final focusPassword=FocusNode();
  final focusConfPassword=FocusNode();
  final focusPhone =FocusNode();
  final focusLic =FocusNode();
  final focusCarType = FocusNode();
  final focusCarModel = FocusNode();

  bool _passwordVisible = false;
  bool _confPasswordVisible = false;

  void SignUpUser()async{
    FireAuth(FirebaseAuth.instance).signUpWithEmailPassword(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        confPassword: confPasswordController.text,
        carModel: carModelController.text,
        carType: carTypeController.text,
        licence: licController.text,
        context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        focusName.unfocus();
        focusEmail.unfocus();
        focusPassword.unfocus();
        focusPhone.unfocus();
        focusLic.unfocus();
        focusConfPassword.unfocus();
        focusCarModel.unfocus();
        focusCarType.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Register',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Serif',color: Colors.white)),
            backgroundColor: Colors.indigo,
            ),
        backgroundColor: Colors.white,
        body: ListView(

          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Image(image: AssetImage('assets/SignupEmail.png'),height:150,width: 300,),
                ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: TextFormField(
                controller: nameController,
                focusNode: focusName,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(12)
                  ),
                    hintText: "Name",
                  hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.grey),
                    focusedBorder: OutlineInputBorder(borderSide:
                    const BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: Colors.grey.shade100,
                    filled: true,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: TextFormField(
                controller: phoneController,
                focusNode: focusPhone,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  hintText: "Phone Number",
                  hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.grey),
                  focusedBorder: OutlineInputBorder(borderSide:
                  const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12)),
                  fillColor: Colors.grey.shade100,
                  filled: true,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: TextFormField(
                controller: emailController,
                focusNode: focusEmail,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  hintText: "Email",
                  hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.grey),
                  focusedBorder: OutlineInputBorder(borderSide:
                  const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12)),
                  fillColor: Colors.grey.shade100,
                  filled: true,

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: TextFormField(
                controller: passwordController,
                focusNode: focusPassword,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                    hintText: "Password",
                  hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      focusedBorder: OutlineInputBorder(borderSide:
                      const BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.grey.shade100,
                      filled: true,


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

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: TextFormField(
                controller: confPasswordController,
                focusNode: focusConfPassword,
                obscureText: !_confPasswordVisible,
                decoration: InputDecoration(
                    hintText: "Confirm Password",
                  hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    focusedBorder: OutlineInputBorder(borderSide:
                    const BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(12)),
                    fillColor: Colors.grey.shade100,
                    filled: true,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _confPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.indigo,
                      ),
                      onPressed: () {
                        setState(() {
                          _confPasswordVisible = !_confPasswordVisible;
                        });
                      },
                    ),


                ),
              ),
            ),
            Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 5),
                  child: TextFormField(
                    controller: carTypeController,
                    focusNode: focusCarType,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: "Car Type",
                      hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.grey),
                      focusedBorder: OutlineInputBorder(borderSide:
                      const BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.grey.shade100,
                      filled: true,

                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 10, 15, 5),
                  child: TextFormField(
                    controller: carModelController,
                    focusNode: focusCarModel,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      hintText: "Car Model",
                      hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.grey),
                      focusedBorder: OutlineInputBorder(borderSide:
                      const BorderSide(color: Colors.indigo),
                          borderRadius: BorderRadius.circular(12)),
                      fillColor: Colors.grey.shade100,
                      filled: true,

                    ),
                  ),
                ),
              ),
            ],),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 5),
              child: TextFormField(
                controller: licController,
                focusNode: focusLic,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  hintText: "License",
                  hintStyle: const TextStyle(fontFamily: 'Serif',color: Colors.grey),
                  focusedBorder: OutlineInputBorder(borderSide:
                  const BorderSide(color: Colors.indigo),
                      borderRadius: BorderRadius.circular(12)),
                  fillColor: Colors.grey.shade100,
                  filled: true,

                ),
              ),
            ),
            Row(
              children: [
                Expanded(child: Padding(
                  padding:const EdgeInsets.fromLTRB(60, 0, 60, 5),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),),
                    onPressed:(){
                      SignUpUser();


                    },


                    child:const Text('Sign Up',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Serif',color:Colors.white))

                  ),
                )),
              ],
            )
          ],),
      ),
    );
  }
}

