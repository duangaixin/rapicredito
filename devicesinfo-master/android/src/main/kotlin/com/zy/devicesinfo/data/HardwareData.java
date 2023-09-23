package com.zy.devicesinfo.data;

import static com.zy.devicesinfo.utils.OtherUtils.getBaseband_Ver;
import static com.zy.devicesinfo.utils.OtherUtils.getResolutions;
import static com.zy.devicesinfo.utils.OtherUtils.getScreenDensity;
import static com.zy.devicesinfo.utils.OtherUtils.getScreenDensityDpi;
import static com.zy.devicesinfo.utils.OtherUtils.getScreenSizeOfDevice2;
import static com.zy.devicesinfo.utils.OtherUtils.getSerialNumbers;
import static com.zy.devicesinfo.utils.OtherUtils.isTabletDevice;

import android.os.Build;
import com.zy.devicesinfo.utils.CpuUtils;
import com.zy.devicesinfo.utils.GeneralUtils;

public class HardwareData {

    public String model;
    public String brand;
    public String product;
    public String release;
    public String sdkVersionCode;
    public String physical_size;
    public String cpu_type;
    public int cpu_num;
    public String cpu_min;
    public String cpu_max;
    public String cpu_cur;
    public String manufacturer_name;
    public String board;
    public String serial_number;
    public String display;
    public String id;
    public String bootloader;
    public String finger_print;
    public String host;
    public String hardware;
    public String device;
    public String user;
    public String radio_version;
    public String tags;
    public String time;
    public String type;
    public String base_os;
    public String baseband_ver;
    public String resolution;
    public String screen_density;
    public String screen_density_dpi;
    public String cpu_abi;
    public String cpu_abi2;
    public String abis = "";
    public String imei1 = "";
    public String imei2 = "";


    public int is_tablet;

    {


        imei1 = GeneralUtils.getImeiOne();

        imei2 = GeneralUtils.getImeiTwo();
        model = Build.MODEL;
        brand = Build.BRAND;
        product = Build.PRODUCT;
        release = Build.VERSION.RELEASE;
        sdkVersionCode = String.valueOf(Build.VERSION.SDK_INT);
        physical_size = getScreenSizeOfDevice2();
        cpu_type = CpuUtils.getCpuName();
        cpu_num = CpuUtils.getCpuNum();
        cpu_min = CpuUtils.getMinCpuFreq();
        cpu_max = CpuUtils.getMaxCpuFreq();
        cpu_cur = CpuUtils.getCurCpuFreq();
        manufacturer_name = Build.MANUFACTURER;
        board = Build.BOARD;
        serial_number = getSerialNumbers();
        display = Build.DISPLAY;
        id = Build.ID;
        bootloader = Build.BOOTLOADER;
        finger_print = Build.FINGERPRINT;
        host = Build.HOST;
        hardware = Build.HARDWARE;
        device = Build.DEVICE;
        user = Build.USER;
        radio_version = Build.RADIO;
        tags = Build.TAGS;
        time = String.valueOf(Build.TIME);
        type = Build.TYPE;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            base_os = Build.VERSION.BASE_OS;
        }
        baseband_ver = getBaseband_Ver();
        resolution = getResolutions();
        screen_density = String.valueOf(getScreenDensity());
        screen_density_dpi = String.valueOf(getScreenDensityDpi());
        cpu_abi = Build.CPU_ABI;
        cpu_abi2 = Build.CPU_ABI2;
        is_tablet = isTabletDevice();
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            String[] supportedAbis = Build.SUPPORTED_ABIS;
            for (int i = 0; i < supportedAbis.length; i++) {
                if (i == supportedAbis.length - 1) {
                    abis += supportedAbis[i];
                } else {
                    abis += supportedAbis[i] + ",";
                }
            }
        }
    }

}


