import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/navigation/nav_index.dart';
import '../../app/navigation/route_constants.dart';

class NavigationState {
  final String currentRoute;
  final dynamic arguments;
  final int selectedIndex;

  NavigationState({
    this.currentRoute = RouteConstants.homePage,
    this.arguments,
    this.selectedIndex = NavIndex.home,
  });

  NavigationState copyWith({
    String? currentRoute,
    dynamic arguments,
    int? selectedIndex,
  }) {
    return NavigationState(
      currentRoute: currentRoute ?? this.currentRoute,
      arguments: arguments ?? this.arguments,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

class NavigationNotifier extends StateNotifier<NavigationState> {
  NavigationNotifier() : super(NavigationState());

  void setCurrentRoute(String routeName, {dynamic arguments, int? selectedIndex}) {
    state = state.copyWith(
      currentRoute: routeName,
      arguments: arguments,
      selectedIndex: selectedIndex ?? state.selectedIndex,
    );
  }

  void setSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}

final navigationProvider = StateNotifierProvider<NavigationNotifier, NavigationState>((ref) => NavigationNotifier());
