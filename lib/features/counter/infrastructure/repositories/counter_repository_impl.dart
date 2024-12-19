import '../../../../core/repositories/data_repository.dart';

class CounterRepositoryImpl implements DataRepository {
  @override
  Future<int> getInitialCounterValue() async {
    // We can connect a reall data source or we can just return mock data here
    return 0;
  }
}
