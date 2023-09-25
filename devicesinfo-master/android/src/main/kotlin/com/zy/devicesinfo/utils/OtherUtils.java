package com.zy.devicesinfo.utils;

import static android.content.Context.INPUT_SERVICE;
import static com.zy.devicesinfo.utils.Md5Utils.string2MD5;
import static com.zy.devicesinfo.utils.MediaFilesUtils.isSDCardEnableByEnvironment;
import static com.zy.devicesinfo.utils.NetWorkUtils.getMacAddress;

import android.Manifest;
import android.annotation.SuppressLint;
import android.app.ActivityManager;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.database.Cursor;
import android.graphics.Point;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.hardware.input.InputManager;
import android.media.AudioManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.os.SystemClock;
import android.os.storage.StorageManager;
import android.provider.ContactsContract;
import android.provider.Settings;
import android.telephony.CellInfo;
import android.telephony.CellInfoCdma;
import android.telephony.CellInfoGsm;
import android.telephony.CellInfoLte;
import android.telephony.CellInfoWcdma;
import android.telephony.CellSignalStrengthCdma;
import android.telephony.CellSignalStrengthGsm;
import android.telephony.CellSignalStrengthLte;
import android.telephony.CellSignalStrengthWcdma;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.text.format.Formatter;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.InputDevice;
import android.view.KeyCharacterMap;
import android.view.KeyEvent;
import android.view.ViewConfiguration;
import android.view.WindowManager;

import androidx.annotation.RequiresApi;
import androidx.core.app.ActivityCompat;

import com.zy.devicesinfo.UtilsApp;
import com.zy.devicesinfo.data.SensorData;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.List;

public class OtherUtils {

    private static final String LINE_SEP = System.getProperty("line.separator");


    private static TelephonyManager getTelephonyManager() {
        return (TelephonyManager) UtilsApp.getApp().getSystemService(Context.TELEPHONY_SERVICE);
    }

    /**
     * BASEBAND-VER
     * 基带版本
     * return String
     */
    public static String getBaseband_Ver() {
        String Version = "";
        try {
            Class cl = Class.forName("android.os.SystemProperties");
            Object invoker = cl.newInstance();
            Method m = cl.getMethod("get", new Class[]{String.class, String.class});
            Object result = m.invoke(invoker, new Object[]{"gsm.version.baseband", "no message"});
            Version = (String) result;
        } catch (Exception e) {
        }
        return Version;
    }


