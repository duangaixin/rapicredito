package com.loan.credito.cash.credit.efectivo.profin.prestamo.dinero.rapicredito;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;

import com.google.android.gms.location.FusedLocationProviderClient;
import com.google.android.gms.location.LocationServices;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.analytics.FirebaseAnalytics;

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
            MainActivity mainActivity = (MainActivity) mActivity;
            switch (methodName) {
                case "takeCamera":
                    int isFront = methodCall.argument("isFront");
                    mainActivity.takePhone(result, isFront);
                    break;
                case "selectImage":
                    mainActivity.selectImage(result);
                    break;
                case "getGoogleLocation":
                    getGoogleLocation();
                    break;
                case "setCrispInfo":
                    Map<String, String> paramMap = (Map<String, String>) methodCall.arguments;
                    setCrispInfo(paramMap);
                    break;
                case "openChatActivity":
                    openChatActivity();
                    break;
                case "addCalendar":
                    Map<String, Object> calendarParam = (Map<String, Object>) methodCall.arguments;
                    addCalendar(calendarParam);
                    break;
                case "appInstanceId":
                   getAppInstanceId();
                    break;
                case "getUserAgent":
                    result.success(System.getProperty("http.agent"));
                    break;
                default:
                    result.notImplemented();
            }
        });
    }

    private  void getAppInstanceId(){
        try {
            FirebaseAnalytics.getInstance(mActivity).getAppInstanceId().addOnCompleteListener(new OnCompleteListener<String>() {
                @Override
                public void onComplete(@NonNull Task<String> task) {
                    if (task.isSuccessful()) {
                        try {
                            String instanceId = task.getResult();
                            System.out.print(instanceId+"-----dddd");
                            mResult.success(instanceId);

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void addCalendar(Map<String, Object> param) {
        String title = "";
        String description = "";
        long reminderTime = System.currentTimeMillis();
        int previousDate = 0;
        if (param != null && !param.isEmpty()) {
            if (param.containsKey("title")) {
                title = (String) param.get("title");
            }
            if (param.containsKey("description")) {
                description = (String) param.get("description");
            }
            if (param.containsKey("reminderTime")) {
                reminderTime = (long) param.get("reminderTime");
            }
            if (param.containsKey("previousDate")) {
                previousDate = (int) param.get("previousDate");
            }
        }
        CalendarReminderUtils.addCalendarEvent(mActivity, title, description, reminderTime, previousDate);

    }


    private void setCrispInfo(Map<String, String> param) {
        Crisp.resetChatSession(mActivity);
        if (param != null && !param.isEmpty()) {
            if (param.containsKey("testFlag")) {
                String testFlag = param.get("testFlag");
                if (testFlag != null) {
                    if (testFlag.equals("1")) {
                        Crisp.setSessionSegment("test");
                    } else {
                        Crisp.setSessionSegment("rapicredito");
                    }
                }
            }
            if (param.containsKey("userPhone")) {
                String userPhone = param.get("userPhone");
                Crisp.setTokenID(userPhone);
                Crisp.setUserPhone(userPhone);
            }

            if (param.containsKey("userEmail")) {
                if (param.containsKey("userEmail")) {
                    String userEmail = param.get("userEmail");
                    Crisp.setUserEmail(userEmail);
                }
            }
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