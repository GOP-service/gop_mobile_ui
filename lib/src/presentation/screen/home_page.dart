import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/core/result_type.dart';
import 'package:gop_passenger/src/data/model/customer_model.dart';
import 'package:gop_passenger/src/data/repository/auth_repository.dart';
import 'package:gop_passenger/src/presentation/widgets/staggered_dots_wave.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late final CustomerModel _customerModel;

  Future<void> _getProfile() async {
    Result result = await context.read<AuthRepository>().getProfile();
    if (result is Success) {
      //   _customerModel = result.data as CustomerModel;
    }
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Widget'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
                onPressed: () {
                  context.go('/');
                },
                child: const Text('LOGOUTTTTTTTT!!!')),
          ],
        ),
      ),
    );
  }
}
