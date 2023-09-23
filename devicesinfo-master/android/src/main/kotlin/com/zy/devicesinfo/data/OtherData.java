package com.zy.devicesinfo.data;

import static com.zy.devicesinfo.utils.OtherUtils.checkDeviceHasNavigationBar;
import static com.zy.devicesinfo.utils.OtherUtils.checkVPN;
import static com.zy.devicesinfo.utils.OtherUtils.getBootTime;
import static com.zy.devicesinfo.utils.OtherUtils.getHostAndPort;
import static com.zy.devicesinfo.utils.OtherUtils.getMobileDbm;
import static com.zy.devicesinfo.utils.OtherUtils.getPhoneMode;
import static com.zy.devicesinfo.utils.OtherUtils.getProxyAddress;
import static com.zy.devicesinfo.utils.OtherUtils.isAirplaneModeOn;
import static com.zy.devicesinfo.utils.OtherUtils.isAppRoot;
import static com.zy.devicesinfo.utils.OtherUtils.isEmulator;
import static com.zy.devicesinfo.utils.OtherUtils.isMockLocation;

import android.os.SystemClock;

public class OtherData {

    public int rootJailbreak;
    public int intSimulator;
    public int keyboard;
    public int ringerMode;
    public String dbm;

    public String httpProxyHostPort;
    public String vpnAddress;
    public int isUsingVpn;
    public int isMockLocation;
    public int isAirplaneMode;

    public long lastBootTime;
    public Long totalBootTimeWake;
    public Long totalBootTime;

    {
        totalBootTime = SystemClock.elapsedRealtime();
        totalBootTimeWake = SystemClock.uptimeMillis();
        rootJailbreak = isAppRoot();
        intSimulator = isEmulator();
        keyboard = checkDeviceHasNavigationBar();
        ringerMode = getPhoneMode();
        //        dbm = getMobileDbm();
        dbm = getMobileDbm();
        lastBootTime = getBootTime();
        isUsingVpn = checkVPN();
        vpnAddress = getProxyAddress();
        httpProxyHostPort = getHostAndPort();
        isMockLocation = isMockLocation();
        isAirplaneMode = isAirplaneModeOn();
    }

}
