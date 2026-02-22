class AppLock {
  final String packageName;
  final String appName;
  final bool isLocked;

  AppLock({
    required this.packageName,
    required this.appName,
    this.isLocked = false,
  });
}
