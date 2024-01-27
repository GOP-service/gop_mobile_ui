import 'package:flutter/material.dart';
import 'package:gop_mobile_ui/core/app_color.dart';
import 'package:gop_mobile_ui/src/presentation/screen/signin_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  
  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? AppColor.primaryColor : AppColor.darkGreyColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  Widget _buildItemIntroScreen(String image, String title, String description,) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 48.0),
          child: Image.asset(
            image,
            height: 275.0,
            width: 275.0,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(height: 48.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(
                title, 
                style: const TextStyle(
                                  fontSize: 20.0, 
                                  fontWeight: FontWeight.bold
                                ), 
                textAlign: TextAlign.center,
                ),
              const SizedBox(height: 20.0,),
              Text(
                description, 
                style: const TextStyle(
                                  fontSize: 16.0, 
                                  fontWeight: FontWeight.w400,
                                ), 
                textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage = value;
              });
            },
            children: [
              _buildItemIntroScreen(
                'assets/images/intro1.png', 
                'Request Ride', 
                'Request a ride get picked up by a nearby community driver'
              ),
              _buildItemIntroScreen(
                'assets/images/intro2.png', 
                'Confirm Your Driver', 
                'Huge drivers network helps you find comforable, safe and cheap ride'
              ),
              _buildItemIntroScreen(
                'assets/images/intro3.png', 
                'Track your ride', 
                'Know your driver in advance and be able to view current location in real time on the map'
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0.0,
            right: 0.0,
            child: Row(
              children: [
                const Spacer(),
                _buildIndicator(_currentPage == 0),
                _buildIndicator(_currentPage == 1),
                _buildIndicator(_currentPage == 2),
                const Spacer(),],
            )
          ),
          _currentPage != 2 ? Positioned(
            bottom: 20.0,
            right: 20.0,
            child: TextButton(
              onPressed: () {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500), 
                  curve: Curves.ease
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ) : 
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: TextButton(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SigninPage()));
                },
              child: const Text(
                'Next',
                style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
