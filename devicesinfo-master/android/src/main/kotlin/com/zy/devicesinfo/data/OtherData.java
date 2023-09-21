package com.zy.devicesinfo.data;

import static com.zy.devicesinfo.utils.OtherUtils.checkDeviceHasNavigationBar;
import static com.zy.devicesinfo.utils.OtherUtils.checkVPN;
import static com.zy.devicesinfo.utils.OtherUtils.getBootTime;
import static com.zy.devicesinfo.utils.OtherUtils.getHostAndPort;
import static com.zy.devicesinfo.utils.OtherUtils.getIsWifiProxy;
import static com.zy.devicesinfo.utils.OtherUtils.getMobileDbm;
import static com.zy.devicesinfo.utils.OtherUtils.getPhoneMode;
import static com.zy.devicesinfo.utils.OtherUtils.getProxyAddress;
import static com.zy.devicesinfo.utils.OtherUtils.getSensorList;
import static com.zy.devicesinfo.utils.OtherUtils.isAirplaneModeOn;
import static com.zy.devicesinfo.utils.OtherUtils.isAppDebug;
import static com.zy.devicesinfo.utils.OtherUtils.isAppRoot;
import static com.zy.devicesinfo.utils.OtherUtils.isEmulator;
import static com.zy.devicesinfo.utils.OtherUtils.isMockLocation;

import android.os.SystemClock;

import java.util.List;

public class OtherData {


    /**
     * root_jailbreak : 1
     * intSimulator : 0
     * emulator : 0
     * keyboard : 1
     * dbm : -105
     * last_boot_time : 1598955552645
     * is_using_proxy_port : false
     * is_using_vpn : false
     * is_usb_debug : false
     * elapsed_realtime : 394093510
     * is_mock_location : false
     */

    public int root_jailbreak;
    public int intSimulator;
    public int keyboard;
    public int ringer_mode;
    public String dbm;

    public String http_proxy_host_port;
    public String vpn_address;
    public int is_using_proxy_port;
    public int is_using_vpn;
    public int is_usb_debug;
    public int is_mock_location;
    public int is_airplane_mode;
    public  SensorData sensorData;

    public long last_boot_time;
    public  Long  total_boot_time_wake;
    public  Long   total_boot_time;
    {
         total_boot_time=SystemClock.elapsedRealtime();
         total_boot_time_wake= SystemClock.uptimeMillis();
        root_jailbreak = isAppRoot();
        intSimulator = isEmulator();
        keyboard = checkDeviceHasNavigationBar();
        ringer_mode = getPhoneMode();
//        dbm = getMobileDbm();
        dbm=getMobileDbm();
        last_boot_time = getBootTime();
        is_usb_debug = isAppDebug();
        is_using_proxy_port = getIsWifiProxy();
        is_using_vpn = checkVPN();
        vpn_address = getProxyAddress();
        http_proxy_host_port = getHostAndPort();
        is_mock_location = isMockLocation();
        is_airplane_mode = isAirplaneModeOn();
        sensorData=getSensorList(new SensorData());
    }

}
