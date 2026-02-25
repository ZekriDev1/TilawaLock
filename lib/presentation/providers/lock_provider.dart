import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/lock_repository_impl.dart';
import '../../domain/repositories/lock_repository.dart';

import '../../core/services/widget_service.dart';
import '../../core/services/local_database_manager.dart';

final lockRepositoryProvider = Provider<LockRepository>((ref) {
  return LockRepositoryImpl();
});

class AppLockState {
  final List<String> selectedApps;
  final int usageLimit;
  final int versesCompleted;
  final int streak;

  AppLockState({
    required this.selectedApps,
    required this.usageLimit,
    this.versesCompleted = 0,
    this.streak = 0,
  });
}

class LockNotifier extends StateNotifier<AppLockState> {
  final LockRepository _repository;

  LockNotifier(this._repository) : super(AppLockState(selectedApps: [], usageLimit: 60)) {
    _load();
  }

  void _load() async {
    final apps = await _repository.getLockedApps();
    final limit = await _repository.getDailyUsageLimit();
    final verses = LocalDatabaseManager.getVersesCompleted();
    final streak = LocalDatabaseManager.getStreak();
    
    state = AppLockState(
      selectedApps: apps.map((e) => e.packageName).toList(),
      usageLimit: limit,
      versesCompleted: verses,
      streak: streak,
    );
    _updateWidget();
  }

  void toggleApp(String packageName) async {
    if (state.selectedApps.contains(packageName)) {
      state = AppLockState(
        selectedApps: state.selectedApps.where((e) => e != packageName).toList(),
        usageLimit: state.usageLimit,
        versesCompleted: state.versesCompleted,
        streak: state.streak,
      );
      await _repository.unlockApp(packageName);
    } else {
      state = AppLockState(
        selectedApps: [...state.selectedApps, packageName],
        usageLimit: state.usageLimit,
        versesCompleted: state.versesCompleted,
        streak: state.streak,
      );
      await _repository.lockApp(packageName);
    }
    _updateWidget();
  }

  void updateUsageLimit(int minutes) async {
    state = AppLockState(
      selectedApps: state.selectedApps,
      usageLimit: minutes,
      versesCompleted: state.versesCompleted,
      streak: state.streak,
    );
    await _repository.setDailyUsageLimit(minutes);
    _updateWidget();
  }

  void _updateWidget() {
    WidgetService.updateWidgetData(
      timeRemainingMinutes: state.usageLimit, // Simplified for now
      versesCompleted: state.versesCompleted,
      totalVerses: 5, // Target verses
      streak: state.streak,
      message: "Discipline begins with recitation.",
    );
  }
}


final lockProvider = StateNotifierProvider<LockNotifier, AppLockState>((ref) {
  return LockNotifier(ref.watch(lockRepositoryProvider));
});
