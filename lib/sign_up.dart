import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tic_toe_game/Login_form.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.fromLTRB(0, 0, 5, 60),
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
                  controller: userController,
                  decoration: const InputDecoration(
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 48, 115, 170)),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.verified_user),
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: phoneController,
                  decoration: const InputDecoration(
                      labelText: 'Phone',
                      prefixIcon: Icon(Icons.phone),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 48, 115, 170)),
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  keyboardType:TextInputType.emailAddress,
                  controller: emailController,
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 48, 115, 170)),
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                const SizedBox(
                  height: 13,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.visibility),
                      prefixIcon: Icon(Icons.password),
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 48, 115, 170)),
                      contentPadding: EdgeInsets.all(8),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.5),
                          borderRadius: BorderRadius.all(Radius.circular(50)))),
                ),
                const SizedBox(
                  height: 13,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(50, 15, 50, 15),
                        backgroundColor: Colors.green.shade50,
                        side: const BorderSide(color: Colors.blue, width: 2.5)),
                    onPressed: () async {
                     
                      var email = emailController.text.trim();
                      var password = passwordController.text.trim();
                      var phone = phoneController.text.trim();
                      var username = userController.text.trim();
                      User? user=FirebaseAuth.instance.currentUser;
                      try {
                       await  FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: email, password: password);
                            
                               Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginForm()));
                          print("User Authenticate");
                           var snackbar = SnackBar(
                          content: Text(
                            "Sign Up Successfully",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          shape: StadiumBorder(),
                          backgroundColor: Colors.grey,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                       await FirebaseFirestore.instance.collection("Chat GPT").doc(user?.uid).set({
                              'Username':username,
                              'Phone':phone,
                              'Email':email,
                              'Password':password
                       }) ;
                      } on FirebaseAuthException catch (e) {
                        print(e);
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
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'Fira Sans',
                          color: Color.fromARGB(255, 10, 98, 169)),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
