import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_toe_game/forget_password.dart';
import 'package:tic_toe_game/services/google_signIn.dart';
import 'package:tic_toe_game/siana_screen.dart';
import 'package:tic_toe_game/sign_up.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  User? user;
  LoginForm(String username){}
  // void initState() {
  //   super.initState();
  //   user=FirebaseAuth.instance.currentUser;
  // }
  TextEditingController emailContrller = TextEditingController();
  TextEditingController passwordContrller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.fromLTRB(0, 0, 5, 60),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text(
                      "Welcome,",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Fira Sans',
                          color: Color.fromARGB(255, 58, 10, 88)),
                    ),
                    Text(
                      " Educators,",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Fira Sans',
                          color: Color.fromARGB(255, 48, 93, 129)),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Researchers,",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Fira Sans',
                          color: Colors.green),
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Designers,",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Fira Sans',
                          color: Color.fromARGB(255, 58, 10, 88)),
                    ),
                    Text(
                      " and, ",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Fira Sans',
                          color: Color.fromARGB(255, 48, 93, 129)),
                    )
                  ],
                ),
                const Row(
                  children: [
                    Text(
                      "Coders",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Fira Sans',
                          color: Colors.amber),
                    ),
                    Text(
                      ".",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Fira Sans',
                          color: Color.fromARGB(255, 58, 10, 88)),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: emailContrller,
                  decoration: const InputDecoration(
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 48, 115, 170)),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                SizedBox(
                  height: 13,
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordContrller,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: Icon(Icons.visibility),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 48, 115, 170)),
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                SizedBox(
                  height: 13,
                ),
                SizedBox(
                  height: 13,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                        backgroundColor: Colors.green.shade50,
                        side: BorderSide(color: Colors.blue, width: 2.5)),
                    onPressed: () async {
                      var email = emailContrller.text.trim();
                      var password = passwordContrller.text.trim();

                      try {
                        var user = await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: email, password: password);  
                        if(user.user!=null){
                          user.user?.uid;   
                           SharedPreferences? sharedPreferences = await SharedPreferences.getInstance();
                            await sharedPreferences.setString('uid', user.user?.uid??"");
                            await sharedPreferences.setString('email', user.user?.email??"");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SianaScreen()));
                           var snackbar = SnackBar(
                          content: Text(
                            "Login Successfully",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          shape: StadiumBorder(),
                          backgroundColor: Colors.grey,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                        
                       
                      }on FirebaseAuthException catch (e) {
                        var snackbar = SnackBar(
                          content: Text(
                            "${e.message}",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          shape: StadiumBorder(),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Fira Sans',
                          color: Color.fromARGB(255, 10, 98, 169)),
                    )),
                  GestureDetector(
                    onTap: ()async{
                      bool isSuccess=await googleSignIn().SignInWithGoogle();
                      if(isSuccess==true){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const SianaScreen()));
                      }

                    },
                    child: Card(
                      child: Container(child: Row(children: [
                       Image.asset("assets/google_icon.png",width: 50,height: 50,),
                       Text("Sign In with Google",style: TextStyle(fontSize: 17),)
                        
                      ],)),
                    ),
                  ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Card(
                    child: Container(
                      color: Colors.green.shade50,
                      child: Text("Don't have an Account Sign Up"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPassword()));
                  },
                  child: Card(
                      child: Container(
                          color: Colors.green.shade50,
                          child: Text("Forgot Password"))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
