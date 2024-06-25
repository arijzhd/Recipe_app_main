import 'dart:js';

import 'package:cafe_restaut/pages/dessert.dart';
import 'package:cafe_restaut/pages/authentification.page.dart';
import 'package:cafe_restaut/pages/diet.dart';
import 'package:cafe_restaut/pages/favorite.dart';
import 'package:cafe_restaut/pages/home.page.dart';
import 'package:cafe_restaut/pages/inscription.page.dart';
import 'package:cafe_restaut/pages/onBording.page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/home': (context) => HomePage(),
    '/inscription': (context) => InscriptionPage(),
    '/favorite': (context) => FavoritesPage(),
    '/authentification': (context) => AuthentificationPage(),
    '/diet': (context) => DietPage(),
    '/sweets': (context) => Dessert(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            return HomePage();
          } else {
            return OnboardingScreen();
          }
        },
      ),
    );
  }
}
