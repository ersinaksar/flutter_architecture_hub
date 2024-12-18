import '../services/api_service.dart';

abstract class DataRepository {
  Future<int> getInitialCounterValue();
}

class DataRepositoryImpl implements DataRepository {
  final ApiService apiService;

  DataRepositoryImpl({required this.apiService});

  @override
  Future<int> getInitialCounterValue() async {
    return await apiService.fetchInitialCounterValue();
  }
}