    /**
     * 获取屏幕宽高
     *
     * @return
     */
    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR1)
    public static String getResolutions() {
        //获取真实屏幕宽高
        Point outSize = new Point();
        WindowManager wm = (WindowManager) UtilsApp.getApp().getSystemService(Context.WINDOW_SERVICE);
        wm.getDefaultDisplay().getRealSize(outSize);
        int x = outSize.x;
        int y = outSize.y;
        return x + "*" + y;
    }


    /**
     * 获取手机序列号
     *
     * @return 手机序列号
     */
    public static String getSerialNumbers() {
        String serial = "";
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {//9.0+
                serial = Build.getSerial();
            } else if (Build.VERSION.SDK_INT > Build.VERSION_CODES.N) {//8.0+
                serial = Build.SERIAL;
            } else {//8.0-
                Class<?> c = Class.forName("android.os.SystemProperties");
                Method get = c.getMethod("get", String.class);
                serial = (String) get.invoke(c, "ro.serialno");
            }
        } catch (Exception e) {
            e.printStackTrace();
            Log.e("e", "读取设备序列号异常：" + e.toString());
        }
        return serial;
    }


    /**
     * 获取手机的物理尺寸
     *
     * @return
     */
    public static String getScreenSizeOfDevice2() {
        Point point = new Point();
        WindowManager wm = (WindowManager) UtilsApp.getApp().getSystemService(Context.WINDOW_SERVICE);
        wm.getDefaultDisplay().getRealSize(point);
        DisplayMetrics dm = UtilsApp.getApp().getResources().getDisplayMetrics();
        double x = Math.pow(point.x / dm.xdpi, 2);
        double y = Math.pow(point.y / dm.ydpi, 2);
        double screenInches = Math.sqrt(x + y);
        return String.valueOf(screenInches);
    }


    /**
     * @return 获取当前SIM卡数量
     */
    @SuppressLint("MissingPermission")
    public static int getJudgeSIMCount() {
        if (ActivityCompat.checkSelfPermission(UtilsApp.getApp(), Manifest.permission.READ_PHONE_STATE)
                != PackageManager.PERMISSION_GRANTED) {
            return 0;
        }
        int count = 0;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP_MR1) {
            count = SubscriptionManager.from(UtilsApp.getApp()).getActiveSubscriptionInfoCount();
            return count;
        }
        return count;
    }


    /**
     * @return 获取当前SIM卡槽数量
     */
    public static int getPhoneSimCount() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            return getTelephonyManager().getPhoneCount();
        }
        return 0;
    }

    @SuppressLint("HardwareIds")
    public static String getSimSerialNumbers() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            return "";
        }
        String simSerialNumber = getTelephonyManager().getSimSerialNumber();
        return simSerialNumber;
    }

    public static String getSimCountryIsos() {
        return getTelephonyManager().getSimCountryIso();
    }


    /**
     * 手机是否有root权限
     *
     * @return
     */
    public static int isAppRoot() {
        int result = 0;
        if (isDeviceRooted()) {
            result = 1;
        }
        return result;
    }

    public static boolean isDeviceRooted() {
        return checkRootMethod1() || checkRootMethod2() || checkRootMethod3();
    }

    private static boolean checkRootMethod1() {
        String buildTags = Build.TAGS;
        return buildTags != null && buildTags.contains("test-keys");
    }

    private static boolean checkRootMethod2() {
        String[] paths = {"/system/app/Superuser.apk", "/sbin/su", "/system/bin/su", "/system/xbin/su", "/data/local/xbin/su", "/data/local/bin/su", "/system/sd/xbin/su",
                "/system/bin/failsafe/su", "/data/local/su", "/su/bin/su"};
        for (String path : paths) {
            if (new File(path).exists())
                return true;
        }
        return false;
    }

    private static boolean checkRootMethod3() {
        Process process = null;
        try {
            process = Runtime.getRuntime().exec(new String[]{"/system/xbin/which", "su"});
            BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
            if (in.readLine() != null)
                return true;
            return false;
        } catch (Throwable t) {
            return false;
        } finally {
            if (process != null)
                process.destroy();
        }
    }


    /**
     * 是否是模拟器
     *
     * @return
     */
    public static int isEmulator() {
        boolean checkProperty = Build.FINGERPRINT.startsWith("generic")
                || Build.FINGERPRINT.toLowerCase().contains("vbox")
                || Build.FINGERPRINT.toLowerCase().contains("test-keys")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.MANUFACTURER.contains("Genymotion")
                || (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"))
                || "google_sdk".equals(Build.PRODUCT);
        if (checkProperty)
            return 1;
        String operatorName = "";
        TelephonyManager tm = (TelephonyManager) UtilsApp.getApp().getSystemService(Context.TELEPHONY_SERVICE);
        if (tm != null) {
            String name = tm.getNetworkOperatorName();
            if (name != null) {
                operatorName = name;
            }
        }
        boolean checkOperatorName = operatorName.toLowerCase().equals("android");
        if (checkOperatorName)
            return 1;

        String url = "tel:" + "123456";
        Intent intent = new Intent();
        intent.setData(Uri.parse(url));
        intent.setAction(Intent.ACTION_DIAL);
        boolean checkDial = intent.resolveActivity(UtilsApp.getApp().getPackageManager()) == null;
        if (checkDial)
            return 1;
        return 0;
    }

    public static int isMockLocation() {
        boolean isOpen = Settings.Secure.getInt(UtilsApp.getApp().getContentResolver(), Settings.Secure.ALLOW_MOCK_LOCATION, 0) != 0;
        if (isOpen) {
            return 1;
        } else {
            return 0;
        }
    }

    /**
     * 开发者模式 是否开启
     *
     * @return
     */
    public static int isAppDebug() {
        boolean b = Settings.Secure.getInt(UtilsApp.getApp().getContentResolver(), Settings.Secure.ADB_ENABLED, 0) > 0;
        if (b) {
            return 1;
        } else {
            return 0;
        }
    }

    public static int isAirplaneModeOn() {
        boolean b = Settings.Global.getInt(UtilsApp.getApp().getContentResolver(),
                Settings.Global.AIRPLANE_MODE_ON, 0) != 0;
        if (b) {
            return 1;
        } else {
            return 0;
        }
    }

    public static int getPhoneMode() {
        AudioManager audioManager = (AudioManager) UtilsApp.getApp().getSystemService(Context.AUDIO_SERVICE);
        return audioManager.getRingerMode();
    }

    /**
     * 判断设备 是否使用代理上网
     *
     * @return
     */
    public static String getProxyAddress() {
        String port = "";
        if (checkVPN() == 1) {
            try {
                for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements(); ) {
                    NetworkInterface intf = en.nextElement();
                    for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements(); ) {
                        InetAddress inetAddress = enumIpAddr.nextElement();
                        if (!inetAddress.isLoopbackAddress()) {
                            if (intf.getName().contains("tun")) {
                                port = Formatter.formatIpAddress(inetAddress.hashCode());
                            }
                        }
                    }
                }
            } catch (SocketException ex) {
                ex.printStackTrace();
            }
        }
        return port;
    }

    /**
     * 判断设备 是否使用代理上网
     *
     * @return
     */
    public static int getIsWifiProxy() {
        final boolean IS_ICS_OR_LATER = Build.VERSION.SDK_INT >= Build.VERSION_CODES.ICE_CREAM_SANDWICH;
        String proxyAddress;
        int proxyPort;
        if (IS_ICS_OR_LATER) {
            proxyAddress = System.getProperty("http.proxyHost");
            String portStr = System.getProperty("http.proxyPort");
            proxyPort = Integer.parseInt((portStr != null ? portStr : "-1"));
        } else {
            proxyAddress = android.net.Proxy.getHost(UtilsApp.getApp());
            proxyPort = android.net.Proxy.getPort(UtilsApp.getApp());
        }
        boolean b = (!TextUtils.isEmpty(proxyAddress)) && (proxyPort != -1);
        if (b) {
            return 1;
        } else {
            return 0;
        }
    }

    public static String getHostAndPort() {
        final boolean IS_ICS_OR_LATER = Build.VERSION.SDK_INT >= Build.VERSION_CODES.ICE_CREAM_SANDWICH;
        String proxyAddress;
        int proxyPort;
        if (IS_ICS_OR_LATER) {
            proxyAddress = System.getProperty("http.proxyHost");
            String portStr = System.getProperty("http.proxyPort");
            proxyPort = Integer.parseInt((portStr != null ? portStr : "-1"));
        } else {
            proxyAddress = android.net.Proxy.getHost(UtilsApp.getApp());
            proxyPort = android.net.Proxy.getPort(UtilsApp.getApp());
        }
        if (TextUtils.isEmpty(proxyAddress) && proxyPort == -1) {
            return "";
        }
        return proxyAddress + ":" + proxyPort;
    }

    /**
     * 获取手机开机时间
     *
     * @return
     */
    public static long getBootTime() {
        return System.currentTimeMillis() - SystemClock.elapsedRealtimeNanos() / 1000000;
    }

    /**
     * 获取手机信号强度，需添加权限 android.permission.ACCESS_COARSE_LOCATION <br>
     * API要求不低于17 <br>
     *
     * @return 当前手机主卡信号强度, 单位 dBm（-1是默认值，表示获取失败）
     */
    @RequiresApi(api = Build.VERSION_CODES.JELLY_BEAN_MR2)
    @SuppressLint("MissingPermission")
    public static int getMyMobileDbm() {
        int dbm = -1;
        TelephonyManager tm = (TelephonyManager) UtilsApp.getApp().getSystemService(Context.TELEPHONY_SERVICE);
        List<CellInfo> cellInfoList;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            cellInfoList = tm.getAllCellInfo();
            if (null != cellInfoList) {
                for (CellInfo cellInfo : cellInfoList) {
                    if (cellInfo instanceof CellInfoGsm) {
                        CellSignalStrengthGsm cellSignalStrengthGsm = ((CellInfoGsm) cellInfo).getCellSignalStrength();
                        dbm = cellSignalStrengthGsm.getDbm();
                    } else if (cellInfo instanceof CellInfoCdma) {
                        CellSignalStrengthCdma cellSignalStrengthCdma =
                                ((CellInfoCdma) cellInfo).getCellSignalStrength();
                        dbm = cellSignalStrengthCdma.getDbm();
                    } else if (cellInfo instanceof CellInfoWcdma) {
                        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
                            CellSignalStrengthWcdma cellSignalStrengthWcdma =
                                    ((CellInfoWcdma) cellInfo).getCellSignalStrength();
                            dbm = cellSignalStrengthWcdma.getDbm();
                        }
                    } else if (cellInfo instanceof CellInfoLte) {
                        CellSignalStrengthLte cellSignalStrengthLte = ((CellInfoLte) cellInfo).getCellSignalStrength();
                        dbm = cellSignalStrengthLte.getDbm();
                    }
                }
            }
        }
        return dbm;
    }

    @SuppressLint("NewApi")
    public static String getMobileDbm() {
        int dbm = -1;
        TelephonyManager tm = (TelephonyManager) UtilsApp.getApp().getSystemService(Context.TELEPHONY_SERVICE);

        try {
            List<CellInfo> cellInfoList = tm.getAllCellInfo();
            if (null != cellInfoList) {
                Iterator var3 = cellInfoList.iterator();

                while (var3.hasNext()) {
                    CellInfo cellInfo = (CellInfo) var3.next();
                    if (cellInfo instanceof CellInfoGsm) {
                        CellSignalStrengthGsm cellSignalStrengthGsm = ((CellInfoGsm) cellInfo).getCellSignalStrength();
                        dbm = cellSignalStrengthGsm.getDbm();
                    } else if (cellInfo instanceof CellInfoCdma) {
                        CellSignalStrengthCdma cellSignalStrengthCdma = ((CellInfoCdma) cellInfo).getCellSignalStrength();
                        dbm = cellSignalStrengthCdma.getDbm();
                    } else if (cellInfo instanceof CellInfoWcdma) {
                        CellSignalStrengthWcdma cellSignalStrengthWcdma = ((CellInfoWcdma) cellInfo).getCellSignalStrength();
                        dbm = cellSignalStrengthWcdma.getDbm();
                    } else if (cellInfo instanceof CellInfoLte) {
                        CellSignalStrengthLte cellSignalStrengthLte = ((CellInfoLte) cellInfo).getCellSignalStrength();
                        dbm = cellSignalStrengthLte.getDbm();
                    }
                }
            }
        } catch (Exception var6) {
        }

        return String.valueOf(dbm);
    }

    /**
     * 获取屏幕亮度
     *
     * @return 屏幕亮度 0-255
     */
    public static int getBrightness() {
        int value = 255;
        return Settings.System.getInt(
                UtilsApp.getApp().getContentResolver(),
                Settings.System.SCREEN_BRIGHTNESS, value);
    }


    /**
     * Return the total size of external storage
     *
     * @return the total size of external storage
     */
    public static long getExternalTotalSize() {
        return getFsTotalSize(getSDCardPathByEnvironment());
    }

    public static boolean isContainSdCard() {
        try {
            StorageManager mStorageManager = (StorageManager) UtilsApp.getApp().getSystemService(Context.STORAGE_SERVICE);
            Class storageVolumeClazz = null;
            try {
                storageVolumeClazz = Class.forName("android.os.storage.StorageVolume");
                Method getVolumeList = mStorageManager.getClass().getMethod("getVolumeList");
                Method isRemovable = storageVolumeClazz.getMethod("isRemovable");
                Object result = getVolumeList.invoke(mStorageManager);
                int length = Array.getLength(result);
                for (int i = 0; i < length; ++i) {
                    Object storageVolumeElement = Array.get(result, i);
                    boolean removable = (Boolean) isRemovable.invoke(storageVolumeElement);
                    //                    if (removable == canRemovable) {
                    //                        return true;
                    //                    }
                    return removable;
                }
            } catch (ClassNotFoundException var11) {
                var11.printStackTrace();
            } catch (InvocationTargetException var12) {
                var12.printStackTrace();
            } catch (NoSuchMethodException var13) {
                var13.printStackTrace();
            } catch (IllegalAccessException var14) {
                var14.printStackTrace();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    public static long getMemoryCardSize() {
        try {
            if (externalMemoryAvailable()) {
                File path = Environment.getExternalStorageDirectory();
                StatFs stat = new StatFs(path.getPath());
                long blockSize = 0;
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR2) {
                    blockSize = (long) stat.getBlockSizeLong();
                }
                long totalBlocks = 0;
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR2) {
                    totalBlocks = (long) stat.getBlockCountLong();
                }
                return totalBlocks * blockSize;
            } else {
                return -1L;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1L;
    }
    public static long getMemoryCardUsableSize() {
        try {
            if (externalMemoryAvailable()) {
                File path = Environment.getExternalStorageDirectory();
                StatFs stat = new StatFs(path.getPath());
                long blockSize = 0;
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR2) {
                    blockSize = (long) stat.getBlockSizeLong();
                }
                long availableBlocks = 0;
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.JELLY_BEAN_MR2) {
                    availableBlocks = (long) stat.getAvailableBlocksLong();
                }
                return availableBlocks * blockSize;
            } else {
                return -1L;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1L;
    }

    /**
     * Return the available size of external storage.
     *
     * @return the available size of external storage
     */
    public static long getExternalAvailableSize() {
        return getFsAvailableSize(getSDCardPathByEnvironment());
    }

    public static long getInternalTotalSize() {
        return getFsTotalSize(Environment.getDataDirectory().getAbsolutePath());
    }

    public static long getInternalAvailableSize() {
        return getFsAvailableSize(Environment.getDataDirectory().getAbsolutePath());
    }

    public static long getAppMaxMemory() {
        long maxMemory = (Runtime.getRuntime().maxMemory());
        return maxMemory;
    }

    public static long getAppAvailableMemory() {
        long totalMemory = Runtime.getRuntime().totalMemory();
        return totalMemory;
    }

    public static long getAppFreeMemory() {
        long freeMemory = Runtime.getRuntime().freeMemory();
        return freeMemory;
    }

    public static int getContactGroupCount() {
        if (ActivityCompat.checkSelfPermission(UtilsApp.getApp(), Manifest.permission.READ_CONTACTS)
                != PackageManager.PERMISSION_GRANTED) {
            return 0;
        }
        Uri uri = ContactsContract.Groups.CONTENT_URI;
        ContentResolver contentResolver = UtilsApp.getApp().getContentResolver();
        Cursor cursor = contentResolver.query(uri, new String[]{ContactsContract.Groups.TITLE, ContactsContract.Groups._ID}, null, null, null);
        int cursorCount = cursor.getCount();
        return cursorCount;
    }

    /**
     * 获取当前可用内存
     *
     * @return
     */
    public static long getAvailMemory() {
        ActivityManager am = (ActivityManager) UtilsApp.getApp().getSystemService(Context.ACTIVITY_SERVICE);
        ActivityManager.MemoryInfo mi = new ActivityManager.MemoryInfo();
        am.getMemoryInfo(mi);
        // mi.availMem; 当前系统的可用内存
        return mi.availMem;
    }

    public static long getRamTotalSize() {
        ActivityManager mActivityManager = (ActivityManager) UtilsApp.getApp().getSystemService(Context.ACTIVITY_SERVICE);
        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        mActivityManager.getMemoryInfo(memoryInfo);
        long memSize = memoryInfo.totalMem;
        return memSize;
    }

    public static long getRamUsableSize() {
        ActivityManager mActivityManager = (ActivityManager) UtilsApp.getApp().getSystemService(Context.ACTIVITY_SERVICE);
        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        mActivityManager.getMemoryInfo(memoryInfo);
        long memSize = memoryInfo.availMem;
        return memSize;
    }

    public static long getRamTotalPreSize() {
        String myDir = "/proc/meminfo";
        try {
            FileReader fr = new FileReader(myDir);
            BufferedReader br = new BufferedReader(fr, 2048);
            String memoryLine = br.readLine();
            String subMemoryLine = memoryLine.substring(memoryLine.indexOf("MemTotal:"));
            br.close();
            return Integer.parseInt(subMemoryLine.replaceAll("\\D+", "")) * 1024l;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static boolean externalMemoryAvailable() {
        return Environment.getExternalStorageState().equals("mounted");
    }

    public static long getRamUseAbleSize() {
        if (externalMemoryAvailable()) {
            File path = Environment.getExternalStorageDirectory();
            StatFs stat = new StatFs(path.getPath());
            long blockSize = (long) stat.getBlockSize();
            long totalBlocks = (long) stat.getBlockCount();
            return totalBlocks * blockSize;
        } else {
            return -1L;
        }
    }

    /**
     * 获取android总运行内存大小
     */
    public static long getTotalMemory() {
        String str1 = "/proc/meminfo";// 系统内存信息文件
        String str2;
        String[] arrayOfString;
        long initial_memory = 0;
        try {
            FileReader localFileReader = new FileReader(str1);
            BufferedReader localBufferedReader = new BufferedReader(localFileReader, 8192);
            str2 = localBufferedReader.readLine();
            arrayOfString = str2.split("\\s+");
            for (String num : arrayOfString) {
                Log.i(str2, num + "\t");
            }
            int i = Integer.valueOf(arrayOfString[1]).intValue();
            //int值乘以1024转换为long类型
            initial_memory = new Long((long) i * 1024);
            localBufferedReader.close();
        } catch (IOException e) {
        }
        return initial_memory;
    }


    public static long getFsTotalSize(String anyPathInFs) {
        if (TextUtils.isEmpty(anyPathInFs))
            return 0;
        StatFs statFs = new StatFs(anyPathInFs);
        long blockSize;
        long totalSize;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
            blockSize = statFs.getBlockSizeLong();
            totalSize = statFs.getBlockCountLong();
        } else {
            blockSize = statFs.getBlockSize();
            totalSize = statFs.getBlockCount();
        }
        return blockSize * totalSize;
    }

    public static long getFsAvailableSize(final String anyPathInFs) {
        if (TextUtils.isEmpty(anyPathInFs))
            return 0;
        StatFs statFs = new StatFs(anyPathInFs);
        long blockSize;
        long availableSize;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR2) {
            blockSize = statFs.getBlockSizeLong();
            availableSize = statFs.getAvailableBlocksLong();
        } else {
            blockSize = statFs.getBlockSize();
            availableSize = statFs.getAvailableBlocks();
        }
        return blockSize * availableSize;
    }

    public static String getSDCardPathByEnvironment() {
        if (isSDCardEnableByEnvironment()) {
            return Environment.getExternalStorageDirectory().getAbsolutePath();
        }
        return "";
    }

    public static float getScreenDensity() {
        return Resources.getSystem().getDisplayMetrics().density;
    }

    public static int getScreenDensityDpi() {
        return Resources.getSystem().getDisplayMetrics().densityDpi;
    }

    /**
     * 判断是否平板设备
     *
     * @return true:平板,false:手机
     */
    public static int isTabletDevice() {
        boolean b = (UtilsApp.getApp().getResources().getConfiguration().screenLayout & Configuration.SCREENLAYOUT_SIZE_MASK) >=
                Configuration.SCREENLAYOUT_SIZE_LARGE;
        if (b) {
            return 1;
        } else {
            return 0;
        }
    }

    public static String getDeviceid() {
        StringBuffer stringBuffer = new StringBuffer();
        String meid = "";
        String imei = "";
        String serial = "";
        String mac = "";
        String manufacturer = "";
        if (getJudgeSIMCount() == 2) {
            meid = GeneralUtils.getMeid();
            if (TextUtils.isEmpty(meid)) {
                imei = GeneralUtils.getIMEI(0);
                stringBuffer.append(imei).append("/");
            } else {
                stringBuffer.append(meid).append("/");
            }
        } else {
            imei = GeneralUtils.getIMEI(0);
            stringBuffer.append(imei).append("/");
        }
        serial = getSerialNumbers();
        manufacturer = Build.MANUFACTURER;
        if (TextUtils.isEmpty(serial)) {
            mac = getMacAddress();
            stringBuffer.append(mac).append("/");
        } else {
            stringBuffer.append(serial).append("/");
        }
        stringBuffer.append(manufacturer).append("/");
        stringBuffer.append(Build.BRAND).append("/");
        stringBuffer.append(Build.DEVICE).append("/");
        stringBuffer.append(Build.HARDWARE).append("/");
        stringBuffer.append(Build.MODEL).append("/");
        stringBuffer.append(Build.PRODUCT).append("/");
        stringBuffer.append(Build.TAGS).append("/");
        stringBuffer.append(Build.TYPE).append("/");
        stringBuffer.append(Build.USER).append("/");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            stringBuffer.append(Build.SUPPORTED_ABIS[0]).append("/");
        }
        stringBuffer.append(getResolutions()).append("/");
        stringBuffer.append(getScreenDensity()).append("/");
        stringBuffer.append(getScreenDensityDpi());
        return string2MD5(stringBuffer.toString());
    }


    /**
     * 获取 传感器列表
     *
     * @param sensorData
     * @return
     */
    public static List<SensorData.SensorInfo> getSensorList(SensorData sensorData) {
        SensorManager sensorManager = (SensorManager) UtilsApp.getApp().getSystemService(Context.SENSOR_SERVICE);
        List<Sensor> sensors = sensorManager.getSensorList(Sensor.TYPE_ALL);
        sensorData.sensorInfoList.clear();
        for (Sensor item : sensors) {
            SensorData.SensorInfo sensorInfo = new SensorData.SensorInfo();
            sensorInfo.type = item.getType();
            sensorInfo.name = item.getName();
            sensorInfo.version = item.getVersion();
            sensorInfo.vendor = item.getVendor();
            sensorInfo.max_range = item.getMaximumRange();
            sensorInfo.min_delay = item.getMinDelay();
            sensorInfo.power = item.getPower();
            sensorInfo.resolution = item.getResolution();
            sensorData.sensorInfoList.add(sensorInfo);
        }
        return sensorData.sensorInfoList;
    }

    public static String detectInputDeviceWithShell() {
        String deviceInfo = "";
        try {
            //获得外接USB输入设备的信息
            Process p = Runtime.getRuntime().exec("cat /proc/bus/input/devices");
            BufferedReader in = new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line = null;
            while ((line = in.readLine()) != null) {
                deviceInfo = line.trim();
                return deviceInfo;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deviceInfo;
    }


    public static String detectUsbDeviceWithInputManager() {
        String name = "";
        InputManager im = (InputManager) UtilsApp.getApp().getSystemService(INPUT_SERVICE);
        int[] devices = im.getInputDeviceIds();
        for (int id : devices) {
            InputDevice device = im.getInputDevice(id);
            name = device.getName();
        }
        return name;
    }


    public static int checkDeviceHasNavigationBar() {
        boolean hasMenuKey = ViewConfiguration.get(UtilsApp.getApp())
                .hasPermanentMenuKey();
        boolean hasBackKey = KeyCharacterMap
                .deviceHasKey(KeyEvent.KEYCODE_BACK);
        if (!hasMenuKey && !hasBackKey) {
            return 0;
        }
        return 1;
    }


    public static int checkVPN() {
        ConnectivityManager cm = (ConnectivityManager) UtilsApp.getApp().getSystemService(Context.CONNECTIVITY_SERVICE);
        boolean b = cm.getNetworkInfo(ConnectivityManager.TYPE_VPN).isConnectedOrConnecting();
        if (b) {
            return 1;
        } else {
            return 0;
        }
    }


    public static boolean isLoactionEnabled(Context context) {
        int locationMode = 0;
        String locationProviders;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            try {
                locationMode = Settings.Secure.getInt(context.getContentResolver(), Settings.Secure.LOCATION_MODE);
            } catch (Settings.SettingNotFoundException e) {
                e.printStackTrace();
                return false;
            }
            return locationMode != Settings.Secure.LOCATION_MODE_OFF;
        } else {
            locationProviders = Settings.Secure.getString(context.getContentResolver(), Settings.Secure.LOCATION_PROVIDERS_ALLOWED);
            return !TextUtils.isEmpty(locationProviders);
        }
    }


    public static int isNetState() {
        ConnectivityManager connectivityManager = (ConnectivityManager) UtilsApp.getApp().getSystemService(Context.CONNECTIVITY_SERVICE);
        NetworkInfo activeNetworkInfo = connectivityManager.getActiveNetworkInfo();
        if (activeNetworkInfo == null) {
            return 0;
        }
        int type = activeNetworkInfo.getType();
        switch (type) {
            case ConnectivityManager.TYPE_WIFI:
                return 1;
            case ConnectivityManager.TYPE_MOBILE:
                return 2;
            default:
                return 0;
        }
    }


    public static String getDeviceName() {
        return Settings.Secure.getString(UtilsApp.getApp().getContentResolver(), "bluetooth_name");
    }

}
