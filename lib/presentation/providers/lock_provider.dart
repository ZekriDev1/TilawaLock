import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/lock_repository_impl.dart';
import '../../domain/repositories/lock_repository.dart';

import '../services/widget_service.dart';

final lockRepositoryProvider = Provider<LockRepository>((ref) {
  return LockRepositoryImpl();
});

class LockState {
  final List<String> selectedApps;
  final int usageLimit;

  LockState({required this.selectedApps, required this.usageLimit});
}

class LockNotifier extends StateNotifier<LockState> {
  final LockRepository _repository;

  LockNotifier(this._repository) : super(LockState(selectedApps: [], usageLimit: 60)) {
    _load();
  }

  void _load() async {
    final apps = await _repository.getLockedApps();
    final limit = await _repository.getDailyUsageLimit();
    state = LockState(
      selectedApps: apps.map((e) => e.packageName).toList(),
      usageLimit: limit,
    );
    _updateWidget();
  }

  void toggleApp(String packageName) async {
    if (state.selectedApps.contains(packageName)) {
      state = LockState(
        selectedApps: state.selectedApps.where((e) => e != packageName).toList(),
        usageLimit: state.usageLimit,
      );
    } else {
      state = LockState(
        selectedApps: [...state.selectedApps, packageName],
        usageLimit: state.usageLimit,
      );
    }
    await _repository.setDailyUsageLimit(state.usageLimit);
    _updateWidget();
  }

  void _updateWidget() {
    WidgetService.updateWidgetData(
      timeRemainingMinutes: 84, // Mock value for now
      versesCompleted: 3,        // Mock value for now
      totalVerses: 5,
      streak: 7,                 // Mock value for now
      message: "Discipline begins with recitation.",
    );
  }
}


final lockProvider = StateNotifierProvider<LockNotifier, LockState>((ref) {
  return LockNotifier(ref.watch(lockRepositoryProvider));
});
