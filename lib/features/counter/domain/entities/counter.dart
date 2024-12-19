class Counter {
  final int value;

  Counter(this.value);

  Counter increment([int incrementBy = 1]) {
    return Counter(value + incrementBy);
  }
}
