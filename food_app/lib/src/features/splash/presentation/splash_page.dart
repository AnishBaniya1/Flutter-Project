import 'package:flutter/material.dart';
import 'package:food_app/src/core/components/app_text_style.dart';
import 'package:food_app/src/core/routes/app_routes.dart';
import 'package:food_app/src/features/splash/data/splash_data.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int currentIndex = 0; //Keeps track of which page you're currently looking at.
  late PageController
  _controller; //The tool that lets you swipe between photos.

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: SplashData.contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final content = SplashData.contents[index];
                return Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        content.image,
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: 35),
                      Text(content.title, style: AppTextStyle.name()),
                      SizedBox(height: 20),
                      Text(
                        content.description,
                        style: AppTextStyle.subheading(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          SmoothPageIndicator(
            controller: _controller,
            count: SplashData.contents.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.red.shade400,
              dotColor: Colors.black12,
              dotHeight: 15,
              dotWidth: 20,
              spacing: 12,
            ),
          ),
          SizedBox(height: 55),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: ElevatedButton(
              onPressed: () {
                if (_controller.page?.round() ==
                    SplashData.contents.length - 1) {
                  Navigator.of(context).pushReplacementNamed(AppRoutes.second);
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade400,
                foregroundColor: Colors.white,
                fixedSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
