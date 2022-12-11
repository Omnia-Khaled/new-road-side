import 'package:flutter/material.dart';
import 'package:login_regiester_profile/modules/mapScreen.dart';
import 'package:login_regiester_profile/modules/signUp-choice.dart';
import 'login_choose.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
          title: const Center(
            child: Text('RoadSide Assistance',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Serif',color: Colors.white)),),
          backgroundColor: Colors.indigo,
    ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Image(image: AssetImage('assets/CarServices.png'),width: 270,),
          const SizedBox(height: 30,),
          GestureDetector(
            onTap: () {Navigator.of(context).push(
              MaterialPageRoute(builder: (context)=>const LoginChoose(),

              ),
            );
              },
            child: Center(
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.indigo, width: 4),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.indigo
                ),


                child: const Center(
                  child:  Text('Login',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Serif',color: Colors.white)),
                ),

              ),
            ),
          ),

          const SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=>const SignUpChoose(),

                ),
              );
            },
            child: Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.indigo, width: 4),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),


              child: const Center(
                child: Text('Sign Up',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Serif',color: Colors.indigo),
                ),
              ),

            ),
          ),
        ],
      ),
    );

  }
}
