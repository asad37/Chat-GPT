import 'package:google_sign_in/google_sign_in.dart';
class googleSignIn{
  SignInWithGoogle()async{
    await GoogleSignIn().signOut();
final GoogleSignInAccount? gUser=await GoogleSignIn().signIn();
if (gUser != null) {
      final GoogleSignInAuthentication gAuth = await gUser.authentication;
      if (gAuth.idToken != null) {
        print("${gAuth.idToken}");
        print("${gAuth.accessToken}");
        return true;
      }
    }
  }
}