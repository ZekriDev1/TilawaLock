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
      int limitMinutes = LocalDatabaseManager.getUsageLimit();
      
      // Get today's usage for this app
      String todayKey = "usage_${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}";
      Map usageData = LocalDatabaseManager.statsBox.get(todayKey, defaultValue: {});
      int currentMinutes = usageData[packageName] ?? 0;
      
      // Update usage (adding 2 seconds as per timer interval)
      currentMinutes += 2; // This is actually seconds, let's track in seconds for precision
      usageData[packageName] = currentMinutes;
      LocalDatabaseManager.statsBox.put(todayKey, usageData);

      if (currentMinutes >= (limitMinutes * 60)) {
        print("Usage limit exceeded for: $packageName. Signaling lock UI.");
        // In a real app, this would trigger the overlay
      }
    }
  }
}
