package com.hdsx.jxcsxm.jhcx.server;

import java.util.List;

import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;


public interface JhcxServer {

	List<Xmjbxx> queryXmlist(Xmjbxx xmjbxx);

	int queryXmlistCount(Xmjbxx xmjbxx);

	

}
