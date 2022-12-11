import 'package:flutter/material.dart';
import 'Phone_Login.dart';
import 'Registration.dart';

class SignUpChoose extends StatefulWidget {
  const SignUpChoose({Key? key}) : super(key: key);

  @override
  State<SignUpChoose> createState() => _SignUpChooseState();
}

class _SignUpChooseState extends State<SignUpChoose> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.white,
      appBar: AppBar(
          title: const Text('Sign Up',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Serif',color: Colors.white)),
          backgroundColor: Colors.indigo,
          ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Image(image: AssetImage('assets/Signup.png'),width: 270,),
            const SizedBox(height: 20,),
            const Text('Sign Up With:',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Serif',color: Colors.indigo)),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>const PhoneScreen(),

                  ),
                );
              },
              child:  Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  border: Border.all(color: Colors.indigo,width: 4),
                  borderRadius: BorderRadius.circular(20),
              ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.phone_android_rounded,color: Colors.white,size: 30,),
                    SizedBox(width: 10,),
                  Text('Phone Number',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Serif',color: Colors.white)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){ Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>const Register(),

                ),
              );},
              child:  Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo,width: 4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.email_outlined,color: Colors.indigo,size: 30,),
                    SizedBox(width: 10,),
                    Text('E-Mail',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Serif',color: Colors.indigo)),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );

  }
}

