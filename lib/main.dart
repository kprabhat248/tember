import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:tember/firebase_options.dart';
import 'package:tember/home.dart';

import 'phone.dart';
import 'verify.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,); // Initialize Firebase

  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => MyPhone(), // Define the home route if needed
      'verify': (context) => MyVerify(), 
      'home': (context) => MyHome(),
    },
  ));
}
