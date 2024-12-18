import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/navigation/nav_index.dart';
import '../../../../app/navigation/route_constants.dart';
import '../../../../core/providers/navigation_provider.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationState = ref.watch(navigationProvider);
    final navigationNotifier = ref.read(navigationProvider.notifier);

    return BottomNavigationBar(
      currentIndex: navigationState.selectedIndex,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        String route;
        switch (index) {
          case NavIndex.home:
            route = RouteConstants.homePage;
            break;
          case NavIndex.counter:
            route = RouteConstants.counterPage;
            break;
          case NavIndex.settings:
            route = RouteConstants.settingsPage;
            break;
          case NavIndex.profile:
            route = RouteConstants.profilePage;
            break;
          default:
            route = RouteConstants.homePage;
        }
        navigationNotifier.setCurrentRoute(route, selectedIndex: index);
        context.go(route);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: 'Counter',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
