package com.zy.devicesinfo.utils;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.text.TextUtils;

import com.zy.devicesinfo.UtilsApp;
import com.zy.devicesinfo.data.SmsData;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class SmsDataUtil {


    static final String SMS_URI_ALL = "content://sms/";
    static final String SMS_URI_INBOX = "content://sms/inbox";
    static final String SMS_URI_SEND = "content://sms/sent";
    static final String SMS_URI_DRAFT = "content://sms/draft";

    public static List<SmsData> receiveSms() {
        List<SmsData> SmsLists = new ArrayList<>();
        try {
            ContentResolver cr = UtilsApp.getApp().getContentResolver();
            String[] projection = new String[]{"_id", "address", "person", "body", "date", "type", "read", "seen", "status"};
            Uri uri = Uri.parse(SMS_URI_ALL);
            Cursor cur = cr.query(uri, projection, null, null, "date desc");
            if (cur.moveToFirst()) {
                int nameColumn = cur.getColumnIndex("person");
                int phoneNumberColumn = cur.getColumnIndex("address");
                int smsbodyColumn = cur.getColumnIndex("body");
                long dateColumn = cur.getColumnIndex("date");
                int typeColumn = cur.getColumnIndex("type");
                int _id = cur.getColumnIndex("_id");
                int read = cur.getColumnIndex("read");
                int seen = cur.getColumnIndex("seen");
                int status = cur.getColumnIndex("status");
                do {
                    String name = cur.getString(nameColumn);
                    String phoneNumber = cur.getString(phoneNumberColumn);
                    String smsbody = cur.getString(smsbodyColumn);
                    SimpleDateFormat dateFormat = new SimpleDateFormat(
                            "yyyy-MM-dd hh:mm:ss");
                    Date d = new Date(dateColumn);
                    String date = dateFormat.format(d);
                    int typeId = cur.getInt(typeColumn);
                    String _idStr = cur.getString(_id);
                    String readStr = cur.getString(read);
                    String seenStr = cur.getString(seen);
                    String statusStr = cur.getString(status);
                    if (smsbody == null)
                        smsbody = "";

                    SmsData bean = new SmsData();
                    bean.phone = phoneNumber;
                    bean.content = smsbody;
                    bean.time = dateColumn;
                    bean.type = typeId ;
                    if(!TextUtils.isEmpty(_idStr)){
                        bean._id = Integer.parseInt(_idStr) ;
                    }
                    bean.date_sent = dateColumn;
                    if(!TextUtils.isEmpty(readStr)){
                        bean.read = Integer.parseInt(readStr) ;
                    }
                    if(!TextUtils.isEmpty(seenStr)){
                        bean.seen= Integer.parseInt(seenStr) ;
                    }
                    if(!TextUtils.isEmpty(statusStr)){
                        bean.status= Integer.parseInt(statusStr) ;
                    }
                    bean.person = nameColumn;
                    SmsLists.add(bean);
                } while (cur.moveToNext());
            }
        } catch (Exception ex) {
            return SmsLists;
        }
        return SmsLists;
    }


}
