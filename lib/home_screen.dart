import 'package:flutter/material.dart';
import 'package:tic_toe_game/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade50,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(30),
          margin: EdgeInsets.fromLTRB(0, 30, 5, 0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                children: [
                  Text(
                    "Built for,",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fira Sans',
                        color: Color.fromARGB(255, 58, 10, 88)),
                  ),
                  Text(
                    "Teaching,",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fira Sans',
                        color: Colors.teal),
                  )
                ],
              ),
              const Row(
                children: [
                  Text(
                    "Researching,",
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
                    "Designing, ",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fira Sans',
                        color: Color.fromARGB(255, 58, 10, 88)),
                  ),
                  Text(
                    "Coding, ",
                    style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Fira Sans',
                        color: Colors.amber),
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              const Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      "With the power of Chat GPT API, we are on a mission to become the world's most advance engine in the world.",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 5, 87, 154),
                          fontFamily: 'Fira Sans'),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                            backgroundColor: Colors.green.shade50,
                            side: BorderSide(color: Colors.blue, width: 2.5)),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Fira Sans',
                              color: Color.fromARGB(255, 10, 98, 169)),
                        ))
                  ])
            ],
          ),
        ),
      ),
    );
  }
}
