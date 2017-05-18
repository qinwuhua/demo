package com.hdsx.jxcsxm.xtgl.bean;

import java.io.Serializable;

/**
 * 用户实体
 * 
 * @author wd
 * 
 */
public class Unit implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3611109655157548249L;
	private String id;//单位编码
	private String name;//单位名称
	private String _parentId;//上级单位
	private String parent;//上级单位
	private String unit;//行政区划
	private String iconCls="icon-none";
	private String state="open";
	private String roadcode;
	private String roadstart;
	private String roadends;
	private String roadname;
	private String bmid;
	private String desr;
	/**
	 * page 当前的页数
	 * rows 显示的条数
	 */
	private int page;
	private int rows;
	private String xzqhdm;
	
	
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String get_parentId() {
		return _parentId;
	}
	public void set_parentId(String _parentId) {
		this._parentId = _parentId;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getIconCls() {
		return iconCls;
	}
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public String getBmid() {
		return bmid;
	}
	public void setBmid(String bmid) {
		this.bmid = bmid;
	}
	public String getDesr() {
		return desr;
	}
	public void setDesr(String desr) {
		this.desr = desr;
	}
	public String getRoadcode() {
		return roadcode;
	}
	public void setRoadcode(String roadcode) {
		this.roadcode = roadcode;
	}
	public String getRoadstart() {
		return roadstart;
	}
	public void setRoadstart(String roadstart) {
		this.roadstart = roadstart;
	}
	public String getRoadends() {
		return roadends;
	}
	public void setRoadends(String roadends) {
		this.roadends = roadends;
	}
	public String getRoadname() {
		return roadname;
	}
	public void setRoadname(String roadname) {
		this.roadname = roadname;
	}
	
	
	
	

}
