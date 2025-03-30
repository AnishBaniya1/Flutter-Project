import 'package:flutter/material.dart';
import 'package:food_app/src/features/splash/presentation/splash_page.dart';

class AppRouter {
  //This method is like a navigation guide that tells the app
  //which page to show based on the user's request (like choosing which room to go to).
  static Route<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => SplashPage());
      default:
        return MaterialPageRoute(builder: (context) => InvalidRoute());
    }
  }
}

class InvalidRoute extends StatelessWidget {
  const InvalidRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Invalid Route'));
  }
}


//Explanation
// AppRouter is like a navigation guide that decides where to send the user 
//when they ask to go to a specific page.

// When the user asks to go to the root page ('/'), the guide sends them to the SplashPage.

// If they try to go to a room that doesn’t exist, the guide sends them to an error 
//page that says "Invalid Route."