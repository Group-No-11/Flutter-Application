// ignore_for_file: unused_import, avoid_print, body_might_complete_normally_nullable, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:frontend/login.dart';
import 'package:frontend/main.dart';
import 'package:frontend/model/Signup_model.dart';
import 'package:frontend/signup.dart';

// import 'package:flutter/services.dart';
// import 'package:frontend/login.dart';
// import 'package:http/http.dart as http';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  get http => null;

  get context => null;
  Future save() async {
    var res = await http
        .post("http://localhost:8080/login", headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8'
    }, body: <String, String>{
      'email': user.email,
      'password': user.password,
    });
    // ignore: avoid_print
    print(res.body);
    Navigator.push(context as BuildContext,
        MaterialPageRoute(builder: (context) => const HomePage()));
  }

  User user = User('', '', '', '', '', '');

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Hello'),
        // ),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - -300,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 35,
                          color: Color.fromARGB(255, 5, 96, 171),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Login to your account ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: TextEditingController(text: user.email),
                          onChanged: (value) {
                            user.email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Email';
                            } else if (RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                              return null;
                            } else {
                              return 'Enter valid email';
                            }
                          },
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Email',
                              enabledBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              errorBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller:
                              TextEditingController(text: user.password),
                          onChanged: (value) {
                            user.password = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Password';
                            }
                          },
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.lock,
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Password',
                              enabledBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              focusedBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.blue)),
                              errorBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                  // borderRadius: BorderRadius.circular(16),
                                  borderSide: BorderSide(color: Colors.red))),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            save();
                          } else {
                            print("Not OK");
                          }
                        },
                        color: const Color(0xff0095FF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Signin",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(95, 20, 0, 0),
                        child: Row(
                          children: [
                            const Text(
                              "Don't have Account ? ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupPage()));
                              },
                              child: const Text(
                                "Signup",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 100),
                        height: 200,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/login.png"),
                              fit: BoxFit.fitHeight),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
