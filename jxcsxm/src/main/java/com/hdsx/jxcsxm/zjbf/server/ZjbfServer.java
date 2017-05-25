package com.hdsx.jxcsxm.zjbf.server;

import java.util.List;

import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjbf.bean.XmZjbf;


public interface ZjbfServer {

	List<Xmjbxx> queryXmlist(Xmjbxx xmjbxx);

	int queryXmlistCount(Xmjbxx xmjbxx);

	boolean insertZjbf(XmZjbf xmZjbf);

	List<XmZjbf> queryzjbflist(XmZjbf xmZjbf);

	int queryzjbflistCount(XmZjbf xmZjbf);

	XmZjbf queryBfByid(XmZjbf xmZjbf);

	XmZjbf getbfTj(XmZjbf xmZjbf);

	boolean updateZjbf(XmZjbf xmZjbf);

	boolean updateZjbfType(XmZjbf xmZjbf);

	boolean delbf(XmZjbf xmZjbf);

	

}
