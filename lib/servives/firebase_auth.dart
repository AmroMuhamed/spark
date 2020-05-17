
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future signup( String email,String password )async{
    try{
      AuthResult result =await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user=result.user;

      print(user.uid.toString());
      return true;
    } catch(e){
      print(e);
      return false ;
    }
  }


  Future  signInWithEmail(String email, String password) async{
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email,password: password);
      FirebaseUser user = result.user;
      if(user != null) {

        print('done');
        return true;
      }
      else {
        print('error');
        return false;
      }

    } catch (e) {
      print(e)
;
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("error logging out");
    }
  }

}