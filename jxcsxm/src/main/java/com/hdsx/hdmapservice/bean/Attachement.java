package com.hdsx.hdmapservice.bean;

import java.io.Serializable;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 文件附件的Bean
 * 
 * @author wangxiri
 * 
 */
public class Attachement implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6380697904888990356L;
	String id;// id
	String uploader;// 上传人员
	String uploadtime;// 上次日期
	byte[] context;// 文件内容
	String filename;// 文件名称
	String xmid;//项目ID
	private String name;
	private String dwid;
	@Override
	public String toString() {
		return "Attachement [id=" + id + ", uploader=" + uploader
				+ ", uploadtime=" + uploadtime + ", context="
				+ Arrays.toString(context) + ", filename=" + filename
				+ ", xmid=" + xmid + ", name=" + name + ", dw_id=" + dw_id
				+ "]";
	}
	private String dw_id;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUploader() {
		return uploader;
	}
	public void setUploader(String uploader) {
		this.uploader = uploader;
	}
	public String getUploadtime() {
		return uploadtime;
	}
	public void setUploadtime(String uploadtime) {
		this.uploadtime = uploadtime;
	}
	public byte[] getContext() {
		return context;
	}
	public String getName() {
		return name;
	}
	public String getDwid() {
		return dwid;
	}
	public void setDwid(String dwid) {
		this.dwid = dwid;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setContext(byte[] context) {
		this.context = context;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getXmid() {
		return xmid;
	}
	public void setXmid(String xmid) {
		this.xmid = xmid;
	}
	public String getDw_id() {
		return dw_id;
	}
	public void setDw_id(String dw_id) {
		this.dw_id = dw_id;
	}
	

}
