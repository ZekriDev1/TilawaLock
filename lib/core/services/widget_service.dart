import 'package:home_widget/home_widget.dart';
import 'dart:io';

class WidgetService {
  static const String androidWidgetName = 'TilawaLockWidgetProvider';
  static const String iOSWidgetName = 'TilawaLockWidget';

  static Future<void> updateWidgetData({
    required int timeRemainingMinutes,
    required int versesCompleted,
    required int totalVerses,
    required int streak,
    required String message,
  }) async {
    try {
      await HomeWidget.setAppGroupId('group.com.zekri.coranappacces');
      await HomeWidget.saveWidgetData<int>('time_remaining', timeRemainingMinutes);

      await HomeWidget.saveWidgetData<int>('verses_completed', versesCompleted);
      await HomeWidget.saveWidgetData<int>('total_verses', totalVerses);
      await HomeWidget.saveWidgetData<int>('streak', streak);
      await HomeWidget.saveWidgetData<String>('motivation_message', message);
      
      // Update the widget
      await HomeWidget.updateWidget(
        androidName: androidWidgetName,
        iOSName: iOSWidgetName,
      );
    } catch (e) {
      print('Error updating widget: $e');
    }
  }
}
