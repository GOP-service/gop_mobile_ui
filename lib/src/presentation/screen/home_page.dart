import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_driver/core/app_color.dart';
import 'package:gop_driver/core/result_type.dart';
import 'package:gop_driver/src/bloc/auth/auth_bloc.dart';
import 'package:gop_driver/src/data/model/customer_model.dart';
import 'package:gop_driver/src/data/repository/auth_repository.dart';
import 'package:gop_driver/src/presentation/widgets/staggered_dots_wave.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CustomerModel? _customerModel;
  void _getprofile() async {
    await context.read<AuthRepository>().getProfile().then((value) {
      if (value is Success) {
        setState(() {
          _customerModel = value.data as CustomerModel;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text((value as Failure).message),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _getprofile();
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
                  context
                      .read<AuthBloc>()
                      .add(AuthLogout(message: ' ố deeeeeeeee'));
                },
                child: const Text('LOGOUTTTTTTTT!!!')),
            if (_customerModel == null)
              TextButton(
                  onPressed: () => _getprofile(),
                  child: const Text('Loading...'))
            else
              Column(
                children: [
                  Text('Name: ${_customerModel!.fullName}'),
                  Text('Email: ${_customerModel!.email}'),
                  Text('Phone: ${_customerModel!.phone}'),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
