import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/counter/presentation/pages/counter_page.dart';

List<GoRoute> appRoutes = [
  GoRoute(
    path: '/',
    name: 'counter',
    builder: (BuildContext context, GoRouterState state) => const CounterPage(),
  ),
  // The other routes will come here.
];
