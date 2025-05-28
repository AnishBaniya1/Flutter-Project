import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_app/firebase_options.dart';
import 'package:food_app/src/core/routes/app_router.dart';
import 'package:food_app/src/core/theme/theme.dart';
import 'package:food_app/src/features/details/presentation/blocs/detail_bloc.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_d5d9f63743584dc38753056b0cc737d5',
      builder: (context, navigatorkey) {
        return BlocProvider(
          create: (context) => DetailBloc(),
          child: MaterialApp(
            navigatorKey: navigatorkey,
            supportedLocales: const [Locale('en', 'US')],
            localizationsDelegates: const [KhaltiLocalizations.delegate],
            theme: AppTheme.theme,
            initialRoute: '/',
            onGenerateRoute: (settings) => AppRouter.route(settings),
          ),
        );
      },
    );
  }
}
