package com.hdsx.jxcsxm.zjdw.server.impl;



import java.util.List;
import java.util.Map;

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

	@Override
	public List<XmZjdw> queryXmlistshqx(XmZjdw xmZjdw) {
		return queryList("queryXmlistshqx", xmZjdw);
	}

	@Override
	public int queryXmlistshqxCount(XmZjdw xmZjdw) {
		return queryOne("queryXmlistshqxCount", xmZjdw);
	}

	@Override
	public List<XmZjdw> queryChildGydw(XmZjdw xmZjdw) {
		if("1".equals(xmZjdw.getGydw().substring(0,1)))
			return queryList("queryChildGydwJtj", xmZjdw);
		else
			return queryList("queryChildGydw", xmZjdw);
	}

	@Override
	public XmZjdw queryShqxByOne(XmZjdw xm) {
		return queryOne("queryShqxByOne", xm);
	}

	@Override
	public int insertShqx(List<XmZjdw> xm) {
		return insertBatch("insertShqx", xm);
	}

	@Override
	public int updateShqx(List<XmZjdw> xm) {
		return updateBatch("updateShqx", xm);
	}

	@Override
	public List<XmZjdw> queryZjByGydwdm(XmZjdw xmZjdw) {
		if("1".equals(xmZjdw.getGydwdm().substring(0, 1)))
			return queryList("queryZjByGydwdmJtj", xmZjdw);
		else
			return queryList("queryZjByGydwdm", xmZjdw);	
	}

	@Override
	public List<XmZjdw> queryZjxddwByGydwdm(XmZjdw xmZjdw) {
		if("1".equals(xmZjdw.getGydwdm().substring(0, 1)))
			return queryList("queryZjxddwByGydwdmJtj", xmZjdw);
		else
			return queryList("queryZjxddwByGydwdm", xmZjdw);	
	}
	
	@Override
	public XmZjdw getdwTjAll(Xmjbxx xmZjdw) {
		return queryOne("getdwTjAll", xmZjdw);
	}

	@Override
	public boolean plshdw(XmZjdw xmZjdw) {
		return update("plshdw", xmZjdw)>0;
	}

	@Override
	public List<XmZjdw> queryzjxdlist(XmZjdw xmZjdw) {
		return queryList("queryzjxdlist", xmZjdw);
	}

	@Override
	public int queryzjxdlistCount(XmZjdw xmZjdw) {
		return queryOne("queryzjxdlistCount", xmZjdw);
	}

	@Override
	public List<XmZjdw> queryzjdwmb(Xmjbxx xmjbxx) {
		return queryList("queryzjdwmb",xmjbxx);
	}

	@Override
	public List<XmZjdw> queryzjdwmbjyzj(Xmjbxx xmjbxx) {
		return queryList("queryzjdwmbjyzj",xmjbxx);
	}
	
	@Override
	public boolean importZjdw(List<Map> data) {
		return insertBatch("importZjdw", data)==data.size();
	}
	
	@Override
	public boolean plsbdwxj(XmZjdw xmZjdw) {
		return update("plsbdwxj", xmZjdw)>0;
	}

	@Override
	public boolean plsbdwsj(XmZjdw xmZjdw) {
		return update("plsbdwsj", xmZjdw)>0;
	}

	@Override
	public List<XmZjdw> queryZjjyByXmbm(String data) {
		return queryList("queryZjjyByXmbm", data);
	}

	@Override
	public boolean importZjdwjyzjtj(List<Map<String, String>> l) {
		return insertBatch("importZjdwjyzjtj", l)==l.size();
	}

	@Override
	public boolean importZjdwjyzjxg(List<Map<String, String>> l) {
		return updateBatch("importZjdwjyzjxg", l)==l.size();
	}

	
	
}
