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

	Xmjbxx getJhxdByWh(Xmjbxx xmjbxx);

	Xmjbxx getdwByWh(Xmjbxx xmjbxx);

	Xmjbxx getdwcfByWh(Xmjbxx xmjbxx);

	Xmjbxx getdwByWhbj(Xmjbxx xmjbxx);

	Xmjbxx getbfByWhbj(Xmjbxx xmjbxx);

	Xmjbxx getbfcfByWh(Xmjbxx xmjbxx);

	Xmjbxx getbfByWh(Xmjbxx xmjbxx);

	

}
