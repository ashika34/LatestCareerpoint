import 'package:careerpoint2/firstscreen/firstscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
with SingleTickerProviderStateMixin {
  @override
  void initState() {
  super.initState();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  Future.delayed(const Duration(seconds: 3),() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const FirstScreen(),)

    );
  },
  );
  }
  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
    overlays: SystemUiOverlay.values);
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(

body: Container(
  width: double.infinity,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors:[ Colors.blue,Colors.purple],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
  ),
),
child: const Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        Icon(Icons.person,
    
           size: 80,
    
           color: Colors.white,
    
    ),
    SizedBox(
      height: 20,
    ),
    Text('Careerpoint.com',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)
  ],
  
),
     ) );
  }
}