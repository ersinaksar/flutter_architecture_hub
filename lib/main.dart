import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/config/app_config.dart';
import 'core/providers/firebase_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeFirebase();
  await SentryFlutter.init((options) {
    // Instead of accessing the AppConfig shared singleton, we can consider accessing it through a provider.
    // To achieve this, we can perform the Sentry initialization in the create method of AppConfig.
    // However, this approach may complicate dependency injection. Alternatively, we can treat Sentry as a separate provider.
    // As a simple approach, we can consider initializing Sentry within the provider.
    // However, for a cleaner solution, we should ensure the proper order of dependencies.

    // Instead, we pre-create AppConfig and initialize Sentry within it.
    // final flavor = kReleaseMode ? Flavor.prod : Flavor.dev;
    final flavor = Flavor.dev;
    AppConfig.create(flavor: flavor);
    options.dsn = kReleaseMode ? AppConfig.shared.sentryUrl : '';
    // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
    // We recommend adjusting this value in production.
    options.tracesSampleRate = 1.0;
  },
      appRunner: () => runApp(
            const ProviderScope(
              child: StructureApp(),
            ),
          ));
}
