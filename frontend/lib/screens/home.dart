import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup/screens/detail.dart';
import 'package:login_signup/screens/profile.dart';
import 'package:login_signup/screens/search.dart';

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
    const HomeScreen(),
    const HowItWorksScreen(),
    const ProfileScreen(),
    const SearchScreen(),
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
            color: Color.fromARGB(255, 255, 255, 255),
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
              GButton(icon: Icons.search, text: 'Search'),
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
  const HomeScreen({super.key});

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
      if (cameras.isNotEmpty) {
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
      // ignore: avoid_print
      print('Photo chosen: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
