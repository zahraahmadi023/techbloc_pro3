import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:techbloc_pro3/component/myColor.dart';
import 'package:techbloc_pro3/gen/assets.gen.dart';
import 'package:techbloc_pro3/view/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then(
      (value) =>  Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context) => MainScreen(),
      )
      ,)
    );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Assets.images.logo.image(height: 64),
          SizedBox(height: 15,),
          const SpinKitFadingCube(
            color: SolidColors.primaryColor,
            size: 32,
          )
          ],
          
      
          ),
      ),
    );
  }
}