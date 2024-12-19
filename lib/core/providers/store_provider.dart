import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'user_profile_provider.dart';

class StoreService {
  final UserProfile userProfile;

  StoreService(this.userProfile);

  // Your services functions and features
  // for example
  String get username => userProfile.username;

//Otherc methods
}

final storeServiceProvider = Provider<StoreService>((ref) {
  final userProfile = ref.watch(userProfileProvider);
  return StoreService(userProfile);
});
