import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'app.dart';

/// Main program.
void main() {
  // initialize logger
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen(
    // ignore: avoid_print
    (record) => print(
      '${record.time} ${record.level.name.padRight(7)} ${record.loggerName.padRight(12).characters.take(12)} ${record.message}',
    ),
  );

  // run app
  runApp(const App());
}
