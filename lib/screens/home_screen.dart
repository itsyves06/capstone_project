import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants.dart'; 
import 'request_form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required String email});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onTappedBar(int value) {
    setState(() {
      _selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FB_BACKGROUND_LIGHT,
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            _selectedIndex = page;
          });
        },
        children: [
          _buildHomeContent(context),
          const Center(child: Text("Pending")),
          const Center(child: Text("History")),
        ],
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavigationItem(Icons.home_outlined, Icons.home, 0),
            _buildNavigationItem(Icons.access_time, Icons.access_time_filled, 1),
            _buildNavigationItem(Icons.assignment_outlined, Icons.assignment, 2),
          ],
        ),
      ),
    );
  }

  Widget _buildNavigationItem(IconData icon, IconData activeIcon, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onTappedBar(index),
      child: Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? FB_PRIMARY : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(
          isSelected ? activeIcon : icon,
          color: isSelected ? Colors.white : FB_DARK_PRIMARY,
          size: 28,
        ),
      ),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return Stack(
      children: [
        // Blue Header
        Container(
          height: ScreenUtil().setHeight(300),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: FB_PRIMARY,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(85),
              bottomRight: Radius.circular(85),
            ),
            image: DecorationImage(
              image: AssetImage('assets/image/BluePattern.jpg'), 
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundColor: Colors.white.withOpacity(0.9),
                  radius: 15,
                  child: const Icon(Icons.person, size: 18, color: FB_PRIMARY),
                ),
              ),
            ),
          ),
        ),
        
        
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100), 
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: FB_DARK_PRIMARY,
                  padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 8,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RequestFormScreen()),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("REQUEST", 
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

