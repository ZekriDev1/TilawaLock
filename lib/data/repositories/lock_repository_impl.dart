import '../../domain/entities/app_lock.dart';
import '../../domain/repositories/lock_repository.dart';
import '../../core/services/local_database_manager.dart';

class LockRepositoryImpl implements LockRepository {
  @override
  Future<List<AppLock>> getLockedApps() async {
    final packageNames = LocalDatabaseManager.getLockedApps();
    return packageNames.map((name) => AppLock(packageName: name, appName: '', isLocked: true)).toList();
  }

  @override
  Future<void> lockApp(String packageName) async {
    final list = LocalDatabaseManager.getLockedApps();
    if (!list.contains(packageName)) {
      list.add(packageName);
      await LocalDatabaseManager.setLockedApps(list);
    }
  }

  @override
  Future<void> unlockApp(String packageName) async {
    final list = LocalDatabaseManager.getLockedApps();
    if (list.contains(packageName)) {
      list.remove(packageName);
      await LocalDatabaseManager.setLockedApps(list);
    }
  }

  @override
  Future<void> setDailyUsageLimit(int minutes) async {
    await LocalDatabaseManager.saveUsageLimit(minutes);
  }

  @override
  Future<int> getDailyUsageLimit() async {
    return LocalDatabaseManager.getUsageLimit();
  }
}
