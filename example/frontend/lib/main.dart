import 'dart:io';

import 'package:flutter/material.dart';

import 'package:logging/logging.dart';

import 'locator.dart';
import 'view/led_status_view.dart';

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((final LogRecord record) {
    String start = '\x1b[0m';
    const String reset = '\x1b[0m';

    switch (record.level) {
      case Level.FINEST:
      case Level.FINER:
        // Grey.
        start = '\x1b[90m';
      case Level.FINE:
      case Level.CONFIG:
        // White.
        start = '\x1b[97m';
      case Level.INFO:
        // Green.
        start = '\x1b[32m';
      case Level.WARNING:
        // Yellow.
        start = '\x1b[33m';
      case Level.SEVERE:
        // Red.
        start = '\x1b[31m';
      case Level.SHOUT:
        start = '\x1b[41m\x1b[93m';
    }

    stdout.writeln(
      '$start(${record.time.toLocal()}) ${record.loggerName}(${record.level.name}): ${record.message}$reset',
    );
  });
}

void main() {
  _setupLogging();

  setup();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Unleashing gRPC Frontend',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const LedStatusView(),
    );
  }
}
