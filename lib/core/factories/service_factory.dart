import '../services/api_service.dart';

class ServiceFactory {
  static ApiService createApiService() {
    return ApiServiceImpl();
  }
}
