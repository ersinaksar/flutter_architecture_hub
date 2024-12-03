import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';
final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: appRoutes,
);