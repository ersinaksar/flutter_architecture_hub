import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfile {
  /// User profile features and functions
  final String username;

  UserProfile({required this.username});

  /// TODO: other methods
}

final userProfileProvider = StateProvider<UserProfile>((ref) {
  return UserProfile(username: 'Guest');
});
