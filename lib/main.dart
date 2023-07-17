import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/landing_page.dart';
import 'package:movie_app/services/login_services.dart';
import 'package:movie_app/services/movie_porvider.dart';
import 'package:movie_app/services/shared_preferance.dart';
import 'package:movie_app/setting_home.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Data(),
        ),
        ChangeNotifierProvider(
          create: (context) => MovieProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (_, data, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 24, 25, 32),
            fontFamily: 'Caveat',
          ),
          home: data.isFirstTime ? const SettingHome() : const LandingPage(),
        );
      },
    );
  }
}
