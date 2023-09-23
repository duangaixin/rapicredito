package com.zy.devicesinfo.data;

import static com.zy.devicesinfo.utils.OtherUtils.getAppAvailableMemory;
import static com.zy.devicesinfo.utils.OtherUtils.getAppFreeMemory;
import static com.zy.devicesinfo.utils.OtherUtils.getAppMaxMemory;
import static com.zy.devicesinfo.utils.OtherUtils.getInternalAvailableSize;
import static com.zy.devicesinfo.utils.OtherUtils.getInternalTotalSize;
import static com.zy.devicesinfo.utils.OtherUtils.getMemoryCardSize;
import static com.zy.devicesinfo.utils.OtherUtils.getMemoryCardUsableSize;
import static com.zy.devicesinfo.utils.OtherUtils.getRamTotalPreSize;
import static com.zy.devicesinfo.utils.OtherUtils.getRamTotalSize;
import static com.zy.devicesinfo.utils.OtherUtils.getRamUsableSize;
import static com.zy.devicesinfo.utils.OtherUtils.isContainSdCard;

public class StorageData {

    public long ramTotalSize;
    public long ramUsableSize;

    public long memoryCardSize;
    public long memoryCardUsableSize;
    public long memoryCardSizeUse;

    public long internalStorageTotal;
    public long internalStorageUsable;

    public int containSd;
    public int extra_sd;
    public long ramTotalPreSize;
    public long appMaxMemory;
    public long appAvailableMemory;
    public long appFreeMemory;

    {
        ramTotalSize = getRamTotalSize();
        ramUsableSize = getRamUsableSize();
        ramTotalPreSize = getRamTotalPreSize();

        memoryCardSize = getMemoryCardSize();
        memoryCardUsableSize =getMemoryCardUsableSize();
        memoryCardSizeUse =memoryCardSize-  memoryCardUsableSize;
        internalStorageTotal = getInternalTotalSize();
        internalStorageUsable = getInternalAvailableSize();
        appMaxMemory = getAppMaxMemory();
        appAvailableMemory = getAppAvailableMemory();
        appFreeMemory = getAppFreeMemory();
        containSd = isContainSdCard() ? 0 : 1;

    }

}