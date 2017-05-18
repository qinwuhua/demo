package com.hdsx.jxcsxm.utile;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeUtil {
	public static String  getTime(){
			Date d=new Date();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sdf.format(d);
	}
}
