import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'mixins/log_mixin.dart';
import 'extensions/string_extension.dart';
import 'providers/counter_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider + Extension + Mixin',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CounterScreen(),
    );
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> with LogMixin {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CounterProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Hello ${'flutter'.capitalizeFirst()}')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: ${provider.count}', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                provider.increment();
                logInfo('Incremented count: ${provider.count}');
              },
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: () {
                provider.reset();
                logWarning('Counter reset!');
              },
              child: const Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}
