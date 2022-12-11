import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_regiester_profile/modules/provider%20screen.dart';
import '../components/components.dart';
import '../cubit/cubit.dart';
import 'first_page.dart';

class DrawerPart extends StatelessWidget
{
  const DrawerPart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    SignOut()async{
      FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const FirstPage(),
        ),
      );
    }
    var cubit = LocationCubit.get(context);
    return Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                accountName: Text('admin'),
                accountEmail: Text('admin@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Text(
                    'A',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                )),
            buildDrawerItem(
                cubit.screensByDrawer, cubit.drawerIcons, context),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProviderScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),),
                  child: Text('Provider mode')),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 226, 10,0),
                child: GestureDetector(
                    onTap: () {
                      SignOut();
                    },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.logout_sharp,color: Colors.indigo,size: 30,),
                          SizedBox(width: 25,),
                          Text('Log Out',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    )),
              ),

          ],
        ));
  }
}
