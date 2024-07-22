import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_application/Screens/Home%20Page.dart';

import 'Screens/SplashScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
  ));
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily:'Mier'),
      home: StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context,snapshot)
        {
          if(snapshot.connectionState==ConnectionState.waiting){
            return const CircularProgressIndicator();
          }
          else if(snapshot.hasData){
            return const HomePage();
          }
          else{
            return const SplashScreen();
          }
        },
      ),
    );
  }
}

