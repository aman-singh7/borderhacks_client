import 'package:borderhacks_client/locator.dart';
import 'package:borderhacks_client/ui/view/home_view.dart';
import 'package:borderhacks_client/ui/view/login_view.dart';
import 'package:borderhacks_client/ui/view/signup_view.dart';
import 'package:borderhacks_client/ui/view/startup_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const StartUpView()),
        GetPage(name: '/login', page: () => const LoginView()),
        GetPage(name: '/signup', page: () => const SignupView()),
        GetPage(name: '/home', page: () => const HomeView()),
      ],
      home: const StartUpView(),
    );
  }
}
