import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/core/dio_manager.dart';
import 'package:gop_passenger/router.dart';
import 'package:gop_passenger/src/bloc/auth/auth_bloc.dart';
import 'package:gop_passenger/src/data/repository/auth_repository.dart';
import 'package:gop_passenger/src/data/service/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sf = await SharedPreferences.getInstance();
  final dio = DioManager();

  runApp(MyApp(sf: sf, dio: dio));

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColor.primaryColor,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColor.whiteColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.sf, required this.dio});

  final SharedPreferences sf;
  final DioManager dio;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(
        authService: AuthService(dioManager: dio, sf: sf),
      ),
      child: BlocProvider(
        create: (context) => AuthBloc(context.read<AuthRepository>()),
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: AppColor.lightGreyColor,
              useMaterial3: true,
              fontFamily: 'Nunito'),
          routerConfig: appRouter,
        ),
      ),
    );
  }
}
