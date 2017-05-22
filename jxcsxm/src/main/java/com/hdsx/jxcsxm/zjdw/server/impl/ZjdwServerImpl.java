package com.hdsx.jxcsxm.zjdw.server.impl;



import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;
import com.hdsx.jxcsxm.zjdw.server.ZjdwServer;


@Service
public class ZjdwServerImpl extends BaseOperate  implements ZjdwServer{

	public ZjdwServerImpl() {
		super("zjdw", "jdbc");
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
	public boolean insertZjdw(XmZjdw xmZjdw) {
		return insert("insertZjdw", xmZjdw)==1;
	}

	@Override
	public List<XmZjdw> queryzjdwlist(XmZjdw xmZjdw) {
		return queryList("queryzjdwlist",xmZjdw);
	}

	@Override
	public int queryzjdwlistCount(XmZjdw xmZjdw) {
		return  queryOne("queryzjdwlistCount",xmZjdw);
	}

	@Override
	public XmZjdw queryDwByid(XmZjdw xmZjdw) {
		return queryOne("queryDwByid", xmZjdw);
	}

	@Override
	public XmZjdw getdwTj(XmZjdw xmZjdw) {
		return queryOne("getdwTj", xmZjdw);
	}

	@Override
	public boolean updateZjdw(XmZjdw xmZjdw) {
		return update("updateZjdw", xmZjdw)>0;
	}
	
	@Override
	public boolean updateZjdwType(XmZjdw xmZjdw) {
		return update("updateZjdwType", xmZjdw)>0;
	}

	@Override
	public boolean deldw(XmZjdw xmZjdw) {
		return update("deldw", xmZjdw)>0;
	}
	
}
