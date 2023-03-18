import 'package:ankjokesapp/facts.dart';
import 'package:flutter/material.dart';
import 'jokes.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "App",
        home: HomeScreen(),
      ),
    );

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color(0xFF3366FF),
              Color(0xFF00CCFF),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: SizedBox(
            width: 10,
            height: 10,
            child: Image.asset(
              "assets/images/pfp.png",
              fit: BoxFit.contain,
            ),
          ),
          title: const Text(
            "ANKCRAFT050",
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 30,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color.fromARGB(255, 3, 88, 172),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 225, 255),
                      width: 1,
                    ),
                    color: const Color.fromARGB(255, 188, 255, 253),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Get ready to laugh! Press the button below to access our jokes generator page and prepare yourself for an endless supply of hilarious jokes.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const JokesScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 25),
                    backgroundColor: const Color.fromARGB(255, 0, 170, 255),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    'Go To Jokes',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color.fromARGB(255, 0, 255, 234),
                      width: 1,
                    ),
                    color: const Color.fromARGB(255, 188, 252, 255),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child: Text(
                      "Expand your knowledge with just a click! Press the button below to access our facts generator page and discover fascinating facts on a variety of topics.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FactScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 25),
                    backgroundColor: const Color.fromARGB(255, 4, 163, 255),
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    'Go To Facts',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
