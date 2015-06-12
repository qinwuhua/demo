package com.hdsx.jxzhpt.qqgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxzhpt.qqgl.bean.Lx;
import com.hdsx.jxzhpt.qqgl.bean.Xmsq;
import com.hdsx.jxzhpt.qqgl.server.XmsqServer;
@Service
public class XmsqServerImpl extends BaseOperate implements XmsqServer {
	public XmsqServerImpl(){
		super("xmsq", "jdbc");
	}
	private Map<String, Object> params=new HashMap<String, Object>();
	@Override
	public boolean insertXmsqYhdzx(List<Xmsq> list) {
		return insertBatch("insertXmsqYhdzx",list)==list.size();
	}
	@Override
	public boolean insertXmsqSh(List<Xmsq> list) {
		return insertBatch("insertXmsqSh",list)==list.size();
	}
	@Override
	public String queryYhdzxNextXmbm() {
		return queryOne("queryYhdzxNextXmbm", null);
	}
	@Override
	public String queryShNextXmbm() {
		return queryOne("queryShNextXmbm", null);
	}
	@Override
	public List<Lx> queryAutoList(Xmsq xmsq) {
		return queryList("queryAutoList",xmsq);
	}
	@Override
	public int queryLsjl(String ylxbh, String qdzh, String zdzh) {
		params.put("lxbm", ylxbh);
		params.put("qdzh", qdzh);
		params.put("zdzh", zdzh);
		return queryOne("queryLsjl", params);
	}
	@Override
	public boolean insertLx(Lx lx) {
		return insert("insertLx", lx)>0;
	}
	@Override
	public List<String> queryTsdq(Xmsq xmsq) {
		return queryList("queryTsdq",xmsq);
	}
	@Override
	public List<Xmsq> queryYhdzxXmsq(Xmsq xmsq,int page,int rows) {
		params.put("xmsq", xmsq);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryYhdzxXmsq",params);
	}
	@Override
	public List<Xmsq> queryShXmsq(Xmsq xmsq,int page,int rows) {
		params.put("xmsq", xmsq);
		params.put("page", page);
		params.put("rows", rows);
		return queryList("queryShXmsq",params);
	}
	@Override
	public int queryYhdzxCount(Xmsq xmsq) {
		return queryOne("queryYhdzxCount", xmsq);
	}
	@Override
	public int queryShCount(Xmsq xmsq) {
		return queryOne("queryShCount", xmsq);
	}
	@Override
	public boolean deleteYhdzxByXmbm(String xmbm) {
		String[] split = xmbm.split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq xmsq=new Xmsq();
			xmsq.setXmbm(x);
			list.add(xmsq);
		}
		return deleteBatch("deleteYhdzxByXmbm", list)==list.size();
	}
	@Override
	public boolean deleteShByXmbm(String xmbm) {
		String[] split = xmbm.split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq xmsq=new Xmsq();
			xmsq.setXmbm(x);
			list.add(xmsq);
		}
		return deleteBatch("deleteShByXmbm", list)==list.size();
	}
	@Override
	public boolean updateYhdzxSqzt(Xmsq xmsq) {
		String[] split = xmsq.getXmbm().split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq item =new Xmsq();
			item.setXmbm(x);
			item.setSqzt(xmsq.getSqzt());
			list.add(item);
		}
		return updateBatch("updateYhdzxSqzt", list)==list.size();
	}
	@Override
	public boolean updateShSqzt(Xmsq xmsq) {
		String[] split = xmsq.getXmbm().split(",");
		List<Xmsq> list=new ArrayList<Xmsq>();
		for (String x : split) {
			Xmsq item =new Xmsq();
			item.setXmbm(x);
			item.setSqzt(xmsq.getSqzt());
			list.add(item);
		}
		return updateBatch("updateShSqzt", list)==list.size();
	}
	@Override
	public boolean insertJhshYhdzx(Xmsq xmsq) {
		String[] split = xmsq.getXmbm().split(",");
		return insert("insertJhshYhdzx", xmsq)==split.length;
	}
	@Override
	public boolean insertJhshSh(Xmsq xmsq) {
		String[] split = xmsq.getXmbm().split(",");
		return insert("insertJhshSh", xmsq)==split.length;
	}

}
