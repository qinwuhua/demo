package com.hdsx.jxcsxm.zcgl.server.impl;




import java.util.List;

import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.zcgl.bean.Zcgl;
import com.hdsx.jxcsxm.zcgl.server.ZcglServer;



@Service
public class ZcglServerImpl extends BaseOperate  implements ZcglServer{

	public ZcglServerImpl() {
		super("zcgl", "jdbc");
	}

	@Override
	public List<Zcgl> queryZclist(Zcgl zcgl) {
		return queryList("queryZclist", zcgl);
	}

	@Override
	public int queryZclistCount(Zcgl zcgl) {
		return queryOne("queryZclistCount", zcgl);
	}

	@Override
	public boolean getsfktj(Zcgl zcgl) {
		int a=queryOne("getsfktj", zcgl);
		return a>0;
	}

	@Override
	public boolean insertZcgl(Zcgl zcgl) {
		boolean bl=false;
		if("1".equals(zcgl.getSfbj())){
			bl=update("updateZcgl", zcgl)>0;
		}else{
			zcgl.setSfbj("1");
			bl=insert("insertZcgl", zcgl)>0;
		}
		
		return bl;
	}

	@Override
	public boolean plsbshzc(Zcgl zcgl) {
		return update("plsbshzc", zcgl)>0;
	}

	
	
}
