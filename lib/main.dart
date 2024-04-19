import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/core/dio_manager.dart';
import 'package:gop_passenger/router.dart';
import 'package:gop_passenger/src/bloc/auth/auth_bloc.dart';
import 'package:gop_passenger/src/data/repository/auth_repository.dart';
import 'package:gop_passenger/src/data/data_source/auth_controller.dart';
import 'package:gop_passenger/src/presentation/widgets/loading_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

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
  const MyApp({super.key});

  void showSnackBar(BuildContext context, String message) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          duration: const Duration(seconds: 2),
          backgroundColor: AppColor.redColor,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
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
