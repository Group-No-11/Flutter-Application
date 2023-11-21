import 'package:flutter/material.dart';

class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "space app",
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 203, 230, 248),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "How to use Skin Scanner ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.asset(
                    "assets/m1.png",
                    height: 250,
                    scale: 2,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Take a photo*",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Keep zoomed at the closet distance (less than 10 cm), keep in focus and center only the skin mark.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                Center(
                    child: Image.asset(
                  "assets/m2.png",
                  height: 300,
                  scale: 2,
                )),

                const Text(
                  "Identify and send",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),

                const Text(
                  "Send your photo to the Artificial Intelligence. The system will analyze it and send you a result",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),

                Center(
                  child: Image.asset(
                    "assets/m3.png",
                    height: 300,
                    scale: 2,
                  ),
                ),

                const Text(
                  "Receive your risk assessment **",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "Get the result within 60 seconds and related advice on the next steps to take.",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),

                const SizedBox(
                  height: 25,
                ),

                //Footer
                const SizedBox(
                  height: 25,
                ),

                Container(
                  height: 2,
                  width: 500,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(77, 10, 10, 10)),
                ),

                const SizedBox(
                  height: 10,
                ),

                const Text(
                  "You can take a photo on your mobile phone or upload a photo from your computer. We will provide 80% - 90% accuracy depending on the image",
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
