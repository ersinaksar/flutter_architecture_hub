import '../entities/counter.dart';

class IncrementCounter {
  Counter call(Counter counter, [int incrementBy = 1]) {
    return counter.increment(incrementBy);
  }
}
