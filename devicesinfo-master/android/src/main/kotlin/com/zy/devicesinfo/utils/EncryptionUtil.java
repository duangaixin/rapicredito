package com.zy.devicesinfo.utils;

import android.text.TextUtils;
import android.widget.TextView;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.zip.GZIPOutputStream;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

public class EncryptionUtil {
    public static final String MEX_CASH_SELF_APP_AES = "7491b2fc43b2b48a9b99850c0428f2b4";
    private static final String KEY_ALGORITHM = "AES";
    private static final String UNICODE_FORMAT = "UTF-8";
    private static final String CIPHER_ALGORITHM = "AES/ECB/PKCS5Padding";


    public static String compress(String str) throws IOException {
        if (null == str || str.length() <= 0) {
            return str;
        }
        // 创建一个新的输出流
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        // 使用默认缓冲区大小创建新的输出流
        GZIPOutputStream gzip = new GZIPOutputStream(out);
        // 将字节写入此输出流
        gzip.write(str.getBytes("utf-8")); // 因为后台默认字符集有可能是GBK字符集，所以此处需指定一个字符集
        gzip.close();
        // 使用指定的 charsetName，通过解码字节将缓冲区内容转换为字符串
        return out.toString("ISO-8859-1");
    }

    private static Key toKey(byte[] key) throws Exception {
        SecretKey secretKey = new SecretKeySpec(key, KEY_ALGORITHM);
        return secretKey;
    }

    public static String aesStr(String data) {
        try {
            // 还原密钥
            Key k = toKey(MEX_CASH_SELF_APP_AES.getBytes(UNICODE_FORMAT));

            // Security.addProvider(new BouncyCastleProvider());
            Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM);
            // 初始化，设置为加密模式
            cipher.init(Cipher.ENCRYPT_MODE, k);
            // 执行操作
            return bytes2String(cipher.doFinal(data.getBytes(UNICODE_FORMAT)));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String bytes2String(byte buf[]) {
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

}
