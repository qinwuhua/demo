package com.hdsx.demoui.xtgl.bean;

import java.io.Serializable;

import lombok.Data;
import lombok.experimental.Accessors;

/**
 * 用户实体
 * 
 * @author wd
 * 
 */
@Data
@Accessors(chain=true)
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
	
	
	
	

}
