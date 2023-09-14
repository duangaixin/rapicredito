package com.loan.credito.cash.credit.efectivo.profin.prestamo.dinero.rapicredito;

import androidx.multidex.MultiDex;
import im.crisp.client.Crisp;
import io.flutter.app.FlutterApplication;

public class MyApp extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();
        MultiDex.install(this);
        Crisp.configure(this, "key");
    }
}
