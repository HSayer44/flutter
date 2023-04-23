// ignore_for_file: unnecessary_null_comparison

import 'package:chat_app/helper/helper_function.dart';
import 'package:chat_app/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //Login
  Future loginWithUserNameandPassword(String email, String password)async{

    try {

      User user = (await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password))
        .user!;
      
      if(user!=null){
        return true;
      }

    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }


  //register
  Future registerUserWithEmailandPassword(String fullName, String email, String password)async{

    try {

      User user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password))
        .user!;
      
      if(user!=null){
        await DatabaseService(uid: user.uid).savingUserData(fullName, email);
        return true;
      }

    } on FirebaseAuthException catch (e){
      return e.message;
    }
  }


  //signout
  Future signOut()async {
    try {
      await HelperFunction.saveUserLoggedInStatus(false);
      await HelperFunction.saveUserEmailSF("");
      await HelperFunction.saveUserNameSF("");
      await firebaseAuth.signOut();
    } catch (e) {
      return null;
    }
  }

}