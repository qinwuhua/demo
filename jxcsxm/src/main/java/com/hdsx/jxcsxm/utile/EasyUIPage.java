package com.hdsx.jxcsxm.utile;


import java.util.ArrayList;
import java.util.List;

/**
 * easyui的分页类
 * @author renzm
 *
 * @param <T>
 */
public class EasyUIPage<T> {

	/**
	 * 总记录数
	 */
	private int total;
	
	/**
	 * 每页数据
	 */
	private List<T> rows = new ArrayList<T>();
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public List<T> getRows() {
		return rows;
	}
	public void setRows(List<T> rows) {
		this.rows = rows;
	}
	
}
