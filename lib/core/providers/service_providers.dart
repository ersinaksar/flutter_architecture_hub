import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../factories/service_factory.dart';
import '../services/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ServiceFactory.createApiService();
});
