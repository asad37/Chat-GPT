import 'package:flutter/material.dart';
import 'package:tic_toe_game/log_in.dart';
import 'package:tic_toe_game/sign_up.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.fromLTRB(0, 30, 5, 0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
              const Row(children: [ Text(
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
                        color:Color.fromARGB(255, 58, 10, 88)),
                  )
                  ],),
              const SizedBox(
                height: 50,
              ),
             
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(42, 15, 42, 15),
                      backgroundColor: Colors.green.shade50,
                      side: BorderSide(color: Colors.blue, width: 2.5)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fira Sans',
                        color: Color.fromARGB(255, 10, 98, 169)),
                  )
                  ),
                  SizedBox(height: 30,),
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                      backgroundColor: Colors.green.shade50,
                      side: BorderSide(color: Colors.blue, width: 2.5)),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginScreen()));
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fira Sans',
                        color: Color.fromARGB(255, 10, 98, 169)),
                  )
                  )
            ],
          ),
        ),
      ),
    );
  }
}
