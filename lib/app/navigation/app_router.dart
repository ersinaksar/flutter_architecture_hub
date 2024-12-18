import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/counter/presentation/pages/counter_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import 'route_constants.dart';

/// TODO  import other pages

final GoRouter appRouter = GoRouter(
  initialLocation: RouteConstants.homePage,
  routes: [
    GoRoute(
      path: RouteConstants.homePage,
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: RouteConstants.counterPage,
      name: 'counter',
      builder: (context, state) => const CounterPage(),
    ),
    GoRoute(
      path: RouteConstants.settingsPage,
      name: 'settings',
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: RouteConstants.profilePage,
      name: 'profile',
      builder: (context, state) => const ProfilePage(),
    ),

    /// TODO other routes
  ],
);
