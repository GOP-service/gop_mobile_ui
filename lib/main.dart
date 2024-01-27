import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gop_mobile_ui/core/app_color.dart';
import 'package:gop_mobile_ui/src/presentation/screen/signup_page.dart';
import 'package:gop_mobile_ui/src/presentation/screen/welcome_page.dart';

void main() {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.primaryColor,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColor.whiteColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.lightGreyColor,
        useMaterial3: true,
        fontFamily: 'Nunito'
      ),
      home: const SignupPage(),
    );
  }
}
