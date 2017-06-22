package com.hdsx.jxcsxm.zcgl.server;

import java.util.List;

import com.hdsx.jxcsxm.zcgl.bean.Zcgl;



public interface ZcglServer {

	List<Zcgl> queryZclist(Zcgl zcgl);

	int queryZclistCount(Zcgl zcgl);

	boolean getsfktj(Zcgl zcgl);

	boolean insertZcgl(Zcgl zcgl);

	boolean plsbshzc(Zcgl zcgl);

}
