package com.hdsx.hdmapservice.bean;
public class HDPoint {
	private  double x;
    private  double y;
    private  double m;
    private double dTemp;
    private int iIndex;
 
	public double getX() {
		return x;
	}

	public void setX(double x) {
		this.x = x;
	}

	public double getY() {
		return y;
	}

	public void setY(double y) {
		this.y = y;
	}

	public double getM() {
		return m;
	}

	public void setM(double m) {
		this.m = m;
	}
	public double getdTemp() {
		return dTemp;
	}

	public void setdTemp(double dTemp) {
		this.dTemp = dTemp;
	}

	public int getiIndex() {
		return iIndex;
	}

	public void setiIndex(int iIndex) {
		this.iIndex = iIndex;
	}

	public HDPoint() {}
	public HDPoint(double x, double y, double m) {
		this.x = x;
		this.y = y;
		this.m = m;
	}
	
	@Override
	public String toString() {
		return "HDPoint [x=" + x + ", y=" + y + ", m=" + m + "]";
	}  
	public HDPoint clone() {
		HDPoint p = new HDPoint();
		p.setX(this.x);
		p.setY(this.y);
		p.setM(this.m);
		return p;
	}
    
    
}
