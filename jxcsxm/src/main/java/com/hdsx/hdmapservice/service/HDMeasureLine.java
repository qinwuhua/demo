package com.hdsx.hdmapservice.service;

import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import com.hdsx.hdmapservice.bean.HDPoint;
import com.hdsx.hdmapservice.bean.HDPointIndex;

/**
 * @author zwl
 * 
 */
public final class HDMeasureLine {

	public HDMeasureLine() {
		super();
		// TODO Auto-generated constructor stub
	}

	public List<List<HDPoint>> m_lstParts = new ArrayList<List<HDPoint>>();
	private static double tx;
	private static double ty; 
	private static double tm; 
	/**
	 * 将shape字段解析成坐标数组
	 * @param content 带M值得shape字段
	 * @return 转换后的坐标数组
	 */
	public List<List<HDPoint>> BytesToLineM(byte[] content) {
		ByteBuffer bb = ByteBuffer.wrap(content);
		bb.order(ByteOrder.LITTLE_ENDIAN);

		// 获取Part数量
		int PartCount = bb.getInt();

		// 获取每个Part的Point数量
		ArrayList<Integer> pointNumList = new ArrayList<Integer>();

		for (int i = 0; i < PartCount; i++) {
			pointNumList.add(bb.getInt());
		}
		// 获取每个Part的Point
		for (int i = 0; i < PartCount; i++) {
			ArrayList<Double> xlst = new ArrayList<Double>();
			ArrayList<Double> ylst = new ArrayList<Double>();
			ArrayList<Double> mlst = new ArrayList<Double>();

			// 读取X值
			for (int j = 0; j < pointNumList.get(i); j++) {
				xlst.add(bb.getDouble());
			}
			// 读取Y值
			for (int j = 0; j < pointNumList.get(i); j++) {
				ylst.add(bb.getDouble());
			}
			// 读取M值
			for (int j = 0; j < pointNumList.get(i); j++) {
				mlst.add(bb.getDouble());
			}

			// 构造HDPoint对象
			List<HDPoint> pList = new ArrayList<HDPoint>();
			for (int j = 0; j < pointNumList.get(i); j++) {
				HDPoint p = new HDPoint();
				p.setX(xlst.get(j));
				p.setY(ylst.get(j));
				p.setM(mlst.get(j));
				pList.add(p);
			}
			List<HDPoint> pReduced = new PerpendicularDistance()
					.getSimplefied(pList);
			m_lstParts.add(pReduced);
		}
		return m_lstParts;
	}

	/**
	 * 将shape字段解析成坐标数组
	 * @param content 不带M值得shape字段
	 * @return 转换后的坐标数组
	 */
	public List<List<HDPoint>> BytesToLine(byte[] content){
		ByteBuffer bb = ByteBuffer.wrap(content);
		bb.order(ByteOrder.LITTLE_ENDIAN);
		// 获取Part数量
		int PartCount = bb.getInt();
		// 获取每个Part的Point数量
		List<Integer> pointsList = new ArrayList<Integer>();
		for (int i = 0; i < PartCount; i++) {
			pointsList.add(bb.getInt());
		}
		// 获取每个Part的Point
		List<Double> xlst;
		List<Double> ylst;
		HDPoint p;
		List<HDPoint> pList;
		for (int i = 0; i < PartCount; i++) {
			xlst = new ArrayList<Double>();
			ylst = new ArrayList<Double>();
			// 读取X值
			for (int j = 0; j < pointsList.get(i); j++) {
				xlst.add(bb.getDouble());
			}
			// 读取Y值
			for (int j = 0; j < pointsList.get(i); j++) {
				ylst.add(bb.getDouble());
			}
			// 构造Point对象
			pList = new ArrayList<HDPoint>();
			for (int j = 0; j < pointsList.get(i); j++) {
				p = new HDPoint();
				p.setX(xlst.get(j));
				p.setY(ylst.get(j));
				pList.add(p);
			}
			//抽稀
			List<HDPoint> pReduced = new PerpendicularDistance().getSimplefied(pList);
			m_lstParts.add(pReduced);
			//m_lstParts.add(pList);
		}
		return m_lstParts;
	}
	/**
	 * 得到坐标字符串
	 * @return
	 */
	public String GetXYInfo() {
		StringBuilder str = new StringBuilder();
		if (m_lstParts.size() == 0)
			return "";

		for (int i = 0; i < m_lstParts.size(); i++) {
			List<HDPoint> lstPoints = m_lstParts.get(i);
			if (lstPoints.size() == 1)
				continue;
			str.append(createEncodings(lstPoints, 5)).append("#");
		}
		return str.toString().substring(0, str.length() - 1);
	}
	public String myGetXYInfo() {
		DecimalFormat df=(DecimalFormat) DecimalFormat.getInstance();
		df.applyPattern("###.######");
		StringBuilder str = new StringBuilder();
		if (m_lstParts.size() == 0)
			return "";

		for (int i = 0; i < m_lstParts.size(); i++) {
			List<HDPoint> lstPoints = m_lstParts.get(i);
			if (lstPoints.size() == 1)
				continue;
			StringBuffer sb=new StringBuffer();
			for (HDPoint hdPoint : lstPoints) {
				sb.append(df.format(hdPoint.getX())).append(",").append(df.format(hdPoint.getY())).append("|");
			}
			str.append(sb.substring(0,sb.length()-1)).append("#");
		}
		return str.toString().substring(0, str.length() - 1);
	 }
	// points点串
	// dotLen 保留小数点
	public String createEncodings(List<HDPoint> points, int dotLen) {
		int i = 0;

		long plat = 0;
		long plng = 0;

		String encoded_points = "";

		for (i = 0; i < points.size(); i++) {
			HDPoint point = points.get(i);
			double x = point.getX();
			double y = point.getY();

			int facotr = (int) (Math.pow(10, dotLen));
			long late5 = (long) Math.round(x * facotr);
			long lnge5 = (long) Math.round(y * facotr);

			long dlat = late5 - plat;
			long dlng = lnge5 - plng;
			// Console.WriteLine(new StringBuilder().AppendFormat("{0},{1}",
			// dlat, dlng));
			plat = late5;
			plng = lnge5;

			encoded_points += encodeSignedNumber(dlat)
					+ encodeSignedNumber(dlng);

		}

		return encoded_points;
	}

