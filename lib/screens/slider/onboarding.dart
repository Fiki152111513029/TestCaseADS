import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../welcome/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slider',
      theme: ThemeData(
        fontFamily: 'Overpass',
        primarySwatch: Colors.blue,
      ),
      home: SliderPage(),
    );
  }
}

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final PageController _pageController = PageController();
  final List<Map<String, String>> _slides = [
    {
      'image': 'assets/carrousel/splash.png',
      'title': 'View and buy Medicine online',
      'text':
          'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'
    },
    {
      'image': 'assets/carrousel/splash2.png',
      'title': 'Online medical & Healthcare',
      'text':
          'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'
    },
    {
      'image': 'assets/carrousel/splash2.png',
      'title': 'View and buy Medicine online',
      'text':
          'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'
    },
    {
      'image': 'assets/carrousel/splash2.png',
      'title': 'Online medical & Healthcare',
      'text':
          'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'
    },
  ];

  void _nextPage() {
    if (_pageController.page!.toInt() == _slides.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    } else {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipToWelcome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _slides.length,
            itemBuilder: (context, index) {
              final slide = _slides[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    slide['image']!,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      slide['title']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF090F47),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      slide['text']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF090F47),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              );
            },
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: TextButton(
              onPressed: _skipToWelcome,
              child: Text(
                'Skip',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 165, 165, 165),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: TextButton(
              onPressed: _nextPage,
              child: Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF00A59B),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 35,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: _slides.length,
                effect: WormEffect(
                  dotWidth: 10.0,
                  dotHeight: 10.0,
                  spacing: 12.0,
                  activeDotColor: Color(0xFF00A59B),
                  dotColor: const Color(0xFFC4C4C4).withOpacity(0.5),
                ),
                onDotClicked: (index) => _pageController.animateToPage(
                  index,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
