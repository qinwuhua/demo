package com.hdsx.demoui.utile.excel;

public class ExcelTitleCell {
	public ExcelTitleCell() {
		super();
	}
	/**
	 * Excel的标头类
	 * @param cellTitleName 标题名称
	 * @param isHidden 是否隐藏
	 * @param startCell 开始的坐标对象
	 */
	public ExcelTitleCell(String cellTitleName,boolean hidden, ExcelCoordinate startCell) {
		super();
		this.cellTitleName = cellTitleName;
		this.hidden=hidden;
		this.startCell = startCell;
	}
	/**
	 * Excel的标头类
	 * @param cellTitleName 标题名称
	 * @param isHidden 是否隐藏
	 * @param startCell 开始的坐标对象
	 * @param width 单元格宽度
	 */
	public ExcelTitleCell(String cellTitleName,boolean hidden, ExcelCoordinate startCell,int width) {
		super();
		this.cellTitleName = cellTitleName;
		this.hidden=hidden;
		this.startCell = startCell;
		this.width=width;
	}
	/**
	 * 表头标题单元格对象
	 * @param cellTitleName 标题名称
	 * @param isHidden 是否隐藏
	 * @param startCell 开始的单元格坐标
	 * @param endCell 结束的单元格坐标，如果不需合并单元格，赋值为null
	 * @param width 单元格宽度
	 */
	public ExcelTitleCell(String cellTitleName,boolean hidden, ExcelCoordinate startCell,
			ExcelCoordinate endCell,int width,boolean lock) {
		super();
		this.cellTitleName = cellTitleName;
		this.hidden=hidden;
		this.startCell = startCell;
		this.endCell = endCell;
		this.width=width;
		this.lock=lock;
	}
	private String cellTitleName;
	private boolean hidden;
	private boolean lock;
	private int width;
	private ExcelCoordinate startCell;
	private ExcelCoordinate endCell;
	public String getCellTitleName() {
		return cellTitleName;
	}
	public void setCellTitleName(String cellTitleName) {
		this.cellTitleName = cellTitleName;
	}
	public boolean isHidden() {
		return hidden;
	}
	public void setHidden(boolean hidden) {
		this.hidden = hidden;
	}
	public ExcelCoordinate getStartCell() {
		return startCell;
	}
	public void setStartCell(ExcelCoordinate startCell) {
		this.startCell = startCell;
	}
	public ExcelCoordinate getEndCell() {
		return endCell;
	}
	public void setEndCell(ExcelCoordinate endCell) {
		this.endCell = endCell;
	}
	public int getWidth() {
		return width;
	}
	public void setWidth(int width) {
		this.width = width;
	}
	public boolean isLock() {
		return lock;
	}
	public void setLock(boolean lock) {
		this.lock = lock;
	}
	
}
