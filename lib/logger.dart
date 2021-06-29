import 'package:logging/logging.dart';

Logger? logger;

void initLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('${record.level.name}: ${record.time}: ${record.message}');
  });
}

Logger getLogger(String name) {
  logger = Logger(name);
  return logger!;
}
