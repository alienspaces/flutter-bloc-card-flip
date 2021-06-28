import 'package:logging/logging.dart';

Logger? logger;

Logger getLogger(String name) {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  logger = Logger(name);
  return logger!;
}
