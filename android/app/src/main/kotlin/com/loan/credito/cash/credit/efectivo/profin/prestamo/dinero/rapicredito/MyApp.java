package com.loan.credito.cash.credit.efectivo.profin.prestamo.dinero.rapicredito;

import androidx.multidex.MultiDex;

import com.facebook.appevents.AppEventsLogger;

import im.crisp.client.Crisp;
import io.flutter.app.FlutterApplication;

public class MyApp extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();
        MultiDex.install(this);
        Crisp.configure(this, "fec2b430-f6cf-4ee1-a15a-188f19e490c2");
        AppEventsLogger.activateApp(this);
    }
}
