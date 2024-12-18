import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/data_repository.dart';
import 'service_providers.dart';

final dataRepositoryProvider = Provider<DataRepository>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return DataRepositoryImpl(apiService: apiService);
});
