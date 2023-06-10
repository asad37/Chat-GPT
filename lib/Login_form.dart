import 'package:flutter/material.dart';
import 'package:tic_toe_game/start_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
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
                decoration: const InputDecoration(
                    labelStyle:
                        TextStyle(color: Color.fromARGB(255, 48, 115, 170)),
                    labelText: 'Email',
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.5),
                        borderRadius: BorderRadius.all(Radius.circular(50)))),
              ),
              SizedBox(
                height: 13,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Password',
                     labelStyle:
                        TextStyle(color: Color.fromARGB(255, 48, 115, 170)),
                    contentPadding: EdgeInsets.all(15),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.5),
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
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StartScreen()));
                  },
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fira Sans',
                        color: Color.fromARGB(255, 10, 98, 169)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
