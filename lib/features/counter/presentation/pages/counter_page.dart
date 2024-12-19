import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/app_config_provider.dart';
import '../../application/counter_notifier.dart';
import '../widgets/bottom_navigation_bar.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    final appConfig = ref.watch(appConfigProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(appConfig.appName),
      ),
      body: Center(
        child: Text(
          'Counter: ${counter.value}',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ref.read(counterProvider.notifier).increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
