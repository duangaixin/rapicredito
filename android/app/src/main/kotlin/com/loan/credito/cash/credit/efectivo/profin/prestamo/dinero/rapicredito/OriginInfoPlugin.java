package com.loan.credito.cash.credit.efectivo.profin.prestamo.dinero.rapicredito;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.util.Log;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;

import java.util.Map;

import im.crisp.client.ChatActivity;
import im.crisp.client.Crisp;
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
            String methodName = methodCall.method;
            Log.d("duanxin","-----0000");
            switch (methodName) {
                case "takeCamera":
                    int isFront = methodCall.argument("isFront");
                    MainActivity mainActivity = (MainActivity) mActivity;
                    mainActivity.takePhone(result, isFront);
                    break;
                case "selectImage":

                    break;
                case "getGoogleLocation":
                    getGoogleLocation();
                    break;
                case "setCrispInfo":
                    Map<String, String> paramMap = (Map<String, String>) methodCall.arguments;
                    Log.d("duanxin",paramMap.size()+"-----");
                    setCrispInfo(paramMap);
                    break;
                case "openChatActivity":
                    openChatActivity();
                    break;
                default:
                    result.notImplemented();
            }
        });
    }

    private void setCrispInfo(Map<String, String> param) {
        Log.d("duanxin","-----11111");
        Crisp.resetChatSession(mActivity);
        if (param != null && !param.isEmpty()) {
            Log.d("duanxin","-----2222");
            if (param.containsKey("testFlag")) {
                String testFlag = param.get("testFlag");
                if(testFlag!=null){
                    Log.d("duanxin","-----222222222222");
                    if (testFlag.equals("1")) {
                        Log.d("duanxin","-----2222222");
                        Crisp.setSessionSegment("test");
                    } else {
                        Log.d("duanxin","-----3333");
                        Crisp.setSessionSegment("rapicredito");
                    }
                }

            }

            if (param.containsKey("userPhone")) {
                String userPhone = param.get("userPhone");
                Crisp.setTokenID(userPhone);
                Log.d("duanxin","-----4444");
                Crisp.setUserPhone(userPhone);
            }

            if (param.containsKey("userEmail")) {
                if (param.containsKey("userEmail")) {
                    String userEmail = param.get("userEmail");
                    Crisp.setUserEmail(userEmail);
                }
            }
            Log.d("duanxin","-----5555");
            mResult.success(true);
        }
    }

    private void openChatActivity() {
        Intent crispIntent = new Intent(mActivity, ChatActivity.class);
        mActivity.startActivity(crispIntent);
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
                        Double latitude = location.getLatitude();
                        Double longitude = location.getLongitude();
                        StringBuilder sb = new StringBuilder();
                        sb.append(longitude.toString() + ',' + latitude);
                        mResult.success(sb.toString());
                    }
                });

    }

    private void tearDownChannel() {
        channel.setMethodCallHandler(null);
        channel = null;
    }
}