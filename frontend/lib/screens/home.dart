import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:login_signup/screens/detail.dart';
import 'package:login_signup/screens/profile.dart';
import 'package:login_signup/screens/result.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationExample(),
    );
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationExampleState createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(initializeCamera: true), // Set initializeCamera to false
    const HowItWorksScreen(),
    const ProfileScreen(name: 'name', reg: 'reg', email: 'email',),
    // const ResultScreen(
    //   result: '',
    //   image: File(''),
    // ),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skin Scanner'),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Color.fromARGB(255, 68, 94, 243),
          ),
          onPressed: () {},
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 2, 51, 150),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 2, 51, 150),
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: const Color.fromARGB(255, 105, 154, 245),
            gap: 4,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(icon: Icons.settings, text: 'How it work'),
              GButton(icon: Icons.person, text: 'Profile'),
              // GButton(icon: Icons.search, text: 'Resuilt'),
            ],
            selectedIndex: _currentIndex,
            onTabChange: _onTabTapped,
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.initializeCamera})
      : super(key: key);

  final bool initializeCamera;

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CameraController? _controller;
  List<CameraDescription> cameras = [];

  @override
  void initState() {
    super.initState();
    availableCameras().then((value) {
      cameras = value;
      if (cameras.isNotEmpty && widget.initializeCamera) {
        _initializeCamera(cameras[0]);
      }
    });
  }

  Future<void> _initializeCamera(CameraDescription camera) async {
    _controller = CameraController(camera, ResolutionPreset.medium);
    await _controller!.initialize();
    if (!mounted) {
      return;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePhoto() async {
    try {
      final XFile file = await _controller!.takePicture();
      // Handle the taken photo, e.g., save or display it.
      // Send the photo to the AI model
      _sendImageToAI(File(file.path));
      // ignore: avoid_print
      print('Photo taken: ${file.path}');
    } catch (e) {
      // ignore: avoid_print
      print('Error taking photo: $e');
    }
  }

  Future<void> _choosePhoto() async {
    final imagePicker = ImagePicker();
    final XFile? image =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      // Handle the chosen photo, e.g., display it.
      // Send the photo to the AI model
      _sendImageToAI(File(image.path));
      // ignore: avoid_print
      print('Photo chosen: ${image.path}');
    }
  }

  Future<void> _sendImageToAI(File imageFile) async {
    // Replace 'YOUR_AI_MODEL_API_URL' with the actual URL of your AI model API
    const apiUrl = 'http://10.0.2.2:8080/predict';

    try {
      var request = http.MultipartRequest('POST', Uri.parse(apiUrl));
      request.files
          .add(await http.MultipartFile.fromPath('file', imageFile.path));

      var response = await request.send();

      if (response.statusCode == 200) {
        var jsonResponse = json.decode(await response.stream.bytesToString());
        // Process the AI model response as needed
        // ignore: avoid_print
        print(jsonResponse);
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              // imageFile: imageFile,
              result: jsonResponse['class'],
              image: File(imageFile.path),
              confidence: jsonResponse['confidence'].toString(),
            ),
          ),
        );
      } else {
        // Handle error
        // ignore: avoid_print
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      // ignore: avoid_print
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: _controller != null
                ? CameraPreview(_controller!)
                : const Center(child: CircularProgressIndicator()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _takePhoto,
                child: const Text('Take Photo'),
              ),
              ElevatedButton(
                onPressed: _choosePhoto,
                child: const Text('Choose Photo'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
