package com.hdsx.jxcsxm.tjbb.bean;
/**
 * 功能：用来存放表头的实体<br/>
 * 1：name 表头名<br/>
 * 2：x1,x2,y1,y2  表示从x1行到x2行，从y1列y2列<br/>
 * @author qwh
 *
 */
public class Excel_tilte {
	private String name;
	private boolean sfyc;
	private int x1;
	private int x2;
	private int y1;
	private int y2;
	public int getX1() {
		return x1;
	}
	public void setX1(int x1) {
		this.x1 = x1;
	}
	public int getX2() {
		return x2;
	}
	public void setX2(int x2) {
		this.x2 = x2;
	}
	public int getY1() {
		return y1;
	}
	public void setY1(int y1) {
		this.y1 = y1;
	}
	public int getY2() {
		return y2;
	}
	public void setY2(int y2) {
		this.y2 = y2;
	}
	
	
	public boolean isSfyc() {
		return sfyc;
	}
	public void setSfyc(boolean sfyc) {
		this.sfyc = sfyc;
	}
	public Excel_tilte(String name, int x1, int x2, int y1, int y2) {
		super();
		this.name = name;
		this.x1 = x1;
		this.x2 = x2;
		this.y1 = y1;
		this.y2 = y2;
	}
	
	public Excel_tilte(String name, boolean sfyc, int x1, int x2, int y1, int y2) {
		super();
		this.name = name;
		this.sfyc = sfyc;
		this.x1 = x1;
		this.x2 = x2;
		this.y1 = y1;
		this.y2 = y2;
	}
	public Excel_tilte() {
		super();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
