package com.hdsx.jxcsxm.tjbb.bean;

import java.util.List;

/**
 * 功能：用来存放excel的内容<br/>
 * 1：titleName 表名<br/>
 * 2：sheetName sheet的名字<br/>
 * 3: fileName 生成excel文件的名字<br/>
 * 4：List<Excel_list> 用来存放excel内容的实体list<br/>
 * 5：List<Excel_tilte> 用来存放表头的list<br/>
 * @author qwh
 *
 */
public class ExcelData {
	private List<Excel_tilte> et;
	private List<Excel_tilte> ett;
	private String titleName;
	private String sheetName;
	private String fileName;
	private List<Excel_list> el;
	
	public List<Excel_tilte> getEtt() {
		return ett;
	}
	public void setEtt(List<Excel_tilte> ett) {
		this.ett = ett;
	}
	public List<Excel_tilte> getEt() {
		return et;
	}
	public void setEt(List<Excel_tilte> et) {
		this.et = et;
	}
	public String getTitleName() {
		return titleName;
	}
	public void setTitleName(String titleName) {
		this.titleName = titleName;
	}
	public String getSheetName() {
		return sheetName;
	}
	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}
	public List<Excel_list> getEl() {
		return el;
	}
	public void setEl(List<Excel_list> el) {
		this.el = el;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}
