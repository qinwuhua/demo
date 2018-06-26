package com.hdsx.jxcsxm.zjtj.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjtj.bean.XmZjtj;
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;


public interface ZjtjServer {

	List<Xmjbxx> queryXmlist(Xmjbxx xmjbxx);

	int queryXmlistCount(Xmjbxx xmjbxx);

	boolean insertZjtj(XmZjtj xmZjtj);

	List<XmZjtj> queryzjtjlist(XmZjtj xmZjtj);

	int queryzjtjlistCount(XmZjtj xmZjtj);

	XmZjtj queryTjByid(XmZjtj xmZjtj);

	XmZjtj gettjTj(XmZjtj xmZjtj);

	boolean updateZjtj(XmZjtj xmZjtj);

	boolean updateZjtjType(XmZjtj xmZjtj);

	boolean deltj(XmZjtj xmZjtj);

	List<XmZjtj> queryXmlistshqx(XmZjtj xmZjtj);

	int queryXmlistshqxCount(XmZjtj xmZjtj);

	XmZjtj queryShqxByOne(XmZjtj xm);

	int insertShqx(List<XmZjtj> save);

	int updateShqx(List<XmZjtj> update);

	List<XmZjtj> queryZjByGydwdm(XmZjtj xmZjtj);

	XmZjtj gettjTjAll(Xmjbxx xmjbxx);

	boolean plshbf(XmZjtj xmZjtj);

	List<XmZjtj> queryzjtjmb(Xmjbxx xmjbxx);

	boolean importZjtj(List<Map> data);

	boolean plsbbfxj(XmZjtj xmZjtj);

	boolean plsbbfsj(XmZjtj xmZjtj);

	List<XmZjtj> queryZjdwbfByGydwdm(XmZjtj xmZjtj);

	boolean qbshbf(Xmjbxx xmjbxx);

	List<XmZjtj> queryzjtjtbsj(Xmjbxx xmjbxx);

	boolean delzjtjqb(Xmjbxx xmjbxx);

	boolean qbthsj(Xmjbxx xmjbxx);

	boolean qbthxj(Xmjbxx xmjbxx);

	List<Xmjbxx> queryTjXmlist(Xmjbxx xmjbxx);

	int queryTjXmlistCount(Xmjbxx xmjbxx);

	XmZjtj getTjTjAll(Xmjbxx xmjbxx);

	boolean glxm(Xmjbxx xmjbxx);

	List<XmZjtj> getXm(String xmname);

	boolean insertZjtjxz(XmZjtj xmZjtj);

	List<XmZjtj> getxmwh(Xmjbxx xmjbxx);

	boolean qxgljh(Xmjbxx xmjbxx);

	List<Xmjbxx> queryXmlist_tj(Xmjbxx xmjbxx);

	int queryXmlist_tjCount(Xmjbxx xmjbxx);

	boolean yzglxmzj(Xmjbxx xmjbxx);
}
