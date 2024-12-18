import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionFilterState {
  final String selectedFilter;

  SessionFilterState({this.selectedFilter = ''});

  SessionFilterState copyWith({String? selectedFilter}) {
    return SessionFilterState(
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}

class SessionFilterNotifier extends StateNotifier<SessionFilterState> {
  SessionFilterNotifier() : super(SessionFilterState());

  void setFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
  }
}

final sessionFilterProvider = StateNotifierProvider<SessionFilterNotifier, SessionFilterState>(
  (ref) => SessionFilterNotifier(),
);
