package com.hdsx.jxcsxm.zjdw.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;


public interface ZjdwServer {

	List<Xmjbxx> queryXmlist(Xmjbxx xmjbxx);

	int queryXmlistCount(Xmjbxx xmjbxx);

	boolean insertZjdw(XmZjdw xmZjdw);

	List<XmZjdw> queryzjdwlist(XmZjdw xmZjdw);

	int queryzjdwlistCount(XmZjdw xmZjdw);

	XmZjdw queryDwByid(XmZjdw xmZjdw);

	XmZjdw getdwTj(XmZjdw xmZjdw);

	boolean updateZjdw(XmZjdw xmZjdw);

	boolean updateZjdwType(XmZjdw xmZjdw);

	boolean deldw(XmZjdw xmZjdw);

	List<XmZjdw> queryXmlistshqx(XmZjdw xmZjdw);

	int queryXmlistshqxCount(XmZjdw xmZjdw);

	List<XmZjdw> queryChildGydw(XmZjdw xmZjdw);

	XmZjdw queryShqxByOne(XmZjdw xm);

	int insertShqx(List<XmZjdw> xm);

	int updateShqx(List<XmZjdw> xm);

	List<XmZjdw> queryZjByGydwdm(XmZjdw xmZjdw);

	XmZjdw getdwTjAll(Xmjbxx xmZjdw);

	boolean plshdw(XmZjdw xmZjdw);

	List<XmZjdw> queryzjxdlist(XmZjdw xmZjdw);

	int queryzjxdlistCount(XmZjdw xmZjdw);

	List<XmZjdw> queryzjdwmb(Xmjbxx xmjbxx);
	
	List<XmZjdw> queryzjdwmbjyzj(Xmjbxx xmjbxx);

	boolean importZjdw(List<Map> data);
	
	boolean plsbdwxj(XmZjdw xmZjdw);
	
	boolean plsbdwsj(XmZjdw xmZjdw);

	List<XmZjdw> queryZjxddwByGydwdm(XmZjdw xmZjdw);

	List<XmZjdw> queryZjjyByXmbm(String data);

	boolean importZjdwjyzjtj(List<Map<String, String>> l);
	
	boolean importZjdwjyzjxg(List<Map<String, String>> l);

	List<XmZjdw> queryzjdwtbsj(Xmjbxx xmjbxx);

	boolean qbshdw(Xmjbxx xmjbxx);

	

}
