import 'package:flutter/material.dart';
import 'package:tic_toe_game/siana_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade50,
        leading: Container(
          padding: EdgeInsets.all(10),
          child: const CircleAvatar(
            radius: 10,
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            backgroundImage: AssetImage('assets/account.png'),
          ),
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 32, 97, 151), width: 2.5),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
            margin: const EdgeInsets.only(right: 10),
            child: const Text("Username"),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.green.shade50,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Its Starts Here.",
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Fira Sans',
                  color: Color.fromARGB(255, 21, 82, 132)),
            ),
            TextFormField(
              decoration:  InputDecoration(
                  icon: Icon(Icons.mic),
                  fillColor: Colors.yellow,
                  labelStyle: TextStyle(color: Colors.black),
                  hintText: 'Who is the Oldest livig person?',
                  suffixIcon: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SianaScreen()));
                    },
                    child: Icon(Icons.search,)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 32, 97, 151), width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(40)))),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text(
                    "Coding",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text("Photo Editor",
                      style: TextStyle(color: Colors.blue)),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text(
                    "Video Editor",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  padding: const EdgeInsets.fromLTRB(30, 8, 30, 8),
                  margin: const EdgeInsets.only(right: 10),
                  child: const Text("Doc Editor",
                      style: TextStyle(color: Colors.blue)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
