import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/entities/counter.dart';

class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter(value: 0, incrementValue: 0));

  void increment() {
    state = state.copyWith(
      value: state.value + 1,
      incrementValue: 1,
    );
    print(state.value);
  }
}

final counterProvider = StateNotifierProvider<CounterNotifier, Counter>(
      (ref) => CounterNotifier(),
);