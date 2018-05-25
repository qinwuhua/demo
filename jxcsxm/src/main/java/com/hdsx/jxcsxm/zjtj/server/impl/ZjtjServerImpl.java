package com.hdsx.jxcsxm.zjtj.server.impl;



import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.utile.DBTools;
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
	public List<Xmjbxx> queryXmlist_tj(Xmjbxx xmjbxx) {
		return queryList("queryXmlist_tj",xmjbxx);
	}

	@Override
	public int queryXmlist_tjCount(Xmjbxx xmjbxx) {
		return queryOne("queryXmlist_tjCount", xmjbxx);
	}
	
	@Override
	public boolean insertZjtj(XmZjtj xmZjtj) {
		//生成guid
		String xmbm = UUID.randomUUID().toString();
		xmZjtj.setXmbm(xmbm);xmZjtj.setSbthcd("7");xmZjtj.setXsbzt("已上报");xmZjtj.setSsbzt("已上报");xmZjtj.setShzt("已审核");
		//添加项目
		try {
			SqlSession ss = DBTools.getSession();
			int i=ss.insert("insertZjtjXm",xmZjtj);
			int k=ss.insert("insertZjtjXmtj", xmZjtj);
			//添加资金到位数据
			int j=ss.insert("insertZjtjDw", xmZjtj);
			int l=ss.insert("insertZjtjTj", xmZjtj);
			if( i==1&&j==1&&k==1&&l==1) {
				ss.commit();
				ss.close();
				return true;
			}else {
				ss.rollback();
				ss.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		//返回
		return false;
	}

	@Override
	public boolean insertZjtjxz(XmZjtj xmZjtj) {
		xmZjtj.setSbthcd("7");xmZjtj.setXsbzt("已上报");xmZjtj.setSsbzt("已上报");xmZjtj.setShzt("已审核");
		//添加项目
		try {
			SqlSession ss = DBTools.getSession();
			int k=ss.insert("insertZjtjXmtj", xmZjtj);
			//添加资金到位数据
			int j=ss.insert("insertZjtjDw", xmZjtj);
			int l=ss.insert("insertZjtjTj", xmZjtj);
			if( j==1&&k==1&&l==1) {
				ss.commit();
				ss.close();
				return true;
			}else {
				ss.rollback();
				ss.close();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//返回
		return false;
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
		System.out.println(xmZjtj.getXmbm());
		System.out.println(xmZjtj.getTrxmbm());
		try {
			SqlSession ss = DBTools.getSession();
			/**1.删除资金调剂
			 * 2.删除资金到位
			 * 2.修改项目信息
			 * 3.添加项目到位
			 * 4.添加项目调剂
			 * */
			int i=ss.delete("deleteZjtjDw",xmZjtj);
			int j=ss.delete("deleteZjtjTj",xmZjtj);
			xmZjtj.setSbthcd("7");xmZjtj.setXsbzt("已上报");xmZjtj.setSsbzt("已上报");xmZjtj.setShzt("已审核");
			int k=ss.insert("insertZjtjDw", xmZjtj);
			int l=ss.insert("insertZjtjTj", xmZjtj);
			int m=ss.update("updateTjxm",xmZjtj);
			
			if(i>=1&&j>=1&&k==1&&l==1&&m==1) {
				ss.commit();
				ss.close();
				return true;
			}else {
				ss.rollback();
				ss.close();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
	}
	
	@Override
	public boolean updateZjtjType(XmZjtj xmZjtj) {
		int i=delete("deleteZjtjXm", xmZjtj);
		int j=delete("deleteZjtjDw", xmZjtj);
		return i==1&&j==1; 
	}

	@Override
	public boolean deltj(XmZjtj xmZjtj) {
		try {
			SqlSession ss = DBTools.getSession();
			/**1.删除资金调剂
			 * 2.删除资金到位
			 * 3.删除关系
			 * 4.判断是否还有别的项目
			 * 5.有则不用管，无则删除项目
			 * */
			int i=ss.delete("deleteZjtjDw",xmZjtj);
			int j=ss.delete("deleteZjtjTj",xmZjtj);
			int k=ss.delete("deleteZjtjGx",xmZjtj);
			int l=queryOne("selectGx", xmZjtj);
			int m=0;
			if(l>0) {
				m=1;
			}else {
				m=ss.delete("deleteZjtjXm",xmZjtj);
			}
			
			if(i>=1&&j>=1&&k==1&&m==1) {
				ss.commit();
				ss.close();
				return true;
			}else {
				ss.rollback();
				ss.close();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
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
		SqlSession ss=null;
		try {
			ss=DBTools.getSession();
			//修改项目
			int i=ss.update("glxmjh", xmjbxx);
			//修改到位
			int j=ss.update("glxmdw",xmjbxx);
			//修改拨付
			int k=ss.update("glxmbf",xmjbxx);
			if(i==1&&j>0&&k>=0) {
				ss.commit();
				return true;
			}else {
				ss.rollback();
			}
		} catch (Exception e) {
			ss.rollback();
		}finally {
			ss.close();
		}
		return false;
	}

	@Override
	public List<XmZjtj> getXm(String xmname) {
		return queryList("getXm",xmname);
	}

	@Override
	public List<XmZjtj> getxmwh(Xmjbxx xmjbxx) {
		return queryList("getxmwh",xmjbxx);
	}
	
	@Override
	public boolean qxgljh(Xmjbxx xmjbxx) {
		SqlSession ss=null;
		try {
			ss=DBTools.getSession();
			String glqxmbm=queryOne("getglqxmbm", xmjbxx);
			xmjbxx.setGlqxmbm(glqxmbm);
			//修改项目
			int i=ss.update("qxglxmjh", xmjbxx);
			//修改到位
			int j=ss.update("qxglxmdw",xmjbxx);
			//修改拨付
			int k=ss.update("qxglxmbf",xmjbxx);
			if(i==1&&j>0&&k>=0) {
				ss.commit();
				return true;
			}else {
				ss.rollback();
			}
		} catch (Exception e) {
			ss.rollback();
		}finally {
			ss.close();
		}
		return false;
	}
	
}
