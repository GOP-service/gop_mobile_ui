import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gop_driver/core/app_color.dart';
import 'package:gop_driver/src/presentation/screen/bottom_nav.dart';
import 'package:gop_driver/src/presentation/screen/home_page.dart';
import 'package:gop_driver/src/presentation/screen/notification_page.dart';
import 'package:gop_driver/src/presentation/screen/order_history_page.dart';
import 'package:gop_driver/src/presentation/screen/otp_verification_page.dart';
import 'package:gop_driver/src/presentation/screen/profile_page.dart';
import 'package:gop_driver/src/presentation/screen/profile_page_detail.dart';
import 'package:gop_driver/src/presentation/screen/signin_page.dart';
import 'package:gop_driver/src/presentation/screen/signup_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'RootNavigator');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'SectionANavigator');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SigninPage(),
      ),
    ),
    GoRoute(
      path: '/signup',
      pageBuilder: (context, state) => MaterialPage(
        key: state.pageKey,
        child: const SignupPage(),
      ),
    ),
    GoRoute(
        path: '/otp',
        pageBuilder: (context, state) => MaterialPage(
              key: state.pageKey,
              child: const OTPVerificationPage(),
            )),

    // home
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          BottomNav(navigationShell: navigationShell),
      branches: [
        //Home
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),

        //Orders
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/orders',
              builder: (context, state) => const OrderHistoryPage(),
            ),
          ],
        ),

        //Notifications
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notifications',
              builder: (context, state) => const NotificationPage(),
            ),
          ],
        ),

        //Profile
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const ProfilePage(),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) =>
                      const DetailsScreen(label: 'Profile lụm'),
                ),
                GoRoute(
                  path: 'odee',
                  builder: (context, state) => const ProfileDetailsScreen(
                    label: 'Profile odeeeee',
                    withScaffold: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    // StatefulShellRoute.indexedStack(
    //     builder: (context, state, navigationShell) =>
    //         ScaffoldWithNavBar(navigationShell: navigationShell),
    //     branches: [
    //       StatefulShellBranch(navigatorKey: _sectionANavigatorKey, routes: [
    //         GoRoute(
    //           // The screen to display as the root in the first tab of the
    //           // bottom navigation bar.
    //           path: '/a',
    //           builder: (BuildContext context, GoRouterState state) =>
    //               const RootScreen(label: 'A', detailsPath: '/a/details'),
    //           routes: <RouteBase>[
    //             // The details screen to display stacked on navigator of the
    //             // first tab. This will cover screen A but not the application
    //             // shell (bottom navigation bar).
    //             GoRoute(
    //               path: 'details',
    //               builder: (BuildContext context, GoRouterState state) =>
    //                   const DetailsScreen(label: 'A'),
    //             ),
    //           ],
    //         ),
    //       ]),
    //       //2
    //       StatefulShellBranch(
    //         // It's not necessary to provide a navigatorKey if it isn't also
    //         // needed elsewhere. If not provided, a default key will be used.
    //         routes: <RouteBase>[
    //           GoRoute(
    //             // The screen to display as the root in the second tab of the
    //             // bottom navigation bar.
    //             path: '/b',
    //             builder: (BuildContext context, GoRouterState state) =>
    //                 const RootScreen(
    //               label: 'B',
    //               detailsPath: '/b/details/1',
    //               secondDetailsPath: '/b/details/2',
    //             ),
    //             routes: <RouteBase>[
    //               GoRoute(
    //                 path: 'details/:param',
    //                 builder: (BuildContext context, GoRouterState state) =>
    //                     DetailsScreen(
    //                   label: 'B',
    //                   param: state.pathParameters['param'],
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //       // 3
    //       StatefulShellBranch(
    //         routes: <RouteBase>[
    //           GoRoute(
    //             // The screen to display as the root in the third tab of the
    //             // bottom navigation bar.
    //             path: '/c',
    //             builder: (BuildContext context, GoRouterState state) =>
    //                 const RootScreen(
    //               label: 'C',
    //               detailsPath: '/c/details',
    //             ),
    //             routes: <RouteBase>[
    //               GoRoute(
    //                 path: 'details',
    //                 builder: (BuildContext context, GoRouterState state) =>
    //                     DetailsScreen(
    //                   label: 'C',
    //                   extra: state.extra,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ]),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.primaryColor,
        // Here, the items of BottomNavigationBar are hard coded. In a real
        // world scenario, the items would most likely be generated from the
        // branches of the shell route, which can be fetched using
        // `navigationShell.route.branches`.
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.inventory_2), label: 'Orders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: 'Notifications'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (int index) => _onTap(context, index),
      ),
    );
  }

  /// Navigate to the current location of the branch at the provided index when
  /// tapping an item in the BottomNavigationBar.
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

/// Widget for the root/initial pages in the bottom navigation bar.
class RootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const RootScreen({
    required this.label,
    required this.detailsPath,
    this.secondDetailsPath,
    super.key,
  });

  /// The label
  final String label;

  /// The path to the detail page
  final String detailsPath;

  /// The path to another detail page
  final String? secondDetailsPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Root of section $label'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen $label',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(detailsPath, extra: '$label-XYZ');
              },
              child: const Text('View details'),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            if (secondDetailsPath != null)
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go(secondDetailsPath!);
                },
                child: const Text('View more details'),
              ),
          ],
        ),
      ),
    );
  }
}

/// The details screen for either the A or B screen.
class DetailsScreen extends StatefulWidget {
  /// Constructs a [DetailsScreen].
  const DetailsScreen({
    required this.label,
    this.param,
    this.extra,
    this.withScaffold = true,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String label;

  /// Optional param
  final String? param;

  /// Optional extra object
  final Object? extra;

  /// Wrap in scaffold
  final bool withScaffold;

  @override
  State<StatefulWidget> createState() => DetailsScreenState();
}

/// The state for DetailsScreen
class DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.withScaffold) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Details Screen - ${widget.label}'),
        ),
        body: _build(context),
      );
    } else {
      return ColoredBox(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: _build(context),
      );
    }
  }

  Widget _build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Details for ${widget.label} - Counter: $_counter',
              style: Theme.of(context).textTheme.titleLarge),
          const Padding(padding: EdgeInsets.all(4)),
          TextButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            child: const Text('Increment counter'),
          ),
          const Padding(padding: EdgeInsets.all(8)),
          if (widget.param != null)
            Text('Parameter: ${widget.param!}',
                style: Theme.of(context).textTheme.titleMedium),
          const Padding(padding: EdgeInsets.all(8)),
          if (widget.extra != null)
            Text('Extra: ${widget.extra!}',
                style: Theme.of(context).textTheme.titleMedium),
          if (!widget.withScaffold) ...<Widget>[
            const Padding(padding: EdgeInsets.all(16)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: const Text('< Back',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            ),
          ]
        ],
      ),
    );
  }
}
