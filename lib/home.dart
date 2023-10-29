import 'package:flutter/material.dart';
import 'package:frontend/detail.dart';
import 'package:frontend/profile.dart';
import 'package:frontend/search.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
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
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context,
        //         MaterialPageRoute(builder: (context) => const LoginPage()));
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     size: 20,
        //     color: Color.fromARGB(255, 255, 255, 255),
        //   ),
        // ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 36, 105, 243),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 36, 105, 243),
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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Screen'),
    );
  }
}
