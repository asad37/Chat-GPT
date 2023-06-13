import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tic_toe_game/GPTModel.dart';

import 'Login_form.dart';

class SianaScreen extends StatefulWidget {
  const SianaScreen({super.key});

  @override
  State<SianaScreen> createState() => _SianaScreenState();
}

class _SianaScreenState extends State<SianaScreen> {
  
  var msg = "";
  TextEditingController textController = TextEditingController();
  bool isLoading = false;
  User? user=FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade50,
        leading: Container(
          padding: const EdgeInsets.all(10),
          child: const CircleAvatar(
            radius: 10,
            backgroundColor: Color.fromARGB(0, 0, 0, 0),
            backgroundImage: AssetImage('assets/asad.jpeg'),
          ),
        ),
        title: GestureDetector(
          onTap: ()  { 
            FirebaseAuth.instance.signOut().then((value) {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginForm()));
          });},
          child: Icon(Icons.logout)),
        actions: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 32, 97, 151), width: 2.5),
                borderRadius: const BorderRadius.all(Radius.circular(30))),
            padding: const EdgeInsets.fromLTRB(15, 3, 15, 3),
            margin: const EdgeInsets.only(right: 10),
            child:  Text(user?.email??""),
          )
        ],
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.green.shade50,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Try ",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Fira Sans',
                            color: Color.fromARGB(255, 21, 82, 132)),
                      ),
                      Text(
                        "Hey ",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Fira Sans',
                            color: Colors.amber),
                      ),
                      Text(
                        "Siena",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'Fira Sans',
                            color: Color.fromARGB(255, 21, 82, 132)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                        disabledBorder: OutlineInputBorder(),
                        fillColor: Colors.yellow,
                        labelStyle: const TextStyle(color: Colors.black),
                        hintText: 'Who is the Oldest livig person?',
                        suffixIcon: InkWell(
                            onTap: () async {
                              setState(() {
                                isLoading=true;
                              });
                              var controller = textController.text.trim();
                              var gptModel = await getData(controller);

                              //navigate to next page and pass data ,data.choices.first.text1

                              setState(() {
                                msg = gptModel?.choices.first.text ??
                                    "Nothing yet";
                                isLoading=false;

                              });
                            },
                            child: const Icon(Icons.send)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 32, 97, 151),
                                width: 1.0),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SingleChildScrollView(
                    child: Column
                    (
                      children:[ Center(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration:
                              BoxDecoration(color: Colors.green.shade50),
                          child: Text(msg,style: TextStyle(fontSize: 15,color: Colors.green),),
                        ),
                      ),
                                  ]),
                  )
                ],
              ),
            ),
          ),
    );
  }

  Future<GptModel?> getData(String prompt) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer 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'
    };
    var request = http.Request(
        'POST', Uri.parse('https://api.openai.com/v1/completions'));
    request.body = json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      "max_tokens": 800,
      "temperature": 0
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      // print(jsonDecode(res));
      return GptModel.fromJson(jsonDecode(res));
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }
}
