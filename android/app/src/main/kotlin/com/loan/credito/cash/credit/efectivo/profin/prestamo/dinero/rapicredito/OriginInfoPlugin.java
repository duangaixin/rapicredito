package com.loan.credito.cash.credit.efectivo.profin.prestamo.dinero.rapicredito;

import android.app.Activity;
import android.content.pm.PackageManager;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry.Registrar;

public class OriginInfoPlugin implements FlutterPlugin {

    private MethodChannel channel;
    private Activity mActivity;
    private FusedLocationProviderClient mFusedLocationClient;
    private MethodChannel.Result mResult;

    public OriginInfoPlugin(Activity activity) {
        this.mActivity = activity;
    }

    public static void registerWith(Registrar registrar) {
        OriginInfoPlugin plugin = new OriginInfoPlugin(registrar.activity());
        plugin.setupMethodChannel(registrar.messenger());
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        setupMethodChannel(binding.getBinaryMessenger());
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        tearDownChannel();
    }

    private void setupMethodChannel(BinaryMessenger messenger) {
        channel = new MethodChannel(messenger, "originInfoPlugin");
        channel.setMethodCallHandler((methodCall, result) -> {
            this.mResult = result;
            if ("takeCamera".equals(methodCall.method)) {
                int isFront = methodCall.argument("isFront");
                MainActivity mainActivity = (MainActivity) mActivity;
                mainActivity.takePhone(result, isFront);

            } else if ("selectImage".equals(methodCall.method)) {


            } else if ("getGoogleLocation".equals(methodCall.method)) {
                getGoogleLocation();
            } else {
                result.notImplemented();
            }
        });
    }

    private void getGoogleLocation() {
        if (mFusedLocationClient == null) {
            mFusedLocationClient = LocationServices.getFusedLocationProviderClient(mActivity);
            if (ActivityCompat.checkSelfPermission(mActivity, android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED && ActivityCompat.checkSelfPermission(mActivity, android.Manifest.permission.ACCESS_COARSE_LOCATION) != PackageManager.PERMISSION_GRANTED) {
                return;
            }
        }
        mFusedLocationClient.getLastLocation()
                .addOnSuccessListener(mActivity, location -> {
                    if (location != null) {
                     Double latitude=   location.getLatitude();
                     Double longitude= location.getLongitude();
                        Map<String,String> param= new HashMap();
                        param.put("latitude",latitude.toString());
                        param.put("longitude",longitude.toString());
                        mResult.success(location);
                    }
                });

    }

    private void tearDownChannel() {
        channel.setMethodCallHandler(null);
        channel = null;
    }


}