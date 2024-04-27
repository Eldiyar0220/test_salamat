import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_lang/pages/choose_language.dart';
import 'package:learning_lang/pages/create_account.dart';
import 'package:learning_lang/pages/dashboard.dart';
import 'package:learning_lang/pages/home.dart';
import 'package:learning_lang/pages/lesson_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: "/",
        onGenerateRoute: _onGenerateRoute,
      ),
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case "/":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
    case "/create-account":
      return MaterialPageRoute(builder: (BuildContext context) {
        return CreateAccount();
      });
    case "/choose-language":
      return MaterialPageRoute(builder: (BuildContext context) {
        return const ChooseLanguage();
      });
    case "/dashboard":
      return MaterialPageRoute(builder: (BuildContext context) {
        return Dashboard();
      });
    case "/lesson-screen":
      return MaterialPageRoute(builder: (BuildContext context) {
        return LessonScreen();
      });
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Home();
      });
  }
}
