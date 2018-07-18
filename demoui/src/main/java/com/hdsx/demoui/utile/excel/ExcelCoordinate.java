package com.hdsx.demoui.utile.excel;

/**
 * Excel单元格坐标类
 * @author renhao
 *
 */
public class ExcelCoordinate {
	public ExcelCoordinate() {
		super();
	}
	/**
	 * Excel单元格坐标类
	 * @param x_index 行的下标值，从0开始
	 * @param y_index 列的下标值，从0开始
	 */
	public ExcelCoordinate(int x_index, short y_index) {
		super();
		this.x_index = x_index;
		this.y_index = y_index;
	}
	private int x_index;
	private short y_index;
	public int getX_index() {
		return x_index;
	}
	public void setX_index(int x_index) {
		this.x_index = x_index;
	}
	public short getY_index() {
		return y_index;
	}
	public void setY_index(short y_index) {
		this.y_index = y_index;
	}
}
