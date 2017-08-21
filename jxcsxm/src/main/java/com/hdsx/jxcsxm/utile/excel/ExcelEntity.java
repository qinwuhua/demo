package com.hdsx.jxcsxm.utile.excel;

import java.util.List;
import java.util.Map;

/**
 * Excel导出的数据对象
 * @author renhao
 *
 */
public class ExcelEntity {
	public ExcelEntity(){
		super();
	}
	/**
	 * Excel导出的数据对象
	 * @param sheetName String sheet名称
	 * @param titleArray ExcelTitleCell [] 标头数组
	 * @param arrtibutes Map<String,String> 列与属性名的对应
	 * @param excelData List<Object> 导出的数据集合
	 */
	public ExcelEntity(String sheetName,ExcelTitleCell [] titleArray,Map<String, String> arrtibutes,List<Object> excelData) {
		super();
		this.sheetName = sheetName;
		this.titleArray=titleArray;
		this.attributes=arrtibutes;
		this.excelData=excelData;
	}
	private String sheetName;
	private ExcelTitleCell [] titleArray;
	private Map<String, String> attributes;
	private List<Object> excelData;
	public String getSheetName() {
		return sheetName;
	}
	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}
	public ExcelTitleCell[] getTitleArray() {
		return titleArray;
	}
	public void setTitleArray(ExcelTitleCell[] titleArray) {
		this.titleArray = titleArray;
	}
	public Map<String, String> getAttributes() {
		return attributes;
	}
	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}
	public List<Object> getExcelData() {
		return excelData;
	}
	public void setExcelData(List<Object> excelData) {
		this.excelData = excelData;
	}
}
