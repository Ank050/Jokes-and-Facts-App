import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FactScreen extends StatefulWidget {
  const FactScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FactScreenState createState() => _FactScreenState();
}

class _FactScreenState extends State<FactScreen> {
  final ButtonPress buttonPress = ButtonPress();
  String? fact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
          width: 10,
          height: 10,
          child: Image.asset(
            "assets/images/earth.png",
            fit: BoxFit.contain,
          ),
        ),
        title: const Text(
          "MR FACT",
          style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 144, 255, 59),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 40),
              child: Center(
                child: Text(
                  "To generate some interesting facts, please press the button below! Get ready to expand your knowledge and learn something new.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final String newFact = await buttonPress.getFact();
                        setState(() {
                          fact = newFact;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 25),
                        backgroundColor: Color.fromARGB(255, 50, 245, 1),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text(
                        'Get Fact',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    if (fact != null)
                      Center(
                        child: Container(
                          height: 300,
                          width: 450,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromARGB(255, 133, 245, 120),
                              width: 3,
                            ),
                            color: Color.fromARGB(255, 197, 243, 185),
                          ),
                          margin: const EdgeInsets.only(top: 70),
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              fact!,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontFamily: "Roboto",
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonPress {
  Future<String> getFact() async {
    const limit = 1;
    const apiURL = 'https://api.api-ninjas.com/v1/facts?limit=$limit';
    final response = await http.get(Uri.parse(apiURL),
        headers: {'X-Api-Key': 'hLNwH+ZEK1VLGJLM2s9vlw==PFTXCCCr3nFIgBZt'});

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json[0]['fact'];
    } else {
      throw Exception('Failed to load fact');
    }
  }
}
