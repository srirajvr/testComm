import 'package:flutter/material.dart';
import 'package:commercial/Widgets/MainPage.dart';
import 'package:commercial/data/appcolors.dart';
import 'package:commercial/Widgets/projectPage.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:{
      '/':(context)=>MainPage(),
      'projectPage':(context)=>projectPage()
      },
      theme: _buildTheme(),
      title:"Commercial Data App",
    );
  }
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
