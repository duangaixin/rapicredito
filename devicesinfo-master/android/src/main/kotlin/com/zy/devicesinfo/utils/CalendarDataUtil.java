package com.zy.devicesinfo.utils;

import android.annotation.SuppressLint;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;
import com.zy.devicesinfo.UtilsApp;
import com.zy.devicesinfo.data.CalendarData;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class CalendarDataUtil {

    private static String CALENDER_EVENT_URL = "content://com.android.calendar/events";

    @SuppressLint("Range")
    public static ArrayList<CalendarData> getCalenderList() {
        String startTime = "";
        String endTime = "";
        String eventTitle = "";
        String description = "";
        String location = "";
        String week = "";

        ArrayList<CalendarData> arr = new ArrayList<CalendarData>();
        try {

            Cursor eventCursor = UtilsApp.getApp().getContentResolver().query(Uri.parse(CALENDER_EVENT_URL), null,
                    null, null, "dtstart" + " DESC");
            while (eventCursor.moveToNext()) {

                eventTitle = eventCursor.getString(eventCursor.getColumnIndex("title"));
                description = eventCursor.getString(eventCursor.getColumnIndex("description"));
                location = eventCursor.getString(eventCursor.getColumnIndex("eventLocation"));
                startTime = eventCursor.getString(eventCursor.getColumnIndex("dtstart"));
                endTime = eventCursor.getString(eventCursor.getColumnIndex("dtend"));
                if (TextUtils.isEmpty(description)) {
                    description = "";
                }
                CalendarData item = new CalendarData();
                SimpleDateFormat dateFormat = new SimpleDateFormat(
                        "yyyy-MM-dd hh:mm:ss");
                Date d = new Date(Long.parseLong(startTime));
                String startDate = dateFormat.format(d);
                Date d1 = new Date(Long.parseLong(endTime));
                String endDate = dateFormat.format(d1);
                item.startTime = startDate;
                item.endTime = endDate;
                item.location = location;
                item.description = description;
                item.eventTitle = eventTitle;
                arr.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return arr;
        }
        return arr;
    }
}
