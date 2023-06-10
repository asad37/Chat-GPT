import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SianaScreen extends StatefulWidget {
  const SianaScreen({super.key});

  @override
  State<SianaScreen> createState() => _SianaScreenState();
}

class _SianaScreenState extends State<SianaScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    var msg = "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade50,
        leading: Container(
          padding: const EdgeInsets.all(10),
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
                  icon: Icon(Icons.search),
                  fillColor: Colors.yellow,
                  labelStyle: const TextStyle(color: Colors.black),
                  hintText: 'Who is the Oldest livig person?',
                  suffixIcon: InkWell(
                      onTap: () async {
                        var controller = textController.text.trim();
                        await getData(controller);
                        //navigate to next page and pass data ,data.choices.first.text
                        setState(() {
                          msg = controller;
                        });
                      },
                      child: const Icon(Icons.send)),
                  enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromARGB(255, 32, 97, 151), width: 0.0),
                      borderRadius: BorderRadius.all(Radius.circular(40)))),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(color: Colors.green.shade50),
                child: Text("Hi, $msg"),
              ),
            )
          ],
        ),
      ),
    );
  }
  getData(String prompt) async {
  var headers = {
    'Content-Type': 'application/json',
    'Authorization':
        'Bearer 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'
  };
  var request =
      http.Request('POST', Uri.parse('https://api.openai.com/v1/completions'));
  request.body = json.encode({
    "model": "text-davinci-003",
    "prompt": prompt,
    "max_tokens": 200,
    "temperature": 0
  });
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var res = await response.stream.bytesToString();
    Map<String, dynamic> myjson = json.decode(res);
  } else {
    print(response.reasonPhrase);
  }
}
}


