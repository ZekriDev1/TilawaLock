import 'dart:async';
import 'package:usage_stats/usage_stats.dart';
import 'local_database_manager.dart';

class UsageTrackingService {
  Timer? _timer;
  final _controller = StreamController<String>.broadcast();

  Stream<String> get foregroundAppStream => _controller.stream;

  void startMonitoring() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      DateTime endDate = DateTime.now();
      DateTime startDate = endDate.subtract(const Duration(seconds: 5));

      List<UsageInfo> usageStats = await UsageStats.queryUsageStats(startDate, endDate);
      
      if (usageStats.isNotEmpty) {
        // Find the one with most recent lastTimeUsed
        usageStats.sort((a, b) => b.lastTimeUsed!.compareTo(a.lastTimeUsed!));
        String currentApp = usageStats.first.packageName!;
        _controller.add(currentApp);
        
        _checkIfAppShouldBeLocked(currentApp);
      }
    });
  }

  void stopMonitoring() {
    _timer?.cancel();
  }

  void _checkIfAppShouldBeLocked(String packageName) {
    List<String> lockedApps = LocalDatabaseManager.getLockedApps();
    if (lockedApps.contains(packageName)) {
      // Check if usage limit exceeded
      // This part would involve tracking daily time per app
      // For this prototype, we'll signal a lock if it's a locked app
      print("Locked app detected: $packageName");
    }
  }
}
