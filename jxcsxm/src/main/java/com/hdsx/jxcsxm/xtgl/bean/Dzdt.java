package com.hdsx.jxcsxm.xtgl.bean;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;

public class Dzdt implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -679243477643026599L;
	private String roadcode;
	private String roadname;
	private Double roadstart;
	private Double roadends;
	private List<HashMap<String, String>> xyHashMapList;
	private double ptx;
	private double pty;
	private byte[] shape;
	private String roadpos;
	private String dist;
	private String id;
	private String parent;
	
	
	public List<HashMap<String, String>> getXyHashMapList() {
		return xyHashMapList;
	}
	public void setXyHashMapList(List<HashMap<String, String>> xyHashMapList) {
		this.xyHashMapList = xyHashMapList;
	}
	public double getPtx() {
		return ptx;
	}
	public void setPtx(double ptx) {
		this.ptx = ptx;
	}
	public double getPty() {
		return pty;
	}
	public void setPty(double pty) {
		this.pty = pty;
	}
	public byte[] getShape() {
		return shape;
	}
	public void setShape(byte[] shape) {
		this.shape = shape;
	}
	public String getRoadpos() {
		return roadpos;
	}
	public void setRoadpos(String roadpos) {
		this.roadpos = roadpos;
	}
	public String getDist() {
		return dist;
	}
	public void setDist(String dist) {
		this.dist = dist;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getRoadcode() {
		return roadcode;
	}
	public void setRoadcode(String roadcode) {
		this.roadcode = roadcode;
	}
	public String getRoadname() {
		return roadname;
	}
	public void setRoadname(String roadname) {
		this.roadname = roadname;
	}
	public Double getRoadstart() {
		return roadstart;
	}
	public void setRoadstart(Double roadstart) {
		this.roadstart = roadstart;
	}
	public Double getRoadends() {
		return roadends;
	}
	public void setRoadends(Double roadends) {
		this.roadends = roadends;
	}
	

}
