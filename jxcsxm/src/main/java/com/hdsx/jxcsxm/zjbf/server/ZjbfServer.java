package com.hdsx.jxcsxm.zjbf.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjbf.bean.XmZjbf;
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;


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

	List<XmZjbf> queryXmlistshqx(XmZjbf xmZjbf);

	int queryXmlistshqxCount(XmZjbf xmZjbf);

	XmZjbf queryShqxByOne(XmZjbf xm);

	int insertShqx(List<XmZjbf> save);

	int updateShqx(List<XmZjbf> update);

	List<XmZjbf> queryZjByGydwdm(XmZjbf xmZjbf);

	XmZjbf getbfTjAll(Xmjbxx xmjbxx);

	boolean plshbf(XmZjbf xmZjbf);

	List<XmZjbf> queryzjbfmb(Xmjbxx xmjbxx);

	boolean importZjbf(List<Map> data);

	boolean plsbbfxj(XmZjbf xmZjbf);

	boolean plsbbfsj(XmZjbf xmZjbf);

	List<XmZjbf> queryZjdwbfByGydwdm(XmZjbf xmZjbf);

	boolean qbshbf(Xmjbxx xmjbxx);

	

}
