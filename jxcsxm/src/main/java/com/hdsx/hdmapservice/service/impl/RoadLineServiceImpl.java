package com.hdsx.hdmapservice.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.hdmapservice.bean.HDPoint;
import com.hdsx.hdmapservice.bean.MergeLine;
import com.hdsx.hdmapservice.bean.RoadLine;
import com.hdsx.hdmapservice.service.HDMeasureLine;
import com.hdsx.hdmapservice.service.RoadLineService;
import com.hdsx.hdmapservice.utile.LineUtil;
import com.hdsx.util.lang.ReflectUtil;
/**
 * 路线辅助类
 * @author kemi
 *
 */
public class RoadLineServiceImpl extends BaseOperate implements RoadLineService {

	private final static String HASM="hasm";
	private final static String NHASM="NHASM";
	public RoadLineServiceImpl() {
		super(RoadLine.class, "jdbc");
	}
	/**
	 * 得到地图标线字符串
	 * @param shapeList shape字段列表 不带M值
	 * @param isCompress 是否压缩
	 */
	public String getLineMark(List<byte[]> shapeList,boolean isCompress) {
		 String xyinfo=transformShape(shapeList,NHASM,isCompress);
		 return xyinfo;
	}
	/**
	 * 得到地图标线字符串
	 * @param shapeList shape字段列表 带M值
	 * @param isCompress 是否压缩
	 */
	public String getLineMarkM(List<byte[]> shapeList,boolean isCompress) {
	   String xyinfo=transformShape(shapeList,HASM,isCompress);
	   return xyinfo;
	}
	/**
	 * 桩号转坐标【经纬度】
	 * @param roadList 路段列表;需要包含路段的起止点桩号和shape字段;shape字段不包含M值
	 * @param pos 需要转化的桩号值
	 * @return 放回桩号对应的经纬度坐标对象
	 */
	public String getLonLatByRoadPos(List<RoadLine> roadList,float pos){
		SectionShape shape= getSectionPointList(roadList, NHASM);
		LineUtil lineUtil = new LineUtil();
		lineUtil.setStartmile(shape.getRoadStart());
		lineUtil.setEndmile(shape.getRoadEnd());
		lineUtil.init(shape.getPoints());
		HDPoint point = lineUtil.getHDPointByPos(pos);
        return point.getX()+","+point.getY();
	}
	
	
	/**
	 * 
	 * 桩号转坐标【经纬度】
	 * @param roadList 路段列表;需要包含路段的起止点桩号和shape字段;shape字段包含M值
	 * @param pos 需要转化的桩号值
	 * @return 放回桩号对应的经纬度坐标对象
	 */
	public String getLonLatByRoadPosM(List<RoadLine> roadList,float pos){
		SectionShape shape= getSectionPointList(roadList, HASM);
		LineUtil lineUtil = new LineUtil();
		lineUtil.setStartmile(shape.getRoadStart());
		lineUtil.setEndmile(shape.getRoadEnd());
		lineUtil.init(shape.getPoints());
	/*	List<HDPoint> points=shape.getPoints();
		for (HDPoint hdPoint : points) {
			System.out.println(hdPoint.getX()+","+hdPoint.getY()+","+hdPoint.getM());
		}*/
		HDPoint point = lineUtil.getHDPointByPos(pos);
        return  point.getX()+","+point.getY();
	}
	
