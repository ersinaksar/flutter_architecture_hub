import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionState {
  final bool isLoggedIn;

  SessionState({this.isLoggedIn = false});

  SessionState copyWith({bool? isLoggedIn}) {
    return SessionState(isLoggedIn: isLoggedIn ?? this.isLoggedIn);
  }
}

class SessionNotifier extends StateNotifier<SessionState> {
  SessionNotifier() : super(SessionState());

  void logIn() {
    state = state.copyWith(isLoggedIn: true);
  }

  void logOut() {
    state = state.copyWith(isLoggedIn: false);
  }
}

final sessionProvider = StateNotifierProvider<SessionNotifier, SessionState>((ref) => SessionNotifier());
