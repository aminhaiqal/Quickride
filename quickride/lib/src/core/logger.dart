// ignore_for_file: avoid_print

class Logger {
  static void log(String message) {
    print('[${DateTime.now()}] $message');
  }
}
