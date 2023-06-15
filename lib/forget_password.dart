import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tic_toe_game/Login_form.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailContrller = TextEditingController();
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
                  height: 30,
                ),
                TextFormField(
                  controller: emailContrller,
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
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(25, 7, 25, 7),
                        backgroundColor: Colors.green.shade50,
                        side: BorderSide(color: Colors.blue, width: 2.5)),
                    onPressed: () async {
                      try {
                        var email = emailContrller.text.trim();

                        await FirebaseAuth.instance
                            .sendPasswordResetEmail(email: email)
                            .then((value) {
                          print("Email Send Successfully");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginForm()));
                        });
                      } on FirebaseAuthException catch (e) {
                        SnackBar snackBar = SnackBar(
                          content: Text(
                            "${e.message}",
                            style: TextStyle(
                                fontFamily: 'Fira Sans',
                                fontSize: 18,
                                color: Colors.red),
                          ),
                          shape: StadiumBorder(),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text(
                      "Send Password",
                      style: TextStyle(
                          fontSize: 27,
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
