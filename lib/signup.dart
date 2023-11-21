// ignore_for_file: avoid_print, body_might_complete_normally_nullable, avoid_web_libraries_in_flutter, non_constant_identifier_names, unused_import, unused_field

import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:frontend/login.dart';
import 'package:frontend/model/Signup_model.dart';
import 'package:frontend/model/config.dart';
import 'package:http/http.dart' as http;

// import 'package:flutter/services.dart';
// import 'package:frontend/login.dart';
// import "package:http/http.dart as http";

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  // ignore: no_logic_in_create_state, library_private_types_in_public_api
  State<SignupPage> createState() => _SignupPageState();
}

// ignore: must_be_immutable
class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController regController = TextEditingController();
  bool _isNotValidate = false;
  
  // get http => null;



  void RegisterUser() async {
    if (nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        cpasswordController.text.isNotEmpty &&
        roleController.text.isNotEmpty &&
        regController.text.isNotEmpty ) {
      var regBody = {
        "name": nameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "cpassword": cpasswordController.text,
        "role": roleController.text,
        "reg": regController.text
      };

      try {
        var response = await http.post(
          Uri.parse(registration),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody),
        );

        var jsonResponse = jsonDecode(response.body);

        if (response.statusCode == 200) {
          // Registration successful
          print('Registration successful: $jsonResponse');

          Navigator.push(
              context as BuildContext, MaterialPageRoute(builder: (context) => LoginPage()));
        } else {
          // Registration failed
          print('Registration failed: $jsonResponse');

          // Handle the error as needed
        }
      } catch (error) {
        // Handle other errors (e.g., network error)
        print('Error during registration: $error');
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

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
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        "Sign up",
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
                        "Create an account, It's free ",
                        style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter name';
                            }
                          },
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.man,
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Name',
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
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: roleController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Role';
                            }
                          },
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.man_3,
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Your Role',
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
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: regController,                       
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Your Registration Number';
                            }
                          },
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.numbers,
                                color: Colors.blue,
                              ),
                              hintText: 'Enter Your Reg. No',
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
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller: emailController,
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
                              passwordController,
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
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          controller:
                              cpasswordController, 
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
                              hintText: 'Conform Password',
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
                          RegisterUser();
                          print("Button Pressed!"); 
                        },
                        color: const Color(0xff0095FF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          "Signup",
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
                                "Already have Account ? ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                },
                                child: const Text(
                                  "Signin",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ))
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
