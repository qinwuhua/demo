package com.hdsx.jxcsxm.zjtj.server.impl;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjtj.server.ZjtjServer;
import com.hdsx.jxcsxm.zjtj.bean.XmZjtj;


@Service
public class ZjtjServerImpl extends BaseOperate  implements ZjtjServer{

	public ZjtjServerImpl() {
		super("zjtj", "jdbc");
	}

	@Override
	public List<Xmjbxx> queryXmlist(Xmjbxx xmjbxx) {
		return queryList("queryXmlist",xmjbxx);
	}

	@Override
	public int queryXmlistCount(Xmjbxx xmjbxx) {
		return queryOne("queryXmlistCount", xmjbxx);
	}

	@Override
	public boolean insertZjtj(XmZjtj xmZjtj) {
		return insert("insertZjtj", xmZjtj)==1;
	}

	@Override
	public List<XmZjtj> queryzjtjlist(XmZjtj xmZjtj) {
		return queryList("queryzjtjlist",xmZjtj);
	}

	@Override
	public int queryzjtjlistCount(XmZjtj xmZjtj) {
		return  queryOne("queryzjtjlistCount",xmZjtj);
	}

	@Override
	public XmZjtj queryBfByid(XmZjtj xmZjtj) {
		return queryOne("queryBfByid", xmZjtj);
	}

	@Override
	public XmZjtj getbfTj(XmZjtj xmZjtj) {
		return queryOne("getbfTj", xmZjtj);
	}

	@Override
	public boolean updateZjtj(XmZjtj xmZjtj) {
		return update("updateZjtj", xmZjtj)>0;
	}
	
	@Override
	public boolean updateZjtjType(XmZjtj xmZjtj) {
		return update("updateZjtjType", xmZjtj)>0;
	}

	@Override
	public boolean delbf(XmZjtj xmZjtj) {
		return update("delbf", xmZjtj)>0;
	}

	@Override
	public List<XmZjtj> queryXmlistshqx(XmZjtj xmZjtj) {
		return queryList("queryXmlistshqx", xmZjtj);
	}

	@Override
	public int queryXmlistshqxCount(XmZjtj xmZjtj) {
		return queryOne("queryXmlistshqxCount", xmZjtj);
	}

	@Override
	public XmZjtj queryShqxByOne(XmZjtj xm) {
		return queryOne("queryShqxByOne", xm);
	}

	@Override
	public int insertShqx(List<XmZjtj> save) {
		return insertBatch("insertShqx", save);
	}

	@Override
	public int updateShqx(List<XmZjtj> update) {
		return updateBatch("updateShqx", update);
	}

	@Override
	public List<XmZjtj> queryZjByGydwdm(XmZjtj xmZjtj) {
		if("1".equals(xmZjtj.getGydwdm().substring(0, 1)))
			return queryList("queryZjByGydwdmJtj", xmZjtj);
		else
			return queryList("queryZjByGydwdm", xmZjtj);
	}
	
	@Override
	public List<XmZjtj> queryZjdwbfByGydwdm(XmZjtj xmZjtj) {
		if("1".equals(xmZjtj.getGydwdm().substring(0, 1)))
			return queryList("queryZjdwbfByGydwdmJtj", xmZjtj);
		else
			return queryList("queryZjdwbfByGydwdm", xmZjtj);
	}
	
	@Override
	public XmZjtj getbfTjAll(Xmjbxx xmjbxx) {
		return queryOne("getbfTjAll", xmjbxx);
	}

	@Override
	public boolean plshbf(XmZjtj xmZjtj) {
		return update("plshbf", xmZjtj)>0;
	}

	@Override
	public List<XmZjtj> queryzjtjmb(Xmjbxx xmjbxx) {
		return queryList("queryzjtjmb", xmjbxx);
	}

	@Override
	public boolean importZjtj(List<Map> data) {
		return insertBatch("importZjtj", data)==data.size();
	}

	@Override
	public boolean plsbbfxj(XmZjtj xmZjtj) {
		return update("plsbbfxj", xmZjtj)>0;
	}

	@Override
	public boolean plsbbfsj(XmZjtj xmZjtj) {
		return update("plsbbfsj", xmZjtj)>0;
	}

	@Override
	public boolean qbshbf(Xmjbxx xmjbxx) {
		return update("qbshbf",xmjbxx)>0;
	}

	@Override
	public List<XmZjtj> queryzjtjtbsj(Xmjbxx xmjbxx) {
		return queryList("queryzjtjtbsj", xmjbxx);
	}
	
	@Override
	public boolean delzjtjqb(Xmjbxx xmjbxx) {
		return delete("delzjtjqb",xmjbxx)>0;
	}
	
	@Override
	public boolean qbthsj(Xmjbxx xmjbxx) {
		
		return delete("qbthsj",xmjbxx)>0 | delete("qbthsjzgx",xmjbxx)>0;
	}

	@Override
	public boolean qbthxj(Xmjbxx xmjbxx) {
		return delete("qbthxj",xmjbxx)>0;
	}
}
