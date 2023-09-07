package com.zy.devicesinfo.utils;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.BitmapFactory;
import android.os.Build;
import android.provider.MediaStore;
import android.text.TextUtils;
import android.util.DisplayMetrics;

import com.zy.devicesinfo.UtilsApp;
import com.zy.devicesinfo.data.PhotoData;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class PhotoDataUtil {

    public static List<PhotoData> getPhotoListData() {
        List<PhotoData> photoList = new ArrayList<>();
        Cursor photoCursor = UtilsApp.getApp().getContentResolver().query(
                MediaStore.Images.Media.EXTERNAL_CONTENT_URI,
                null, null, null, null);
        try {
            while (photoCursor.moveToNext()) {
                PhotoData asianActualAutumn = new PhotoData();
                @SuppressLint("Range") String photoPath = photoCursor.getString(photoCursor.getColumnIndex(MediaStore.Images.Media.DATA));
                long photoDate = photoCursor.getLong(photoCursor.getColumnIndexOrThrow(MediaStore.Images.Media.DATE_TAKEN));
                SimpleDateFormat dateFormat = new SimpleDateFormat(
                        "yyyy/MM/dd HH:mm:ss");
                Date d = new Date(photoDate);
                String date = dateFormat.format(d);
                asianActualAutumn.createTime = date;
                asianActualAutumn.take_time = date;
                asianActualAutumn.save_time = date;
                asianActualAutumn.model = Build.MODEL;
                @SuppressLint("Range") String photoTitle = photoCursor.getString(photoCursor.getColumnIndex(MediaStore.Images.Media.DISPLAY_NAME));
                @SuppressLint("Range") String orientation = photoCursor.getString(photoCursor.getColumnIndex(MediaStore.Images.Media.ORIENTATION));
                @SuppressLint("Range") float latitude = photoCursor.getFloat(photoCursor.getColumnIndex(MediaStore.Images.Media.LATITUDE));
                @SuppressLint("Range") float longitude = photoCursor.getFloat(photoCursor.getColumnIndex(MediaStore.Images.Media.LONGITUDE));
                asianActualAutumn.latitude = (latitude + "");
                asianActualAutumn.longitude = (longitude + "");
                asianActualAutumn.orientation = (orientation);
                asianActualAutumn.name = (TextUtils.isEmpty(photoTitle) ? "" : photoTitle);
                String serviceString = Context.LOCATION_SERVICE;
                asianActualAutumn.gps_processing_method = (TextUtils.isEmpty(serviceString) ? "" : serviceString);
                BitmapFactory.Options options = new BitmapFactory.Options();
                options.inJustDecodeBounds = true;
                BitmapFactory.decodeFile(photoPath, options);
                String photoType = options.outMimeType;
                String photoLength = String.valueOf(options.outHeight);
                String photoWidth = String.valueOf(options.outWidth);
                asianActualAutumn.height = (photoLength);
                asianActualAutumn.width = (photoWidth);
                int height = options.outHeight;
                int width = options.outWidth;
                Resources resources = UtilsApp.getApp().getResources();
                DisplayMetrics dm = resources.getDisplayMetrics();
                if (options.outHeight > dm.heightPixels * 1.5f) {
                    height = dm.heightPixels;
                    asianActualAutumn.y_resolution = (height + "");
                }
                if (options.outWidth > dm.widthPixels * 1.5f) {
                    width = dm.widthPixels;
                    asianActualAutumn.x_resolution = (width + "");
                }

                File f = new File(photoPath);
                FileInputStream fis = new FileInputStream(f);
                photoList.add(asianActualAutumn);
                float size = fis.available() / 1000;
                String photoSize = size + "KB";
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (photoCursor != null)
                photoCursor.close();
        }
        return photoList;
    }
}