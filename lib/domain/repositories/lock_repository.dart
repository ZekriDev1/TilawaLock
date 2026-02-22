import '../entities/app_lock.dart';

abstract class LockRepository {
  Future<List<AppLock>> getLockedApps();
  Future<void> lockApp(String packageName);
  Future<void> unlockApp(String packageName);
  Future<void> setDailyUsageLimit(int minutes);
  Future<int> getDailyUsageLimit();
}
