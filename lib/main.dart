import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const TestScreen());
}

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.yellow,
      ),
      title: 'This is a test app',
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ButtonPress buttonPress = ButtonPress();
  String? joke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(
            width: 10,
            height: 10,
            child: Image.asset(
              "assets/images/lol.png",
              fit: BoxFit.contain,
            )),
        title: const Text(
          "MR DAD",
          style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontFamily: "Roboto",
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 5, right: 5, top: 40),
              child: Text(
                "Are you ready for a good laugh? Click the button below to generate a hilarious dad joke that will have you rolling on the floor laughing!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final String newJoke = await buttonPress.getJoke();
                        setState(() {
                          joke = newJoke;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 25),
                        backgroundColor: const Color.fromARGB(255, 236, 245, 1),
                        textStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text(
                        'Get Joke',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    if (joke != null)
                      Center(
                        child: Container(
                          height: 300,
                          width: 450,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(255, 245, 203, 120),
                              width: 3,
                            ),
                            color: const Color.fromARGB(255, 243, 230, 185),
                          ),
                          margin: const EdgeInsets.only(top: 70),
                          padding: const EdgeInsets.all(10),
                          child: Center(
                            child: Text(
                              joke!,
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
  Future<String> getJoke() async {
    final response = await http.get(
      Uri.parse('https://icanhazdadjoke.com/'),
      headers: {'Accept': 'text/plain'},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load joke');
    }
  }
}
