package com.hdsx.jxcsxm.zjdw.server;

import java.util.List;

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

	

}
