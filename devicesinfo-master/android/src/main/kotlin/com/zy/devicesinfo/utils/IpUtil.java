package com.zy.devicesinfo.utils;

import com.zy.devicesinfo.data.IpData;

import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.Enumeration;



public class IpUtil {
    public static  IpData getIpData() {
        IpData data = new IpData();
        try {
            data.firstIp = getLocalIPAddress();
            data.second_ip = getLocalIPAddress();
        } catch (Exception e) {
            e.printStackTrace();
            return data;
        }
        return data;

    }

    public  static String getLocalIPAddress() {
        try {
            for (Enumeration<NetworkInterface> en = NetworkInterface.getNetworkInterfaces(); en.hasMoreElements(); ) {
                NetworkInterface intf = en.nextElement();
                for (Enumeration<InetAddress> enumIpAddr = intf.getInetAddresses(); enumIpAddr.hasMoreElements(); ) {
                    InetAddress inetAddress = enumIpAddr.nextElement();
                    if (!inetAddress.isLoopbackAddress() && inetAddress instanceof Inet4Address) {
                        // return inetAddress.getAddress().toString();
                        return inetAddress.getHostAddress().toString();
                    }
                }
            }
        } catch (Exception ex) {
        }

        return null;
    }

}
