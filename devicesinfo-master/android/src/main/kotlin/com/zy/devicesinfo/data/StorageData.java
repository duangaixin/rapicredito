package com.zy.devicesinfo.data;

import static com.zy.devicesinfo.utils.OtherUtils.getAppAvailableMemory;
import static com.zy.devicesinfo.utils.OtherUtils.getAppFreeMemory;
import static com.zy.devicesinfo.utils.OtherUtils.getAppMaxMemory;
import static com.zy.devicesinfo.utils.OtherUtils.getAvailMemory;
import static com.zy.devicesinfo.utils.OtherUtils.getExternalAvailableSize;
import static com.zy.devicesinfo.utils.OtherUtils.getExternalTotalSize;
import static com.zy.devicesinfo.utils.OtherUtils.getInternalAvailableSize;
import static com.zy.devicesinfo.utils.OtherUtils.getInternalTotalSize;
import static com.zy.devicesinfo.utils.OtherUtils.getRamTotalSize;
import static com.zy.devicesinfo.utils.OtherUtils.getRamUseAbleSize;
import static com.zy.devicesinfo.utils.OtherUtils.getTotalMemory;

public class StorageData {

    public long ramTotalSize;
    public long ramUsableSize;

    public long memory_card_size;
    public long memory_card_usable_size;
    public long memory_card_size_use;

    public long internal_storage_total;
    public long internal_storage_usable;

    public int contain_sd;
    public int extra_sd;
    public long ram_total_pre_size;
    public long app_max_memory;
    public long app_available_memory;
    public long app_free_memory;

    {
        ramTotalSize = getRamTotalSize();
        ramUsableSize = getRamTotalSize() - getRamUseAbleSize();
        memory_card_size = getExternalTotalSize();
        memory_card_usable_size = getExternalTotalSize() - getExternalAvailableSize();
        memory_card_size_use = getExternalAvailableSize();
        internal_storage_total = getInternalTotalSize();
        internal_storage_usable = getInternalAvailableSize();
        app_max_memory = getAppMaxMemory();
        app_available_memory = getAppAvailableMemory();
        app_free_memory = getAppFreeMemory();


    }

}