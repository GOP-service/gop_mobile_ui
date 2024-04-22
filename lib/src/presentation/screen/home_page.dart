import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/core/result_type.dart';
import 'package:gop_passenger/src/bloc/auth/auth_bloc.dart';
import 'package:gop_passenger/src/data/model/customer_model.dart';
import 'package:gop_passenger/src/data/repository/auth_repository.dart';
import 'package:gop_passenger/src/data/repository/customer_repository.dart';
import 'package:gop_passenger/src/presentation/widgets/staggered_dots_wave.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _greeting;
  CustomerModel? _customerModel;

  void _getProfile() async {
    await context.read<CustomerRepository>().getProfile();
    setState(() {
      _customerModel = context.read<CustomerRepository>().customerModel;
    });
  }

  @override
  void initState() {
    super.initState();
    _getProfile();
    final hour = DateTime.now().hour;

    if (hour < 12) {
      _greeting = 'Good Morning';
    } else if (hour < 17) {
      _greeting = 'Good Afternoon';
    } else {
      _greeting = 'Good Evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 130 + MediaQuery.of(context).viewPadding.top,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Color.fromARGB(255, 19, 136, 128),
                            AppColor.primaryColor,
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      color: Colors.white,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                            15.0 + MediaQuery.of(context).viewPadding.top),
                        child: Center(
                          child: Text(_greeting,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Card(
                        elevation: 10,
                        surfaceTintColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                _customerModel?.fullName ?? 'Loading...',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                thickness: 2,
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  IconButton(
                                    onPressed: () {
                                      context.go('/home/map/car');
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/icons/Car.svg'),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context.go('/home/map/bike');
                                    },
                                    icon: SvgPicture.asset(
                                        'assets/icons/Motorbike.svg'),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        'assets/icons/Food.svg'),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  context
                      .read<AuthBloc>()
                      .add(AuthLogout(message: ' ố deeeeeeeee'));
                },
                child: const Text('LOGOUTTTTTTTT!!!')),
            Column(
              children: [
                Text('Name: ${_customerModel?.fullName ?? 'Loading...'}'),
                Text('Email: ${_customerModel?.email ?? 'Loading...'}'),
                Text('Phone: ${_customerModel?.phone ?? 'Loading...'}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
