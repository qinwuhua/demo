package com.hdsx.hdmapservice.service;

import java.util.List;

import com.hdsx.hdmapservice.bean.MergeLine;
import com.hdsx.hdmapservice.bean.RoadLine;

public interface RoadLineService {
	String getLineMarkM(List<byte[]> shapeList,boolean isCompress);
	String getLineMark(List<byte[]> shapeList,boolean isCompress);
    String getLonLatByRoadPos(List<RoadLine> roadList,float pos);
	String getLonLatByRoadPosM(List<RoadLine> roadList,float pos);
	List<MergeLine> mergeLine(List<MergeLine> lines);
	String getSectionMark(List<byte[]> shapeList,double roadStart, double roadEnds,boolean isCompress);
}
