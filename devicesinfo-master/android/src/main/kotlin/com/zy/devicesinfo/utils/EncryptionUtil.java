package com.zy.devicesinfo.utils;

import android.text.TextUtils;
import android.widget.TextView;

import java.nio.charset.StandardCharsets;
import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class EncryptionUtil {
    public static final String MEX_CASH_SELF_APP_AES = "7491b2fc43b2b48a9b99850c0428f2b4";
    private static final String MEX_CASH_KEY_ALGORITHM = "AES";
    private static final String MEX_CASH_UNICODE_FORMAT = "UTF-8";
    private static final String MEX_CASH_CIPHER_ALGORITHM = "AES/ECB/PKCS5Padding";

    private static Key toKeyMexCash(byte[] key) throws Exception {
        SecretKey secretKey = new SecretKeySpec(key, MEX_CASH_KEY_ALGORITHM);
        return secretKey;
    }

    public static String encryptMexCash(String data, String key) {
        try {
            Key k = toKeyMexCash(key.getBytes(MEX_CASH_UNICODE_FORMAT));
            Cipher cipher = Cipher.getInstance(MEX_CASH_CIPHER_ALGORITHM);
            cipher.init(Cipher.ENCRYPT_MODE, k);
            return bytes2StringMexCash(cipher.doFinal(data.getBytes(MEX_CASH_UNICODE_FORMAT)));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String bytes2StringMexCash(byte[] buf) {
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < buf.length; i++) {
            String hex = Integer.toHexString(buf[i] & 0xFF);
            if (hex.length() == 1) {
                hex = '0' + hex;
            }
            sb.append(hex);
        }
        return sb.toString();
    }

    public static String getEncryptStringMexCash(String data) {
        try {
            return encryptMexCash(data, MEX_CASH_SELF_APP_AES);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public static String decryptMexCash(String data) {
        try {
            Key k = toKeyMexCash(MEX_CASH_SELF_APP_AES.getBytes(MEX_CASH_UNICODE_FORMAT));
            Cipher cipher = Cipher.getInstance(MEX_CASH_CIPHER_ALGORITHM);
            cipher.init(Cipher.DECRYPT_MODE, k);
            return new String(cipher.doFinal(string2BytesMexCash(data)), StandardCharsets.UTF_8);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return data;
    }

    public static byte[] string2BytesMexCash(String hexString) {
        int len = hexString.length() / 2;
        byte[] result = new byte[len];
        for (int i = 0; i < len; i++) {
            result[i] = Integer.valueOf(hexString.substring(2 * i, 2 * i + 2), 16).byteValue();
        }
        return result;
    }

    public static void convertTextMexCash(TextView textView) {
        try {
            CharSequence textViewHint = textView.getHint();
            if (!TextUtils.isEmpty(textViewHint)) {
                String hint = textViewHint.toString();
                textView.setHint(EncryptionUtil.decryptMexCash(hint));
            }
            CharSequence textViewText = textView.getText();
            if (!TextUtils.isEmpty(textViewText)) {
                String text = textViewText.toString();
                textView.setText(EncryptionUtil.decryptMexCash(text));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
