class Counter {
  final int value;
  final int incrementValue;

  Counter({required this.value, required this.incrementValue});

  Counter copyWith({int? value, int? incrementValue}) {
    return Counter(
      value: value ?? this.value,
      incrementValue: incrementValue ?? this.incrementValue,
    );
  }
}