package com.hdsx.demoui.xtgl.server.impl;



import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.demoui.utile.DBTools;
import com.hdsx.demoui.xtgl.bean.TreeNode;
import com.hdsx.demoui.xtgl.bean.Unit;
import com.hdsx.demoui.xtgl.bean.Xmjbxx;
import com.hdsx.demoui.xtgl.server.XtglServer;

@Service
public class XtglServerImpl extends BaseOperate  implements XtglServer{

	public XtglServerImpl() {
		super("xtgl", "jdbc");
	}
	@Override
	public List<Xmjbxx> selectxmlist(Xmjbxx xmjbxx) throws Exception {
		SqlSession ss = DBTools.getSession();
		List<Xmjbxx> l=null;
		try {
			l=ss.selectList("selectxmlist", xmjbxx);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		
		return l;
	}

	@Override
	public List<TreeNode> loadBmbmList(Unit unit) throws Exception {
		SqlSession ss = DBTools.getSession();
		List<TreeNode> l=null;
		try {
			l=ss.selectList("loadBmbmList", unit);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		
		return l;
	}
	

}
