import '../services/local_database_manager.dart';

class AchievementEngine {
  static Future<void> checkAchievements() async {
    int streak = LocalDatabaseManager.getStreak();
    // Logic to unlock badges based on streak, points, etc.
    if (streak >= 7) {
      await _unlockBadge('7_day_streak');
    }
  }

  static Future<void> _unlockBadge(String badgeId) async {
    // Save to local storage
  }

  static Future<void> addPoints(int points) async {
    int currentPoints = LocalDatabaseManager.statsBox.get('points', defaultValue: 0);
    await LocalDatabaseManager.statsBox.put('points', currentPoints + points);
    await checkAchievements();
  }
}
