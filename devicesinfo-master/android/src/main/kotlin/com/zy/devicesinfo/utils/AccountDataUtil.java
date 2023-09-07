package com.zy.devicesinfo.utils;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.annotation.SuppressLint;


import com.zy.devicesinfo.UtilsApp;
import com.zy.devicesinfo.data.AccountData;

import java.util.ArrayList;
import java.util.List;


public class AccountDataUtil {

    public static List<AccountData> getAccountList() {
        List<AccountData> accounts = new ArrayList<>();
        try {
            AccountManager accountManager = AccountManager.get(UtilsApp.getApp());
            @SuppressLint("MissingPermission") Account[] accounts1 = accountManager.getAccounts();
            for (android.accounts.Account account : accounts1) {
                AccountData account1 = new AccountData();
                account1.name = account.name;
                account1.type = account.type;
                accounts.add(account1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return accounts;
        }

        return accounts;
    }


}
