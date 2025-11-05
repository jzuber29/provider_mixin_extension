mixin LogMixin {
  void logInfo(String message) {
    print('ℹ️ INFO: $message');
  }

  void logWarning(String message) {
    print('⚠️ WARNING: $message');
  }
}
