package com.hdsx.jxcsxm.xtgl.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * 用户实体
 * 
 * @author wd
 * 
 */
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
	
	
	public String getAttributes() {
		return attributes;
	}
	public void setAttributes(String attributes) {
		this.attributes = attributes;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
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

	public List<TreeNode> getChildren() {
		return children;
	}
	public void setChildren(List<TreeNode> children) {
		this.children = children;
	}
	public String getDwbm() {
		return dwbm;
	}
	public void setDwbm(String dwbm) {
		this.dwbm = dwbm;
	}
	public TreeNode() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TreeNode(String id, String text, String dwbm,
			List<TreeNode> children) {
		super();
		this.id = id;
		this.text = text;
		this.dwbm = dwbm;
		this.children = children;
	}
	public TreeNode(String id, String text, String dwbm,
			List<TreeNode> children,  String state) {
		super();
		this.id = id;
		this.text = text;
		this.dwbm = dwbm;
		this.children = children;
		this.state = state;
	}
	public String getBmid() {
		return bmid;
	}
	public void setBmid(String bmid) {
		this.bmid = bmid;
	}
	
}
