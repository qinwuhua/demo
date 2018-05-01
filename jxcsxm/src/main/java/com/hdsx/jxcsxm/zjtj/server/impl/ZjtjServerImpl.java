package com.hdsx.jxcsxm.zjtj.server.impl;



import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjtj.server.ZjtjServer;
import com.hdsx.jxcsxm.zjtj.bean.XmZjtj;


@Service
public class ZjtjServerImpl extends BaseOperate  implements ZjtjServer{

	public ZjtjServerImpl() {
		super("zjtj", "jdbc");
	}

	@Override
	public List<Xmjbxx> queryXmlist(Xmjbxx xmjbxx) {
		return queryList("queryXmlist",xmjbxx);
	}

	@Override
	public int queryXmlistCount(Xmjbxx xmjbxx) {
		return queryOne("queryXmlistCount", xmjbxx);
	}

	@Override
	public boolean insertZjtj(XmZjtj xmZjtj) {
		//生成guid
		String xmbm = UUID.randomUUID().toString();
		xmZjtj.setXmbm(xmbm);xmZjtj.setSbthcd("7");xmZjtj.setXsbzt("已上报");xmZjtj.setSsbzt("已上报");xmZjtj.setShzt("已审核");
		//添加项目
		int i=insert("insertZjtjXm", xmZjtj);
		//添加资金到位数据
		int j=insert("insertZjtjDw", xmZjtj);
		//返回
		return i==1&&j==1;
	}

	@Override
	public List<XmZjtj> queryzjtjlist(XmZjtj xmZjtj) {
		return queryList("queryzjtjlist",xmZjtj);
	}

	@Override
	public int queryzjtjlistCount(XmZjtj xmZjtj) {
		return  queryOne("queryzjtjlistCount",xmZjtj);
	}

	@Override
	public XmZjtj queryTjByid(XmZjtj xmZjtj) {
		return queryOne("queryTjByid", xmZjtj);
	}

	@Override
	public XmZjtj gettjTj(XmZjtj xmZjtj) {
		return queryOne("gettjTj", xmZjtj);
	}

	@Override
	public boolean updateZjtj(XmZjtj xmZjtj) {
		delete("deleteZjtjXm", xmZjtj);
		delete("deleteZjtjDw", xmZjtj);
		//生成guid
		String xmbm = UUID.randomUUID().toString();
		xmZjtj.setXmbm(xmbm);xmZjtj.setSbthcd("7");xmZjtj.setXsbzt("已上报");xmZjtj.setSsbzt("已上报");xmZjtj.setShzt("已审核");
		//添加项目
		int i=insert("insertZjtjXm", xmZjtj);
		//添加资金到位数据
		int j=insert("insertZjtjDw", xmZjtj);
		//返回
		return i==1&&j==1;
	}
	
	@Override
	public boolean updateZjtjType(XmZjtj xmZjtj) {
		int i=delete("deleteZjtjXm", xmZjtj);
		int j=delete("deleteZjtjDw", xmZjtj);
		return i==1&&j==1; 
	}

	@Override
	public boolean deltj(XmZjtj xmZjtj) {
		int i=delete("deleteZjtjXm", xmZjtj);
		int j=delete("deleteZjtjDw", xmZjtj);
		return i==1&&j==1; 
	}

	@Override
	public List<XmZjtj> queryXmlistshqx(XmZjtj xmZjtj) {
		return queryList("queryXmlistshqx", xmZjtj);
	}

	@Override
	public int queryXmlistshqxCount(XmZjtj xmZjtj) {
		return queryOne("queryXmlistshqxCount", xmZjtj);
	}

	@Override
	public XmZjtj queryShqxByOne(XmZjtj xm) {
		return queryOne("queryShqxByOne", xm);
	}

	@Override
	public int insertShqx(List<XmZjtj> save) {
		return insertBatch("insertShqx", save);
	}

	@Override
	public int updateShqx(List<XmZjtj> update) {
		return updateBatch("updateShqx", update);
	}

	@Override
	public List<XmZjtj> queryZjByGydwdm(XmZjtj xmZjtj) {
		if("1".equals(xmZjtj.getGydwdm().substring(0, 1)))
			return queryList("queryZjByGydwdmJtj", xmZjtj);
		else
			return queryList("queryZjByGydwdm", xmZjtj);
	}
	
	@Override
	public List<XmZjtj> queryZjdwbfByGydwdm(XmZjtj xmZjtj) {
		if("1".equals(xmZjtj.getGydwdm().substring(0, 1)))
			return queryList("queryZjdwbfByGydwdmJtj", xmZjtj);
		else
			return queryList("queryZjdwbfByGydwdm", xmZjtj);
	}
	
	@Override
	public XmZjtj gettjTjAll(Xmjbxx xmjbxx) {
		return queryOne("gettjTjAll", xmjbxx);
	}

	@Override
	public boolean plshbf(XmZjtj xmZjtj) {
		return update("plshbf", xmZjtj)>0;
	}

	@Override
	public List<XmZjtj> queryzjtjmb(Xmjbxx xmjbxx) {
		return queryList("queryzjtjmb", xmjbxx);
	}

	@Override
	public boolean importZjtj(List<Map> data) {
		return insertBatch("importZjtj", data)==data.size();
	}

	@Override
	public boolean plsbbfxj(XmZjtj xmZjtj) {
		return update("plsbbfxj", xmZjtj)>0;
	}

	@Override
	public boolean plsbbfsj(XmZjtj xmZjtj) {
		return update("plsbbfsj", xmZjtj)>0;
	}

	@Override
	public boolean qbshbf(Xmjbxx xmjbxx) {
		return update("qbshbf",xmjbxx)>0;
	}

	@Override
	public List<XmZjtj> queryzjtjtbsj(Xmjbxx xmjbxx) {
		return queryList("queryzjtjtbsj", xmjbxx);
	}
	
	@Override
	public boolean delzjtjqb(Xmjbxx xmjbxx) {
		return delete("delzjtjqb",xmjbxx)>0;
	}
	
	@Override
	public boolean qbthsj(Xmjbxx xmjbxx) {
		
		return delete("qbthsj",xmjbxx)>0 | delete("qbthsjzgx",xmjbxx)>0;
	}

	@Override
	public boolean qbthxj(Xmjbxx xmjbxx) {
		return delete("qbthxj",xmjbxx)>0;
	}

	@Override
	public List<Xmjbxx> queryTjXmlist(Xmjbxx xmjbxx) {
		return queryList("queryTjXmlist", xmjbxx);
	}

	@Override
	public int queryTjXmlistCount(Xmjbxx xmjbxx) {
		return queryOne("queryTjXmlistCount", xmjbxx);
	}

	@Override
	public XmZjtj getTjTjAll(Xmjbxx xmjbxx) {
		return queryOne("getTjTjAll", xmjbxx);
	}

	@Override
	public boolean glxm(Xmjbxx xmjbxx) {
		//修改xmjbxx_tj
		int x=update("glxmjh", xmjbxx);
		//修改 xm_zjdw
		int y=update("glxmdw", xmjbxx);
		//修改xm_zjbf
		update("glxmbf", xmjbxx);
		if(x>0&&y>0)
			return true;
		return false;
	}
}
