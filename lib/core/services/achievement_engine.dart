import '../services/local_database_manager.dart';

class AchievementEngine {
  static Future<void> checkAchievements() async {
    int streak = LocalDatabaseManager.getStreak();
    int points = LocalDatabaseManager.getPoints();

    // Logic to unlock badges based on streak, points, etc.
    if (streak >= 7) {
      await _unlockBadge('7_day_streak');
    }
    if (streak >= 30) {
      await _unlockBadge('30_day_streak');
    }
    if (points >= 1000) {
      await _unlockBadge('centurion_points');
    }
  }

  static Future<void> _unlockBadge(String badgeId) async {
    List<String> currentBadges = List<String>.from(
      LocalDatabaseManager.statsBox.get('badges', defaultValue: []),
    );
    if (!currentBadges.contains(badgeId)) {
      currentBadges.add(badgeId);
      await LocalDatabaseManager.statsBox.put('badges', currentBadges);
      print("New Achievement Unlocked: $badgeId");
    }
  }

  static Future<void> addPoints(int points) async {
    int currentPoints = LocalDatabaseManager.statsBox.get('points', defaultValue: 0);
    await LocalDatabaseManager.statsBox.put('points', currentPoints + points);
    await checkAchievements();
  }
}