	/**
	 * @坐标【经纬度】转桩号
	 * @param roadList 路段列表;需要包含路段的起止点桩号和shape字段;shape字段不包含M值
	 * @param x x坐标
	 * @param y y坐标
	 * @return
	 */
	public double getPosByLonLat(List<RoadLine> roadList,double x,double y){
		double pos = 0;
		SectionShape shape= getSectionPointList(roadList, NHASM);
		List<HDPoint> line_temp = shape.getPoints();
		LineUtil lineUtil = new LineUtil();
		lineUtil.setStartmile(shape.getRoadStart());
		lineUtil.setEndmile(shape.getRoadEnd());
		lineUtil.init(line_temp);
		pos = lineUtil.getMileByHDPoint(x,y);
		return pos;
	}
	private SectionShape getSectionPointList(List<RoadLine> roadList,String type){
		int len = roadList.size();
		float roadStart_zh = 0;
		float roadEnd_zh = 0;
		if(roadList != null && len > 0){
			roadStart_zh = (float)roadList.get(0).getRoadStart();
			roadEnd_zh = (float)roadList.get(len-1).getRoadEnds();
		}
		//---
		List<HDPoint> line_temp = new ArrayList<HDPoint>(); 
		HDMeasureLine measureLine = null;
		for (RoadLine roadLine : roadList) {
			measureLine = new HDMeasureLine();
			List<List<HDPoint>> lines=null;
			if(type.equals(HASM))
			{
			   lines= measureLine.BytesToLineM(roadLine.getShape());
			}else {
				lines=measureLine.BytesToLine(roadLine.getShape());
			}
			for (List<HDPoint> line : lines) {
				for (HDPoint point : line) {
					line_temp.add(point);
				}
			}
			}

		SectionShape shape = new SectionShape();
		shape.setPoints(line_temp);
		shape.setRoadStart(roadStart_zh);
		shape.setRoadEnd(roadEnd_zh);		
		return shape;
	}
	private String transformShape(List<byte[]> shapeList,String type,boolean isCompress)
	{
		StringBuffer shapeStr=new StringBuffer();
		if(type.equals(HASM))
		{
			for (byte[] shape : shapeList) {
				HDMeasureLine measureLine=new HDMeasureLine();
				measureLine.BytesToLineM(shape);
				String s;
				if(isCompress)
				{
				  s=measureLine.GetXYInfo();
				}
				else
				{
				  s=measureLine.myGetXYInfo();
				}
				if (!(s.equals("") || s == null))
					shapeStr.append(s).append("#");
			}
		}
		else
		{
			for ( byte[] shape : shapeList) {
				HDMeasureLine measureLine=new HDMeasureLine();
				measureLine.BytesToLine(shape);
				String s;
				if(isCompress)
				{
					  s=measureLine.GetXYInfo();
				}
				else
				{
					s=measureLine.myGetXYInfo();
				
				}
				if (!(s.equals("") || s == null))
					shapeStr.append(s).append("#");
			}
		}

	    return shapeStr.substring(0,shapeStr.length()-1);
	}
	private class SectionShape {
		private List<HDPoint> points = new ArrayList<HDPoint>(); 
		private float roadStart;
		private float roadEnd;
		
		public SectionShape() {}

		public List<HDPoint> getPoints() {
			return points;
		}

		public void setPoints(List<HDPoint> points) {
			this.points = points;
		}

		public float getRoadStart() {
			return roadStart;
		}

		public void setRoadStart(float roadStart) {
			this.roadStart = roadStart;
		}

		public float getRoadEnd() {
			return roadEnd;
		}

		public void setRoadEnd(float roadEnd) {
			this.roadEnd = roadEnd;
		}
	}
	/**
	 * 合并路段信息
	 * @param lines 待合并路线信息;
	 */
	public List<MergeLine> mergeLine(List<MergeLine> lines) {
		Map<String,MergeLine> resutMap=new HashMap<String,MergeLine>();
		for (MergeLine mergeLine : lines) {
			 String key=ReflectUtil.getValue(mergeLine.getMergeField(),mergeLine);
			 MergeLine tempMergeLine=resutMap.get(key);
			if(tempMergeLine==null)
			{
				resutMap.put(key,mergeLine);
			}
			else
			{
				resutMap.put(key, mergeLine.merge(tempMergeLine));
			}
		}
		List<MergeLine> list=new ArrayList<MergeLine>(resutMap.values());
		return list;
	}
	/**
	 * 获取路段的图形数据
	 * @param shapeList 路线图形（shape字段）列表
	 * @param roadStart 起点桩号
	 * @param roadEnds 止点桩号
	 * @param isCompress 是否压缩
	 */
	public String getSectionMark(List<byte[]> shapeList,double roadStart, double roadEnds, boolean isCompress) {
		StringBuffer shapeStr=new StringBuffer();
			for (byte[] shape : shapeList) {
				HDMeasureLine measureLine=new HDMeasureLine();
				//System.out.println("getSectionMark*****shape***"+shape);
				measureLine.BytesToLineM(shape);
				measureLine.MeasureLine(roadStart,roadEnds);
				String s;
				if(isCompress)
				{
				  s=measureLine.GetXYInfo();
				}
				else
				{
				  s=measureLine.myGetXYInfo();
				}
				if (!(s.equals("") || s == null))
					shapeStr.append(s).append("#");
			}
			 return shapeStr.substring(0,shapeStr.length()-1);
	}
}
