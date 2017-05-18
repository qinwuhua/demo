package com.hdsx.hdmapservice.bean;

import java.io.Serializable;

public class RoadLine implements Serializable{
@Override
	public String toString() {
		return "RoadLine [roadCode=" + roadCode + ", roadName=" + roadName
				+ ", roadStart=" + roadStart + ", roadEnds=" + roadEnds + "]";
	}
/**
	 * 
	 */
	private static final long serialVersionUID = -4740123695962649963L;
private String id;
private String roadCode;
private String roadName;
private double roadStart;
private String startName;
private double roadEnds;
private String endName;
private String type;
private byte[] shape;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getRoadCode() {
	return roadCode;
}
public void setRoadCode(String roadCode) {
	this.roadCode = roadCode;
}
public String getRoadName() {
	return roadName;
}
public void setRoadName(String roadName) {
	this.roadName = roadName;
}
public double getRoadStart() {
	return roadStart;
}
public void setRoadStart(double roadStart) {
	this.roadStart = roadStart;
}
public String getStartName() {
	return startName;
}
public void setStartName(String startName) {
	this.startName = startName;
}
public double getRoadEnds() {
	return roadEnds;
}
public void setRoadEnds(double roadEnds) {
	this.roadEnds = roadEnds;
}
public String getEndName() {
	return endName;
}
public void setEndName(String endName) {
	this.endName = endName;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public byte[] getShape() {
	return shape;
}
public void setShape(byte[] shape) {
	this.shape = shape;
}

}
