import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            const Text(
              'Dr. John Doe',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Register Number: XXX-XXXX',
              style: TextStyle(fontSize: 16),
            ),

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
