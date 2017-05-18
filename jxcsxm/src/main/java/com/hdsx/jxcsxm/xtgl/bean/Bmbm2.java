package com.hdsx.jxcsxm.xtgl.bean;

import java.io.Serializable;

/**
 * 用户实体
 * 
 * @author wd
 * 
 */
public class Bmbm2 implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -3611109655157548249L;
	private String id;//单位编码

	private String name;//单位名称


	
	
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
	public Bmbm2(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	


}
