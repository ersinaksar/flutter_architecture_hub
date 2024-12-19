import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../app/config/app_config.dart';

final appConfigProvider = Provider<AppConfig>((ref) {
  // we can select the application working area here
  // for we can set example, debug, dev, release modes
  Flavor flavor = kReleaseMode ? Flavor.prod : Flavor.dev;

  return AppConfig.create(flavor: flavor);
});
