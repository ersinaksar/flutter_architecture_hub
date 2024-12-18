abstract class ApiService {
  Future<int> fetchInitialCounterValue();
}

class ApiServiceImpl implements ApiService {
  @override
  Future<int> fetchInitialCounterValue() async {
    // We add a delay for simulation
    await Future.delayed(const Duration(seconds: 1));
    return 10; // for example we can return 10
  }
}
