import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:techbloc_pro3/component/myColor.dart';
import 'package:techbloc_pro3/view/my_cata.dart';
void main() {
  SystemChrome.setSystemUIOverlayStyle(/////////////yek rang kardan appbar

    const SystemUiOverlayStyle(
    statusBarColor:SolidColors.statusBarColor,
    statusBarIconBrightness: Brightness.dark,
    /////////////////////////////////navigation//////////////
    systemNavigationBarColor: SolidColors.systemNavigationBarColor,
    systemNavigationBarIconBrightness: Brightness.dark
    ));//////////////////////////////////////
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    var textTheme=Theme.of(context).textTheme;
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates:[
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [
    Locale('fa'), // farsi
  ],
      
    theme: ThemeData(
      //elevetedbutton style
      elevatedButtonTheme: ElevatedButtonThemeData(style:
      ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith((states) {
                      if(states.contains(MaterialState.pressed)){
                        return  textTheme.labelLarge;
                      }
                      return textTheme.labelSmall;
                    }),
                  
              
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if(states.contains(MaterialState.pressed)){
                        return SolidColors.colorTitle;
                      }
                      return SolidColors.primaryColor;
                    }),
                  ),
      ),
///////////inputStyle
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(width: 2),),
          filled: true,///topor daray rang :fillcolor
        ),

/////////////////////////////////////////////////////////textStye
        fontFamily: 'DANA',
        // ignore: prefer_const_constructors
        textTheme: TextTheme(
          // ignore: prefer_const_constructors
          displayLarge: TextStyle(
              fontFamily: 'DANA',
              fontSize:16,
              fontWeight: FontWeight.bold,
              color: SolidColors.posterTitle),
          titleMedium: const TextStyle(
              fontFamily: 'DANA',
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: SolidColors.posterSubTitle),
              titleSmall: const TextStyle(
              fontFamily: 'DANA',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color:SolidColors.posterTitle),
          // ignore: prefer_const_constructors
          bodyLarge: TextStyle(
            fontFamily: 'DANA',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w300,

            // ignore: prefer_const_constructors
          ),
          bodyMedium: TextStyle(
            fontFamily: 'DANA',
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w300,

            // ignore: prefer_const_constructors
          ),
          
          displayMedium: const TextStyle(
            fontFamily: 'DANA ',
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
          displaySmall: const TextStyle(
              fontFamily: 'DANA ',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: SolidColors.seeMore),
          headlineMedium: const TextStyle(
            fontFamily: 'DANA ',
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
            headlineSmall: const TextStyle(
            fontFamily: 'DANA ',
            fontSize: 14,
            color: Color.fromARGB(255, 86, 85, 85),
            fontWeight: FontWeight.bold,
          ),
        labelLarge: const TextStyle(
            fontFamily: 'DANA ',
            fontSize: 30,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
          labelSmall: const TextStyle(
            fontFamily: 'DANA ',
            fontSize: 20,
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
          labelMedium: const TextStyle(
            fontFamily: 'DANA ',
            fontSize:16,
            color: Color.fromARGB(255, 56, 56, 56),
            fontWeight: FontWeight.bold,
          ),
          

        ),
      ),

      home:MyCats(),

    
    );
  }
}

