package com.hdsx.jxcsxm.jhcx.server;

import java.util.List;

import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;


public interface JhcxServer {

	List<Xmjbxx> queryXmlist(Xmjbxx xmjbxx);

	int queryXmlistCount(Xmjbxx xmjbxx);

	Xmjbxx getTjAll(Xmjbxx xmjbxx);

	Xmjbxx getxmInfo(Xmjbxx xmjbxx);

	List<Xmjbxx> queryZjByGydwdm(Xmjbxx xmjbxx);

	Xmjbxx gettjxmInfo(Xmjbxx xmjbxx);

	

}
