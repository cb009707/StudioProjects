

import 'package:firebase_auth/firebase_auth.dart';

class auth{

  final _auth = FirebaseAuth.instance;
  Future<User?> createUserWithEmailAndPassword(String email,String pass)
  async{
    try{
      final info = await _auth.createUserWithEmailAndPassword(email:email,password: pass);
      return info.user;
    }
    catch(e){
      print("wrong");
    }
    return null;
  }

  Future<User?> loginUserWithEmailAndPassword(String email,String pass)
  async{
    try{
      final info = await _auth.signInWithEmailAndPassword(email:email,password: pass);
      return info.user;
    }
    catch(e){
      print("wrong");
    }
    return null;
  }

  Future<void> signOut()async{
    try {
     await _auth.signOut();
    }catch(e)
    {
      print("wrong");
    }
  }

}