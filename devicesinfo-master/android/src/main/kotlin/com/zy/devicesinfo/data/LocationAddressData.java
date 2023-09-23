package com.zy.devicesinfo.data;

import android.text.TextUtils;

import com.zy.devicesinfo.utils.LocationManagerUtils;

public class LocationAddressData {

    String longitude = "";
    String latitude = "";
    String addressDetails = "";
    String city = "";
    String province = "";


    public LocationAddressData() {
        LocationManagerUtils locationManagerUtils = new LocationManagerUtils();
        this.latitude = locationManagerUtils.latitude;
        this.longitude = locationManagerUtils.longitude;
        this.addressDetails = locationManagerUtils.address_details;
        this.city = locationManagerUtils.city;
        this.province = locationManagerUtils.provice;
    }


    public boolean locationIsNull() {
        if (TextUtils.isEmpty(longitude) && TextUtils.isEmpty(longitude)) {
            return true;
        } else {
            return false;
        }
    }

}
