package com.hdsx.jxcsxm.jhcx.server.impl;



import java.util.List;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.jhcx.server.JhcxServer;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;


@Service
public class JhcxServerImpl extends BaseOperate  implements JhcxServer{

	public JhcxServerImpl() {
		super("jhcx", "jdbc");
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
	public Xmjbxx getTjAll(Xmjbxx xmjbxx) {
		return queryOne("getTjAll", xmjbxx);
	}

	@Override
	public Xmjbxx getxmInfo(Xmjbxx xmjbxx) {
		return queryOne("getxmInfo", xmjbxx);
	}

	@Override
	public List<Xmjbxx> queryZjByGydwdm(Xmjbxx xmjbxx) {
		if("1".equals(xmjbxx.getGydwdm().substring(0, 1)))
			return queryList("queryZjByGydwdmJtj", xmjbxx);
		else
			return queryList("queryZjByGydwdm", xmjbxx);	
	}

	@Override
	public Xmjbxx gettjxmInfo(Xmjbxx xmjbxx) {
		return queryOne("gettjxmInfo", xmjbxx);
	}
	
	
	
}