	static String encodeSignedNumber(long num) {

		long sgn_num = num << 1;

		if (num < 0) {
			sgn_num = ~(sgn_num);
		}

		return (encodeNum(sgn_num));
	}
	static String encodeNum(long num) {
		String encodestring = "";
		while (num >= 0x20) {
			int charvalue = (int) ((0x20 | (num & 0x1f)) + 63);
			encodestring += (char) charvalue;
			num >>= 5;

		}
		encodestring += (char) ((int) num + 63);
		return encodestring;
	}

	public void MeasureLine(double roadStart, double roadEnds) {	
    		List<List<HDPoint>> points=m_lstParts;
    		List<List<HDPoint>> resultList=new ArrayList<List<HDPoint>>();
    		int iIndex = 0;
    		for (List<HDPoint> list : points) {
    			if (list.size() == 0)
    				continue;
    			HDPoint startPoint = list.get(0);
    			HDPoint endPoint = list.get(list.size() - 1);

    			if (startPoint.getM() > roadEnds || endPoint.getM() < roadStart)
    				continue;
    			if (startPoint.getM() >= roadStart && endPoint.getM() <= roadEnds) {
    				resultList.add(list);
    			} else if (startPoint.getM() >= roadStart && endPoint.getM() > roadEnds) {
    				HDPointIndex pt = GetMeasurePoint(list, roadEnds, iIndex);
    				List<HDPoint> lstTemp = new ArrayList<HDPoint>();

    				for (int i = 0; i < pt.getIndex(); i++) {
    					lstTemp.add(list.get(i));
    				}

    				lstTemp.add(pt.getHdpoint());
    				resultList.add(lstTemp);
    			} else if (startPoint.getM() < roadStart && endPoint.getM() <= roadEnds) {
    				HDPointIndex pt = GetMeasurePoint(list, roadStart, iIndex);
    				List<HDPoint> lstTemp = new ArrayList<HDPoint>();
    				lstTemp.add(pt.getHdpoint());

    				for (int i = pt.getIndex(); i < list.size(); i++) {
    					lstTemp.add(list.get(i));
    				}
    				resultList.add(lstTemp);
    			}

    			else if (startPoint.getM() < roadStart && endPoint.getM() > roadEnds) {
    				HDPointIndex pt = GetMeasurePoint(list, roadStart, iIndex);
    				int iIndex1 = 0;
    				HDPointIndex pt1 = GetMeasurePoint(list, roadEnds, iIndex1);

    				List<HDPoint> lstTemp = new ArrayList<HDPoint>();
    				lstTemp.add(pt.getHdpoint());

    				for (int i = pt.getIndex(); i < pt1.getIndex(); i++) {
    					lstTemp.add(list.get(i));
    				}
    				lstTemp.add(pt1.getHdpoint());
    				resultList.add(lstTemp);
    			}
				
			}
            m_lstParts=resultList;
	}
	public HDPointIndex GetMeasurePoint(List<HDPoint> lstPoints, double dMeas,
			int iIndex) {
		HDPoint retPt = new HDPoint();
		HDPointIndex hdi = new HDPointIndex();
		double FMeas = lstPoints.get(0).getM();
		double TMeas = lstPoints.get(lstPoints.size() - 1).getM();

		if (FMeas <= dMeas && TMeas >= dMeas) {
			for (int i = 0; i < lstPoints.size() - 1; i++) {
				FMeas = lstPoints.get(i).getM();
				HDPoint p1 = lstPoints.get(i);
				TMeas = lstPoints.get(i + 1).getM();
				HDPoint p2 = lstPoints.get(i + 1);

				if (FMeas <= dMeas && TMeas >= dMeas) {
					if (Math.abs(dMeas - FMeas) < 0.001) {
						hdi.setIndex(i);
						hdi.setHdpoint(p1);
						// iIndex = i;
						// return p1;
						return hdi;
					}

					if (Math.abs(dMeas - TMeas) < 0.001) {
						// iIndex = i + 1;
						// return p2;
						hdi.setHdpoint(p2);
						hdi.setIndex(i + 1);
						return hdi;
					}

					retPt.setX(((dMeas - FMeas) / (TMeas - FMeas))
							* (p2.getX() - p1.getX()) + p1.getX());
					retPt.setY(((dMeas - FMeas) / (TMeas - FMeas))
							* (p2.getY() - p1.getY()) + p1.getY());
					retPt.setM(dMeas);

					iIndex = i + 1;
					hdi.setHdpoint(retPt);
					// return retPt;
					hdi.setIndex(iIndex);
					return hdi;
				}
			}
		}
		hdi.setHdpoint(retPt);
		hdi.setIndex(iIndex);
		return hdi;
	}
}
