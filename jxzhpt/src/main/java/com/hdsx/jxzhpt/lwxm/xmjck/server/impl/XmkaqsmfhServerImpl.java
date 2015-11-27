package com.hdsx.jxzhpt.lwxm.xmjck.server.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.jhgl.bean.Plan_upload;
import com.hdsx.jxzhpt.jhgl.bean.Planwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgzsj;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Xmkaqsmfh;
import com.hdsx.jxzhpt.lwxm.xmjck.server.JckwqgzsjServer;
import com.hdsx.jxzhpt.lwxm.xmjck.server.XmkaqsmfhServer;
import com.hdsx.jxzhpt.qqgl.lxsh.bean.Wqbzbz;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
@Service
public class XmkaqsmfhServerImpl extends BaseOperate implements XmkaqsmfhServer {
	private Map<String, Object> hm;
	private ArrayList<String> list;
	private List<Map<String,Object>> lm;
	public XmkaqsmfhServerImpl() {
		super("xmkaqsmfh", "jdbc");
	}
	@Override
	public List<Xmkaqsmfh> selectXmkaqsmfhXMK(Xmkaqsmfh xmkaqsmfh) {
		return queryList("selectXmkaqsmfhXMK",xmkaqsmfh);
	}
	@Override
	public int selectXmkaqsmfhXMKCount(Xmkaqsmfh xmkaqsmfh) {
		return queryOne("selectXmkaqsmfhXMKCount", xmkaqsmfh);
	}
	@Override
	public Xmkaqsmfh loadXmkaqsmfhXMKCount(Xmkaqsmfh xmkaqsmfh) {
		
		return queryOne("loadXmkaqsmfhXMKCount", xmkaqsmfh);
	}
	@Override
	public List<Xmkaqsmfh> smfhGpsroad(Xmkaqsmfh roadcode) {
		hm = new HashMap<String, Object>();
		hm.put("roadcode", roadcode.getRoadcode());
		hm.put("unitcode", roadcode.getUnitcode());
		hm.put("distcode", roadcode.getDistcode());
		return queryList("smfhGpsroad", hm);
	}
	@Override
	public boolean insertAqsmfhxmk(Xmkaqsmfh xmkaqsmfh) {
		return insert("insertAqsmfhxmk", xmkaqsmfh)==1;
	}
	@Override
	public boolean xgXmkAFSbzt(Xmkaqsmfh xmkaqsmfh) {
		String[] strs = xmkaqsmfh.getId().split(",");
		String[] sbth = xmkaqsmfh.getSbthcd().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sbthcd", sbth[i]);
			lm.add(hm);
		}
		if(updateBatch("xgXmkAFSbzt", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean updateAqsmfhxmk(Xmkaqsmfh xmkaqsmfh) {
		return update("updateAqsmfhxmk", xmkaqsmfh)==1;
	}
	@Override
	public boolean deleteAfxmkById(Xmkaqsmfh xmkaqsmfh) {
		String[] strs = xmkaqsmfh.getId().split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(deleteBatch("deleteAfxmkById", list)>0) return true;
		else return false;
	}
	@Override
	public List<Xmkaqsmfh> selectSckaqsmfh(Xmkaqsmfh xmkaqsmfh) {
		return queryList("selectSckaqsmfh",xmkaqsmfh);
	}
	@Override
	public int selectSckaqsmfhCount(Xmkaqsmfh xmkaqsmfh) {
		return queryOne("selectSckaqsmfhCount", xmkaqsmfh);
	}
	@Override
	public List<Xmkaqsmfh> selectSckaqsmfhsh(Xmkaqsmfh xmkaqsmfh) {
		return queryList("selectSckaqsmfhsh",xmkaqsmfh);
	}
	@Override
	public int selectSckaqsmfhshCount(Xmkaqsmfh xmkaqsmfh) {
		return queryOne("selectSckaqsmfhshCount", xmkaqsmfh);
	}
	
	@Override
	public Xmkaqsmfh loadSckaqsmfhCount(Xmkaqsmfh xmkaqsmfh) {
		return queryOne("loadSckaqsmfhCount", xmkaqsmfh);
	}
	@Override
	public Xmkaqsmfh loadSckaqsmfhshCount(Xmkaqsmfh xmkaqsmfh) {
		return queryOne("loadSckaqsmfhshCount", xmkaqsmfh);
	}
	@Override
	public List<Xmkaqsmfh> aqsmfhJckGpsRoad(Xmkaqsmfh xmkaqsmfh) {
		hm = new HashMap<String, Object>();
		hm.put("roadcode", xmkaqsmfh.getRoadcode());
		hm.put("unitcode", xmkaqsmfh.getUnitcode());
		hm.put("distcode", xmkaqsmfh.getDistcode());
		return queryList("aqsmfhJckGpsRoad", hm);
	}
	@Override
	public boolean insertAqsmfhsck(Xmkaqsmfh xmkaqsmfh) {
		return insert("insertAqsmfhsck", xmkaqsmfh)==1;
	}
	@Override
	public List<Xmkaqsmfh> selectafldList(Xmkaqsmfh xmkaqsmfh) {
		return queryList("selectafldList",xmkaqsmfh);
	}
	@Override
	public Xmkaqsmfh selectAqsmfhsckbyid(Xmkaqsmfh xmkaqsmfh) {
		return queryOne("selectAqsmfhsckbyid", xmkaqsmfh);
	}
	@Override
	public Xmkaqsmfh selectAqsmfhxmkbyid(Xmkaqsmfh xmkaqsmfh) {
		return queryOne("selectAqsmfhxmkbyid", xmkaqsmfh);
	}
	@Override
	public boolean updateAqsmfhsck(Xmkaqsmfh xmkaqsmfh) {
		return update("updateAqsmfhsck", xmkaqsmfh)==1;
	}
	@Override
	public List<Xmkaqsmfh> selectSckaqsmfhld(Xmkaqsmfh xmkaqsmfh) {
		return queryList("selectSckaqsmfhld",xmkaqsmfh);
	}
	@Override
	public boolean insertAqsmfhsckld(Xmkaqsmfh xmkaqsmfh) {
		return insert("insertAqsmfhsckld", xmkaqsmfh)==1;
	}
	@Override
	public Xmkaqsmfh loadscktjld(Xmkaqsmfh xmkaqsmfh) {
		return queryOne("loadscktjld", xmkaqsmfh);
	}
	@Override
	public boolean delafldsck(Xmkaqsmfh xmkaqsmfh) {
		return delete("delafldsck",xmkaqsmfh)==1;
	}
	@Override
	public boolean deleteSckAf(Xmkaqsmfh xmkaqsmfh) {
		String[] strs = xmkaqsmfh.getXmbm().split(",");
		list = new ArrayList<String>();
		for (int i = 0; i < strs.length; i++) {
			list.add(strs[i]);
		}
		if(deleteBatch("deleteSckAf", list)>0) {
			deleteBatch("deleteSckAfld", list);
			return true;
		}
		else return false;
	}
	@Override
	public boolean sckAfSb(Xmkaqsmfh xmkaqsmfh) {
		String[] strs = xmkaqsmfh.getId().split(",");
		String[] sbth = xmkaqsmfh.getSbthbmcd().split(",");
		lm=new ArrayList<Map<String,Object>>();
		for (int i = 0; i < strs.length; i++) {
			hm=new HashMap<String, Object>();
			hm.put("id", strs[i]);
			hm.put("sbthbmcd", sbth[i]);
			lm.add(hm);
		}
		if(updateBatch("sckAfSb", lm)>0) return true;
		else return false;
	}
	@Override
	public boolean afSckCs(Xmkaqsmfh xmkaqsmfh) {
		return update("afSckCs", xmkaqsmfh)==1;
	}
	@Override
	public boolean afSckZs(Xmkaqsmfh xmkaqsmfh) {
		return update("afSckZs", xmkaqsmfh)==1;
	}
	
	
}
