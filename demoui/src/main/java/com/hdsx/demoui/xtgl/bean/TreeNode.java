package com.hdsx.demoui.xtgl.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

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
public class TreeNode implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3611109655157548249L;
	private String id;//单位ID
	private String name;
	private String text;//单位名称
	private String dwbm;//单位编码
	private List<TreeNode> children=new ArrayList<TreeNode>();
	private String iconCls="icon-none";
	private String state="open";
	private String parent;
	private String bmid;
	private String checked;
	private String attributes;
	private String url;
	
	
}
