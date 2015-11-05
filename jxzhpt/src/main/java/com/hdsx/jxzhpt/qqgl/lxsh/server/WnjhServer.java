package com.hdsx.jxzhpt.qqgl.lxsh.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Lxsh;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;

public interface WnjhServer {
	List<Lxsh> selectGjwnjh(Lxsh lxsh);
	int selectGjwnjhCount(Lxsh lxsh);
	List<Lxsh> wnjhGpsroad(Lxsh lxsh);
	boolean insertGjwnjh(Lxsh lxsh);
	boolean importsjgzwnjh(List<Map> data);
	List<Excel_list> querywnjhSjgz(Lxsh lxsh);
	List<Excel_list> querywnjhLmgz(Lxsh lxsh);
	List<Excel_list> querywnjhXj(Lxsh lxsh);
	boolean delwnjhSjgz(Lxsh lxsh);
	Lxsh cxwnghsjByid(Lxsh lxsh);
	Lxsh cxwnghlmByid(Lxsh lxsh);
	Lxsh cxwnghxjByid(Lxsh lxsh);
	boolean updatewnjhsj(Lxsh lxsh);
	void updateLx(Lx lx);
	List<Lxsh> selectlxbyxmid1(Lxsh lxsh);
	Lxsh sfylx(Lxsh lxsh);
	List<Lxsh> selectSjgzlxList(Lxsh lxsh);
	int selectSjgzlxListCount(Lxsh lxsh);
	List<Lxsh> selectLmwnjh(Lxsh lxsh);
	int selectLmwnjhCount(Lxsh lxsh);
	boolean insertLmwnjh(Lxsh lxsh);
	boolean importlmgzwnjh(List<Map> data);
	boolean delwnjhLmgz(Lxsh lxsh);
	Lxsh qqglGpszh(Lxsh lxsh);
	boolean updatewnjhlm(Lxsh lxsh);
	boolean updatewnjhxj(Lxsh lxsh);
	List<Lxsh> selectXjwnjh(Lxsh lxsh);
	int selectXjwnjhCount(Lxsh lxsh);
	boolean insertXjwnjh(Lxsh lxsh);
	boolean importxjwnjh(List<Map> data);
	boolean delwnjhXj(Lxsh lxsh);
	Lxsh selectGjwnjhcf(Lxsh lxsh);
	Lxsh selectLmwnjhcf(Lxsh lxsh);
	Lxsh selectXjwnjhcf(Lxsh lxsh);
	Lxsh wnjhGpsroad1(Lxsh lxsh);
	boolean insertGjlxwnjh(Lxsh lxsh);
	boolean updatewnjhsjlx(Lxsh lxsh);
	boolean deleteWnlx(Lxsh lxsh);
	Lxsh showgjtj(Lxsh lxsh);
	Lxsh showlmtj(Lxsh lxsh);
	Lxsh showxjtj(Lxsh lxsh);

}