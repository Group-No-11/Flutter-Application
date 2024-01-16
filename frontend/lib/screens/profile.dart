import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key , required this.name, required this.reg, required this.email});
  final String name;
  final String reg;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 203, 230, 248),
      // appBar: AppBar(
      //   title: const Text('Doctor Profile'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Display Doctor's Profile Photo
            const CircleAvatar(
              backgroundImage: AssetImage('assets/doctor.png'),
              radius: 60,
            ),

            // Display Doctor's Name and Register Number
            // const Text(
            //   name,
            //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            // ),
            // const Text(
              
            //   style: TextStyle(fontSize: 16),
            // ),

            // const Text(
            //   'Email: ',
            //   style: TextStyle(fontSize: 16),
            // ),

            // Button to Edit Details
            ElevatedButton(
              onPressed: () {
                // Implement the edit action here
              },
              child: const Text('Edit Details'),
            ),
          ],
        ),
      ),
    );
  }
}
