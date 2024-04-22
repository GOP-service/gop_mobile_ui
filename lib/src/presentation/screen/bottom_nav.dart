import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_passenger/core/app_color.dart';
import 'package:gop_passenger/src/bloc/auth/auth_bloc.dart';
import 'package:gop_passenger/src/data/repository/auth_repository.dart';
import 'package:gop_passenger/src/data/repository/customer_repository.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key, required this.navigationShell})
      : super(key: key ?? const ValueKey<String>('BottomNav'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          CustomerRepository(dioManager: context.read<AuthRepository>().dio),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Unauthenticated) {
            context.go('/');
            if (state.message?.isNotEmpty == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message!),
                duration: const Duration(seconds: 2),
              ));
            }
          }
        },
        child: Scaffold(
            body: navigationShell,
            bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: AppColor.primaryColor,
                unselectedItemColor: AppColor.blackColor,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.inventory_2), label: 'Orders'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.notifications), label: 'Notifications'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],
                currentIndex: navigationShell.currentIndex,
                onTap: (int index) => _onTap(context, index))),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    // When navigating to a new branch, it's recommended to use the goBranch
    // method, as doing so makes sure the last navigation state of the
    // Navigator for the branch is restored.
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
