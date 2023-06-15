import 'package:google_sign_in/google_sign_in.dart';
class googleSignIn{
  SignInWithGoogle()async{
    GoogleSignIn().signOut();
final GoogleSignInAccount? gUser=await GoogleSignIn().signIn();
if(gUser!=null){

  final GoogleSignInAuthentication gAuth=await gUser.authentication;
  print("$gAuth");
  return true;
}
  }
}