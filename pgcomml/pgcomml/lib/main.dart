import 'package:flutter/material.dart';
import 'package:pgcomml/screens/firstpage.dart';
import 'package:pgcomml/models/colors.dart';
import 'package:pgcomml/screens/projectPage.dart';
import 'package:pgcomml/screens/assetpage.dart';

void main()=>runApp(Mainapp());

class Mainapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: _buildTheme(),
    initialRoute: '/',
    routes:{
      '/':(context)=>firstpage(),
      'projectPage':(context)=>projectPage(),
      'assetPage':(context)=>assetPage()
      },
      
    );
  }

  ThemeData _buildTheme(){
  final ThemeData base = ThemeData.light();

  return base.copyWith(
    scaffoldBackgroundColor: kSurfaceWhite,
    primaryColor: kPrimary,
    accentColor: kAccent,
    cardColor: kCardWhite,
    errorColor: kError,
    appBarTheme: base.appBarTheme.copyWith(iconTheme: IconThemeData(color: kDark)),
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: KButton,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    cardTheme: CardTheme(
        elevation: 5.0
    ),
    textTheme: base.textTheme.copyWith(
      button: TextStyle(fontWeight: FontWeight.bold),
      body2: TextStyle(color: kDark,fontWeight: FontWeight.w600),
      display1: TextStyle(color: kDark,fontWeight: FontWeight.w500,fontSize: 22.0),

    ).apply(fontFamily: 'Montserrat') ,
  );


}
}

