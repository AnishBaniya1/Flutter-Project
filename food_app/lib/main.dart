import 'package:flutter/material.dart';
import 'package:food_app/src/core/routes/app_router.dart';
import 'package:food_app/src/core/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      initialRoute: '/',
      onGenerateRoute: (settings) => AppRouter.route(settings),
    );
  }
}
