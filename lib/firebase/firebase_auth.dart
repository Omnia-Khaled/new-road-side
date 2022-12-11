import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_regiester_profile/firebase/cloud_firestore.dart';
import 'package:login_regiester_profile/utiles/ShowOTPDialog.dart';
import 'package:login_regiester_profile/utiles/showSnackBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../modules/login_page.dart';
import '../modules/mapScreen.dart';

class FireAuth{
  RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$");
  final FirebaseAuth auth;
  FireAuth(this.auth);
  Future<void>signUpWithEmailPassword({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confPassword,
    required String carType,
    required String carModel,
    required String licence,
    required BuildContext context,
})

  async {
    try{
         if(password!=confPassword){showSnackBar(context, 'The password Not Match.');}
    else if (name.isEmpty) {showSnackBar(context, 'Name Can/t be empty');}
    else if (phone.isEmpty) {showSnackBar(context, 'Phone Can/t be empty');}
    else if (email.isEmpty) {showSnackBar(context, 'Email can/t be empty');}
    else if (!emailRegExp.hasMatch(email)) {showSnackBar(context,  'Enter a correct email');}
    else if (password.isEmpty){showSnackBar(context, 'Password Can/t be empty');}
    else if (password.length<8){showSnackBar(context,'Enter a password with length at least 8');}
    else if (carModel.isEmpty) {showSnackBar(context, 'Car Model Can/t be empty');}
    else if (carType.isEmpty) {showSnackBar(context, 'Car Type Can/t be empty');}
    else if (licence.isEmpty) {showSnackBar(context, 'Licence Can/t be empty');}

    else {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      Cloud(FirebaseFirestore.instance).addUserDetials(name, phone, email, carModel, carType, licence);
      showSnackBar(context, "signed up successfully");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage(),
          ),);
    }
    }
    on FirebaseAuthException catch(e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
      }
      else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      }
      else if (e.code == 'notMatch') {
        showSnackBar(context, 'The password Not Match.');
      }
      else {
        showSnackBar(context, e.message!);
      }
    }
    }

  Future<void>signInUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context,
  })
  async{
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => MapScreen(),
        ),
      );
    }
    on FirebaseAuthException catch(e){
      showSnackBar(context, e.message!);
    }
  }
  Future<void>phoneSignIn(
      BuildContext context,
      String phoneNumber,
      )async {
    TextEditingController controller =TextEditingController();
        await auth.verifyPhoneNumber(
  verificationCompleted: (PhoneAuthCredential credential)
  async{
    await auth.signInWithCredential(credential);
},
          verificationFailed: (e){
    showSnackBar(context, e.message!);
    },
    codeSent: ((String verificationId, int? resendingToken) async{
      showOTPDialog(
      context: context,
      controller: controller,
      onPressed: ()async{
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
    smsCode: controller.text.trim()
    );
        await auth.signInWithCredential(credential);
        Navigator.of(context).pop();
    },
    );
    }),
      codeAutoRetrievalTimeout: (String verificationId){

    });

      }

    }
