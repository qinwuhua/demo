package com.hdsx.jxcsxm.zjbf.server.impl;



import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjbf.server.ZjbfServer;
import com.hdsx.jxcsxm.zjbf.bean.XmZjbf;


@Service
public class ZjbfServerImpl extends BaseOperate  implements ZjbfServer{

	public ZjbfServerImpl() {
		super("zjbf", "jdbc");
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
	public boolean insertZjbf(XmZjbf xmZjbf) {
		return insert("insertZjbf", xmZjbf)==1;
	}

	@Override
	public List<XmZjbf> queryzjbflist(XmZjbf xmZjbf) {
		return queryList("queryzjbflist",xmZjbf);
	}

	@Override
	public int queryzjbflistCount(XmZjbf xmZjbf) {
		return  queryOne("queryzjbflistCount",xmZjbf);
	}

	@Override
	public XmZjbf queryBfByid(XmZjbf xmZjbf) {
		return queryOne("queryBfByid", xmZjbf);
	}

	@Override
	public XmZjbf getbfTj(XmZjbf xmZjbf) {
		return queryOne("getbfTj", xmZjbf);
	}

	@Override
	public boolean updateZjbf(XmZjbf xmZjbf) {
		return update("updateZjbf", xmZjbf)>0;
	}
	
	@Override
	public boolean updateZjbfType(XmZjbf xmZjbf) {
		return update("updateZjbfType", xmZjbf)>0;
	}

	@Override
	public boolean delbf(XmZjbf xmZjbf) {
		return update("delbf", xmZjbf)>0;
	}

	@Override
	public List<XmZjbf> queryXmlistshqx(XmZjbf xmZjbf) {
		return queryList("queryXmlistshqx", xmZjbf);
	}

	@Override
	public int queryXmlistshqxCount(XmZjbf xmZjbf) {
		return queryOne("queryXmlistshqxCount", xmZjbf);
	}

	@Override
	public XmZjbf queryShqxByOne(XmZjbf xm) {
		return queryOne("queryShqxByOne", xm);
	}

	@Override
	public int insertShqx(List<XmZjbf> save) {
		return insertBatch("insertShqx", save);
	}

	@Override
	public int updateShqx(List<XmZjbf> update) {
		return updateBatch("updateShqx", update);
	}

	@Override
	public List<XmZjbf> queryZjByGydwdm(XmZjbf xmZjbf) {
		if("1".equals(xmZjbf.getGydwdm().substring(0, 1)))
			return queryList("queryZjByGydwdmJtj", xmZjbf);
		else
			return queryList("queryZjByGydwdm", xmZjbf);
	}
	
	@Override
	public List<XmZjbf> queryZjdwbfByGydwdm(XmZjbf xmZjbf) {
		if("1".equals(xmZjbf.getGydwdm().substring(0, 1)))
			return queryList("queryZjdwbfByGydwdmJtj", xmZjbf);
		else
			return queryList("queryZjdwbfByGydwdm", xmZjbf);
	}
	
	@Override
	public XmZjbf getbfTjAll(Xmjbxx xmjbxx) {
		return queryOne("getbfTjAll", xmjbxx);
	}

	@Override
	public boolean plshbf(XmZjbf xmZjbf) {
		return update("plshbf", xmZjbf)>0;
	}

	@Override
	public List<XmZjbf> queryzjbfmb(Xmjbxx xmjbxx) {
		return queryList("queryzjbfmb", xmjbxx);
	}

	@Override
	public boolean importZjbf(List<Map> data) {
		return insertBatch("importZjbf", data)==data.size();
	}

	@Override
	public boolean plsbbfxj(XmZjbf xmZjbf) {
		return update("plsbbfxj", xmZjbf)>0;
	}

	@Override
	public boolean plsbbfsj(XmZjbf xmZjbf) {
		return update("plsbbfsj", xmZjbf)>0;
	}

	@Override
	public boolean qbshbf(Xmjbxx xmjbxx) {
		return update("qbshbf",xmjbxx)>0;
	}

	@Override
	public List<XmZjbf> queryzjbftbsj(Xmjbxx xmjbxx) {
		return queryList("queryzjbftbsj", xmjbxx);
	}
	
	@Override
	public boolean delzjbfqb(Xmjbxx xmjbxx) {
		return delete("delzjbfqb",xmjbxx)>0;
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
