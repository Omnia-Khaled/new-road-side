import 'package:cloud_firestore/cloud_firestore.dart';

class Cloud {
  final FirebaseFirestore cl;
  Cloud(this.cl);
  Future addUserDetials(String name,String phone, String email,String carModel,String carType,String license)async{
    await FirebaseFirestore.instance.collection('users').add({
      'name':name,
      'phone':phone,
      'email':email,
      'carModel':carModel,
      'carType':carType,
      'license':license,

    });
  }
  Future addUserphone(String phone)async{
    final doc =await FirebaseFirestore.instance.collection('users').add({
      'phone':phone,
    });
    final id = doc.id;
    print(id);
  }

}