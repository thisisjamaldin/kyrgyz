package com.joma.kyrgyz

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.util.Log
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetPlugin


class HomeWidgetProvider : AppWidgetProvider() {

    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray) {
        for (appWidgetId in appWidgetIds) {
            // Get reference to SharedPreferences
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.widget).apply {
                Log.e("-----123", "${widgetData.getString("imageUrl", "")}")
                // Get chart image and put it in the widget, if it exists
                val loader = LoadImageTask()
                loader.execute(widgetData.getString("imageUrl", ""))
                loader.r.observeForever {
                    setImageViewBitmap(R.id.widget_image, it)
                }
                // End new code
            }
            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}