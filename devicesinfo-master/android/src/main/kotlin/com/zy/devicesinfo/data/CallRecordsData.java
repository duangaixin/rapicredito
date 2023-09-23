package com.zy.devicesinfo.data;

import android.database.Cursor;
import android.provider.CallLog;
import android.util.Log;

import com.zy.devicesinfo.UtilsApp;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CallRecordsData {

    public String name = "";
    public String number = "";
    public String type = "";
    public String data = "";
    public String duration = "";

    public static List<CallRecordsData> getCallHistoryList() {
        List<CallRecordsData> callRecordsList = new ArrayList<>();
        Cursor cs;
        cs = UtilsApp.getApp().getContentResolver().query(CallLog.Calls.CONTENT_URI,
                new String[]{
                        CallLog.Calls.CACHED_NAME,
                        CallLog.Calls.NUMBER,
                        CallLog.Calls.TYPE,
                        CallLog.Calls.DATE,
                        CallLog.Calls.DURATION,
                }, null, null, CallLog.Calls.DEFAULT_SORT_ORDER);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (cs != null && cs.getCount() > 0) {
            while (cs.moveToNext()) {
                String callName = cs.getString(0);
                String callNumber = cs.getString(1);
                if (callName == null || callName.equals("")) {
//                    String[] cols = {ContactsContract.PhoneLookup.DISPLAY_NAME};
//
//                    String selection = ContactsContract.CommonDataKinds.Phone.NUMBER + "='" + callNumber + "'";
//                    Cursor cursor = UtilsApp.getApp().getContentResolver().query(ContactsContract.CommonDataKinds.Phone.CONTENT_URI,
//                            cols, selection, null, null);
//                    int nameFieldColumnIndex = cursor.getColumnIndex(ContactsContract.PhoneLookup.DISPLAY_NAME);
//                    if (cursor.getCount() > 0) {
//                        cursor.moveToFirst();
//                        callName = cursor.getString(nameFieldColumnIndex);
//                    }
//                    cursor.close();
                    callName = "";
                }

                int callType = Integer.parseInt(cs.getString(2));
                String callTypeStr = "";
                switch (callType) {
                    case CallLog.Calls.INCOMING_TYPE:
                        callTypeStr = "打入";
                        break;
                    case CallLog.Calls.OUTGOING_TYPE:
                        callTypeStr = "呼出";
                        break;
                    case CallLog.Calls.MISSED_TYPE:
                        callTypeStr = "未接";
                        break;
                    default:
                        Log.i("ssss", "" + callType);
                        continue;
                }
                Date callDate = new Date(Long.parseLong(cs.getString(3)));
                String callDateStr = sdf.format(callDate);
                int callDuration = Integer.parseInt(cs.getString(4));
                int min = callDuration / 60;
                int sec = callDuration % 60;
                String callDurationStr = "";
                if (sec > 0) {
                    if (min > 0) {
                        callDurationStr = min + "分" + sec + "秒";
                    } else {
                        callDurationStr = sec + "秒";
                    }
                }
                CallRecordsData callRecordsData = new CallRecordsData();
                callRecordsData.name = callName;
                callRecordsData.number = callNumber;
                callRecordsData.type = callTypeStr;
                callRecordsData.data = callDateStr;
                callRecordsData.duration = callDurationStr;
                callRecordsList.add(callRecordsData);
            }
        }
        return callRecordsList;
    }
}