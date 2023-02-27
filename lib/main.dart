import 'package:animation/pages/home_page.dart';
import 'package:animation/pages/login_page.dart';
import 'package:animation/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(AnimationApp(
    isLoggedIn: prefs.getBool('logged in'),
  ));
}

class AnimationApp extends StatelessWidget {
  final bool? isLoggedIn;
  const AnimationApp({super.key, this.isLoggedIn = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        LogIn.logInId: (context) => const LogIn(),
        Register.registerId: (context) => const Register(),
        Home.homeId: (context) => const Home(),
      },
      home: (isLoggedIn == true) ? const Home() : const LogIn(),
    );
  }
}
