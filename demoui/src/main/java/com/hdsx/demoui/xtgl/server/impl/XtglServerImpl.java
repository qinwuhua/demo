package com.hdsx.demoui.xtgl.server.impl;



import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.demoui.xtgl.server.XtglServer;

@Service
public class XtglServerImpl extends BaseOperate  implements XtglServer{

	public XtglServerImpl() {
		super("xtgl", "jdbc","jdbc_jh");
	}
	

}
