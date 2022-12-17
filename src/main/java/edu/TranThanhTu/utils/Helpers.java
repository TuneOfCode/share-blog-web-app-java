package edu.TranThanhTu.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Helpers {
    public String createUUID(String id) {
	long currentTime = System.currentTimeMillis();
	String uuid = id + currentTime;
	return uuid;
    }

    public String getMD5(String password) {
	try {
	    // khởi tạo Message Digest với thuật toán mã hoá MD5
	    MessageDigest md = MessageDigest.getInstance("md5");
	    // đưa về byte
	    byte[] messageDigest = md.digest(password.getBytes());
	    // chuyển từ byte về kiểu signum
	    BigInteger decode = new BigInteger(messageDigest);
	    // chuyển message digest về giá trị hex
	    String hashPass = decode.toString(16);
	    while (hashPass.length() < 32) {
		hashPass = "0" + hashPass;
	    }
	    return "pass" + hashPass;
	} catch (NoSuchAlgorithmException e) {
	    // TODO: handle exception
	    throw new RuntimeException(e);
	}
    }

    public String getFormatDate(Date date, String format) {
	String formatString = format != null ? format : "dd-MM-yyyy";
	return new SimpleDateFormat(formatString).format(date);
    }

    public String getTimeSince(long dateTime) {
	long currentTime = Calendar.getInstance().getTimeInMillis();
//	long dateTime = date.getTime();
//	System.out.println("currentTime: " + currentTime);
//	System.out.println("dateTime: " + dateTime);
	double distanceTime = (currentTime - dateTime) / 1000;
	double seconds = Math.floor(distanceTime);
	double interval = seconds / 31536000;
	String messageTime = "vài giây trước";

	if (interval > 1) {
	    return (Math.floor(interval) + " năm trước").replace(".0", "");
	}
	interval = seconds / 2592000;
	if (interval > 1) {
	    return (Math.floor(interval) + " tháng trước").replace(".0", "");
	}
	interval = seconds / 86400;
	if (interval > 1) {
	    return (Math.floor(interval) + " ngày trước").replace(".0", "");
	}
	interval = seconds / 3600;
	if (interval > 1) {
	    return (Math.floor(interval) + " giờ trước").replace(".0", "");
	}
	interval = seconds / 60;
	if (interval > 1) {
	    return (Math.floor(interval) + " phút trước").replace(".0", "");
	}
	return messageTime;
    }

    public static void main(String[] args) {
	// TODO Auto-generated method stub
	String uuid = new Helpers().createUUID("BV");
	String password = new Helpers().getMD5("abc123");
//	Date date = new Date(1671030790);
	String messageTime = new Helpers().getTimeSince(1671030720); // nhân thêm 1000
	System.out.println("uuid: " + uuid);
	System.out.println("password: " + password);
	System.out.println("time since: " + messageTime);
    }

}
