package com.hdsx.hdmapservice.bean;
import java.util.Arrays;

import com.hdsx.util.lang.DoubleUtil;
import com.hdsx.util.lang.ReflectUtil;
/**
 * 路段合并列表
 * @author kemi
 *
 */
public class MergeLine {
/**
 * 路线名称
 */
private String roadName;
/**
 * 路线编码
 */
private String roadCode;
/**
 * 起点桩号
 */
private double start;
/**
 * 止点桩号
 */
private double end;
/**
 * 里程数
 */
private double mil;
/**
 * 合并指标;根据这个指标判断两条路线是否可以合并
 */
private String mergeField;


public MergeLine(String roadName, String roadCode, double start, double end,String mergeField) {
	this.roadName = (roadName==null?"无名路":roadName);
	this.roadCode = roadCode;
	this.start = start;
	this.end = end;
	this.mil=Math.abs(DoubleUtil.subtract(end, start));
	this.mergeField=mergeField;
}
public MergeLine merge(MergeLine mergeLine)
{
	double[] d_x=new double[4];
	d_x[0]=start;
	d_x[1]=end;
	d_x[2]=mergeLine.getStart();
	d_x[3]=mergeLine.getEnd();
	Arrays.sort(d_x);
	start=d_x[0];
	end=d_x[3];
	mil=Math.abs(DoubleUtil.subtract(end, start));
	return this;
}

/**
 * @return the roadName
 */
public String getRoadName() {
	return roadName;
}
/**
 * @param roadName the roadName to set
 */
public void setRoadName(String roadName) {
	this.roadName = roadName;
}
/**
 * @return the roadCode
 */
public String getRoadCode() {
	return roadCode;
}
/**
 * @param roadCode the roadCode to set
 */
public void setRoadCode(String roadCode) {
	this.roadCode = roadCode;
}
/**
 * @return the start
 */
public double getStart() {
	return start;
}
/**
 * @param start the start to set
 */
public void setStart(double start) {
	this.start = start;
}
/**
 * @return the end
 */
public double getEnd() {
	return end;
}
/**
 * @param end the end to set
 */
public void setEnd(double end) {
	this.end = end;
}
/**
 * @return the mil
 */
public double getMil() {
	return mil;
}
/**
 * @param mil the mil to set
 */
public void setMil(double mil) {
	this.mil = mil;
}
public String getMergeField() {
	return mergeField;
}
public void setMergeField(String mergeField) {
	this.mergeField = mergeField;
}
public boolean equals(Object obj) {
	MergeLine line=(MergeLine) obj;
	if(ReflectUtil.getValue(mergeField,line).equals(ReflectUtil.getValue(mergeField,this)))
	{
		return true;
	}
	else
	{
		return false;
	}
}
@Override
public int hashCode() {
	int result = 17;
    result = 37 * result +((String) ReflectUtil.getValue(mergeField,this)).hashCode();
    return result;
}
}
