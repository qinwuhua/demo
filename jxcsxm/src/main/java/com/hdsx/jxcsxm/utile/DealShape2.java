package com.hdsx.jxcsxm.utile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.hdsx.hdmapservice.service.impl.RoadLineServiceImpl;


public class DealShape2<T>{
	
	public   List<HashMap<String,String>>   getXyHashMapList(String roadcode,byte[] shape) throws Exception{
		RoadLineServiceImpl rl = new RoadLineServiceImpl();
		List<byte[]> lbList = new ArrayList<byte[]>();
		lbList.add(shape); 
		String shapeString = rl.getLineMark(lbList,true);
		//System.out.println(shapeString);
		return dealShapeString(shapeString);
	}
	/**
	 * 
	 * @param roadcode 路线编码
	 * @param shape 空间shape
	 * @param roadstart 起点桩号
	 * @param roadends 终点桩号
	 * @return
	 * @throws Exception
	 */
	public   List<HashMap<String,String>>   getXyHashMapList(String roadcode,byte[] shape, double roadstart, double roadends){
		List<byte[]> lbList = new ArrayList<byte[]>();
		lbList.add(shape);
		RoadLineServiceImpl rl = new RoadLineServiceImpl();
		
		try{
			String shapeString = rl.getSectionMark(lbList,roadstart, roadends, false);
			
			return dealShapeString(shapeString);
		}catch(Exception e){
			e.getStackTrace();
		}
		return new ArrayList<HashMap<String,String>>() ;
	}
	
	
	/**
	 * 
	 * @param roadcode 路线编码
	 * @param shape 空间shape
	 * @param roadstart 起点桩号
	 * @param roadends 终点桩号
	 * @return
	 * @throws Exception
	 */
	public   List<HashMap<String,String>>   getXyHashMapList(List<String> roadcodeList,List<byte[]> shapeList, List<Double> roadstartList, List<Double> roadendsList) throws Exception{
		List<HashMap<String,String>> XyHashMapList = new ArrayList<HashMap<String,String>>();
		for(int i = 0; i < roadcodeList.size(); i++){
			byte[] shape = shapeList.get(i);
			double roadstart = roadstartList.get(i);
			double roadends = roadendsList.get(i);
			XyHashMapList.addAll(getXyHashMapList(null, shape, roadstart, roadends));
		}
		return XyHashMapList;
	}
	/**
	 * 将shapeString 字符串构处理成hashmap形式的结构
	 * @param shapeString 
	 * @param xyHashMapList
	 * @return
	 */
	private List<HashMap<String,String>> dealShapeString(String shapeString){
		List<HashMap<String,String>> xyHashMapList = new ArrayList<HashMap<String,String>>();
		String[] xyArray = null;
		xyArray = shapeString.split("\\|"); 
		for(String xy : xyArray){
			Map<String,String> xyHashMap = new HashMap<String,String>();
			String[] temp = xy.split(",");
			xyHashMap.put("x", temp[0]);
			xyHashMap.put("y", temp[1]);
			xyHashMapList.add((HashMap<String, String>) xyHashMap);
		}
		return xyHashMapList;
	}
}
