import 'dart:io';

import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/constants/app_constants.dart';
import '../../core/networking/network_info.dart';
import 'platform_config.dart';

enum Flavor { prod, test, dev }

enum PlatformType { web, ios, android, macos, linux, windows }

class AppConfig {
  /// Platform-specific configuration
  final Flavor flavor;
  final String appName;
  final String baseUrl;
  final String sentryUrl;
  final PlatformConfig platformConfig;

  /// Common settings across all environments
  final String pubnubPublishKey = PUBNUB_PUBLISH_KEY;
  final String pubnubSecretKey = PUBNUB_SECRET_KEY;
  final String bucket = BUCKET;
  final String identifier = IDENTIFIER;
  final String secret = SECRET;
  final String regIdentifier = REG_IDENTIFIER;
  final String regSecret = REG_SECRET;

  final ThemeData themeData;

  static late AppConfig shared; // Singleton AppConfig
  static late NetworkInfo networkInfo;
  static bool isOnline = false;

  /// Private constructor for AppConfig
  AppConfig._internal({
    required this.flavor,
    required this.appName,
    required this.baseUrl,
    required this.sentryUrl,
    required this.platformConfig,
    required this.themeData,
  });

  /// Factory method to create an AppConfig based on environment and platform
  factory AppConfig.create({required Flavor flavor}) {
    PlatformType platformType = detectPlatform();
    PlatformConfig platformConfig;

    /// Select platform-specific configuration
    switch (platformType) {
      case PlatformType.web:
        platformConfig = PlatformConfig.web();
        break;
      case PlatformType.ios:
        platformConfig = PlatformConfig.ios();
        break;
      case PlatformType.android:
        platformConfig = PlatformConfig.android();
        break;
      case PlatformType.macos:
        platformConfig = PlatformConfig.macos();
        break;
      case PlatformType.linux:
        platformConfig = PlatformConfig.linux();
        break;
      case PlatformType.windows:
        platformConfig = PlatformConfig.windows();
        break;
      default:
        throw UnsupportedError("Unsupported Platform");
    }

    /// Return environment-specific configuration with the selected platform configuration
    switch (flavor) {
      case Flavor.dev:
        shared = AppConfig._dev(platformConfig);
        break;
      case Flavor.prod:
        shared = AppConfig._prod(platformConfig);
        break;
      case Flavor.test:
        shared = AppConfig._test(platformConfig);
        break;
      default:
        throw UnsupportedError("Unsupported Flavor");
    }

    // Start the NetworkInfo
    networkInfo = NetworkInfoImpl(DataConnectionChecker());

    return shared;
  }

  /// Private constructor for dev environment
  AppConfig._dev(PlatformConfig platformConfig)
      : flavor = Flavor.dev,
        appName = APP_NAME_DEV,
        baseUrl = BASE_URL_DEV,
        sentryUrl = SENTRY_URL_DEV,
        platformConfig = platformConfig,
        themeData = ThemeData(
          primarySwatch: Colors.blue,
        );

  /// Private constructor for production environment
  AppConfig._prod(PlatformConfig platformConfig)
      : flavor = Flavor.prod,
        appName = APP_NAME_PROD,
        baseUrl = BASE_URL_PROD,
        sentryUrl = SENTRY_URL_PROD,
        platformConfig = platformConfig,
        themeData = ThemeData(
          primarySwatch: Colors.green,
        );

  // Private constructor for test environment
  AppConfig._test(PlatformConfig platformConfig)
      : flavor = Flavor.test,
        appName = APP_NAME_TEST,
        baseUrl = BASE_URL_TEST,
        sentryUrl = SENTRY_URL_TEST,
        platformConfig = platformConfig,
        themeData = ThemeData(
          primarySwatch: Colors.orange,
        );

  // internet connection control function
  static Future<bool> checkOnlineStatus() async {
    isOnline = await networkInfo.isConnected;
    return isOnline;
  }

  // application version control function
  static Future<String> checkAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}

PlatformType detectPlatform() {
  if (kIsWeb) {
    return PlatformType.web;
  } else if (Platform.isIOS) {
    return PlatformType.ios;
  } else if (Platform.isAndroid) {
    return PlatformType.android;
  } else if (Platform.isMacOS) {
    return PlatformType.macos;
  } else if (Platform.isLinux) {
    return PlatformType.linux;
  } else if (Platform.isWindows) {
    return PlatformType.windows;
  } else {
    throw UnsupportedError("Unsupported Platform");
  }
}
