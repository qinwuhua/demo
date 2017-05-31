package com.hdsx.jxcsxm.tjbb.server.impl;




import java.util.List;

import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.tjbb.bean.Excel_list;
import com.hdsx.jxcsxm.tjbb.server.TjbbServer;
import com.hdsx.jxcsxm.xtgl.bean.TreeNode;



@Service
public class TjbbServerImpl extends BaseOperate  implements TjbbServer{

	public TjbbServerImpl() {
		super("tjbb", "jdbc");
	}

	@Override
	public List<TreeNode> createBtTree(Excel_list elist) {
		return queryList("createBtTree", elist);
	}

	@Override
	public List<Excel_list> getZdyBbzd(Excel_list elist) {
		return queryList("getZdyBbzd", elist);
	}

	@Override
	public List<Excel_list> getJhzxqkb(Excel_list elist) {
		return queryList("getJhzxqkb", elist);
	}

	@Override
	public List<Excel_list> getTzhzb(Excel_list elist) {
		return queryList("getTzhzb",elist);
	}

	
}
