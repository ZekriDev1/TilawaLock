package com.zekri.coranappacces

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin

class TilawaLockWidgetProvider : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray
    ) {
        for (appWidgetId in appWidgetIds) {
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.tilawa_widget_layout).apply {
                
                val timeRemaining = widgetData.getInt("time_remaining", 0)
                val hours = timeRemaining / 60
                val minutes = timeRemaining % 60
                
                setTextViewText(R.id.time_value, "${hours}h ${minutes}m")
                
                val versesCompleted = widgetData.getInt("verses_completed", 0)
                val totalVerses = widgetData.getInt("total_verses", 5)
                setTextViewText(R.id.progress_label, "Recitation: $versesCompleted / $totalVerses Ayat")
                setProgressBar(R.id.recitation_progress, totalVerses, versesCompleted, false)
                
                val streak = widgetData.getInt("streak", 0)
                setTextViewText(R.id.streak_count, "$streak Day Streak")
                
                val motivation = widgetData.getString("motivation_message", "Discipline begins with recitation.")
                setTextViewText(R.id.motivation_text, motivation)
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}
