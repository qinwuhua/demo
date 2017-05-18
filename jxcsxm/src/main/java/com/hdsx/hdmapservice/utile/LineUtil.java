package com.hdsx.hdmapservice.utile;

import java.util.ArrayList;
import java.util.List;

import com.hdsx.hdmapservice.bean.HDPoint;

public class LineUtil {

	private float startmile, endmile;

	public float getStartmile() {
		return startmile;
	}

	public void setStartmile(float startmile) {
		this.startmile = startmile;
	}

	public float getEndmile() {
		return endmile;
	}

	public void setEndmile(float endmile) {
		this.endmile = endmile;
	}

	List<HDPoint> pnts = new ArrayList<HDPoint>();

	public void setPnts(List<HDPoint> pnts) {
		for (HDPoint pnt : pnts) {
			this.pnts.add(pnt);
		}
	}

	public List<HDPoint> getPnts() {
		return pnts;
	}

	double length;
	double factor;

	public void init(List<HDPoint> pnts) {
		for (HDPoint pnt : pnts) {
			this.pnts.add(pnt);
		}
		initLength();
	}

	/**
	 * 初始化长度
	 */
	void initLength() {

		HDPoint p1, p2;
		for (int i = 0; i < pnts.size() - 1; i++) {
			p1 = pnts.get(i);
			p2 = pnts.get(i + 1);
			double len = Math.sqrt(Math.pow(p1.getX() - p2.getX(), 2) + Math.pow(p1.getY() - p2.getY(), 2));
			p1.setM(this.length);
			this.length += len;
			p2.setM(this.length);
		}

		// 计算桩号比例

		this.factor = (this.endmile - this.startmile) / this.length;
		// 更新没个点内的桩号值
		for (HDPoint p : pnts) {
			p.setM(p.getM() * this.factor + this.startmile);
		}

	}

	/**
	 * 根据桩号获取点坐标
	 * 
	 * @param pos
	 * @return
	 */
	public HDPoint getHDPointByPos(float pos) {
		HDPoint p = new HDPoint();
		try {
			int startIdx = 0;
			int endIdx = this.pnts.size() - 1;
			while (endIdx - startIdx > 1) {
				int midIdx = (startIdx + endIdx) / 2;
				if (pnts.get(midIdx).getM() > pos) {
					endIdx = midIdx;
				} else {
					startIdx = midIdx;
				}
			}
			HDPoint p1 = this.pnts.get(startIdx);
			HDPoint p2 = this.pnts.get(endIdx);
			p.setM(pos);
			p.setX((p.getM() - p1.getM()) / (p2.getM() - p1.getM()) * (p2.getX() - p1.getX()) + p1.getX());
			p.setY((p.getM() - p1.getM()) / (p2.getM() - p1.getM()) * (p2.getY() - p1.getY()) + p1.getY());
		} catch (Exception e) {
			System.out.println(e.getLocalizedMessage());
		}
		return p;
	}

	/**
	 * 根据坐标获取桩号
	 * 
	 * @param x
	 * @param y
	 * @return
	 */
	public double getMileByHDPoint(double x, double y) {
		//double result = -100d;
		int startIdx, endIdx;
		startIdx = 0;
		endIdx = pnts.size() - 1;
		HDPoint p = new HDPoint();
		p.setX(x);
		p.setY(y);

		while (endIdx - startIdx > 2) {
			int midIdx = (endIdx - startIdx) / 2;
			HDPoint p0 = pnts.get(startIdx);
			// HDPoint p1 = pnts.get(midIdx);
			HDPoint p2 = pnts.get(endIdx);

			double d0 = getDistance(p0, p);
			// double d1 = getDistance(p1, p);
			double d2 = getDistance(p2, p);

			if (d0 > d2) {
				endIdx = midIdx;
			} else {
				startIdx = midIdx;
			}

		}

		HDPoint p1 = this.pnts.get(startIdx);
		HDPoint p2 = this.pnts.get(endIdx);

		return (p.getX() - p1.getX()) / (p2.getX() - p1.getX()) * (p2.getM() - p1.getM()) + p1.getM();

		// return result;
	}

	/**
	 * 根据起止点获取线段
	 * 
	 * @param startmile
	 * @param endmile
	 * @return
	 */
	public LineUtil getSegment(float startmile, float endmile) {
		LineUtil l = new LineUtil();
		List<HDPoint> lst = new ArrayList<HDPoint>();
		// ---
		if (startmile > this.pnts.get(0).getM()) {
			lst.add(this.getHDPointByPos(startmile));
		}
		for (HDPoint p : this.pnts) {
			if (p.getM() > startmile && p.getM() < endmile) {
				lst.add(p.clone());
			}
		}

		if (endmile < this.pnts.get(this.pnts.size() - 1).getM()) {
			lst.add(this.getHDPointByPos(endmile));
		}

		if (lst.size() > 1) {
			// l.init(lst);
			l.setPnts(lst);
			return l;
		} else {
			return null;
		}
	}

	double getDistance(HDPoint p1, HDPoint p2) {
		return Math.sqrt(Math.pow(p1.getX() - p2.getX(), 2) + Math.pow(p1.getY() - p2.getY(), 2));
	}

	
	
	@Override
	public String toString() {
		StringBuffer sb = new StringBuffer();
		for(HDPoint p:this.pnts){
			sb.append(p.toString());
			sb.append('\n');
		}
		return sb.toString();
	}

}
