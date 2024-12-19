import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/providers/repository_provider.dart';
import '../../../core/repositories/data_repository.dart';
import '../domain/entities/counter.dart';
import '../domain/use_cases/increment_counter.dart';

class CounterNotifier extends StateNotifier<Counter> {
  final DataRepository repository;
  final IncrementCounter incrementCounter;

  CounterNotifier(this.repository, this.incrementCounter) : super(Counter(0)) {
    _loadInitialValue();
  }

  Future<void> _loadInitialValue() async {
    final initialValue = await repository.getInitialCounterValue();
    state = Counter(initialValue);
  }

  void increment() {
    state = incrementCounter(state);
    print(state.value);
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, Counter>(
  (ref) {
    final repository = ref.watch(dataRepositoryProvider);
    final incrementUseCase = IncrementCounter();
    return CounterNotifier(repository, incrementUseCase);
  },
);
