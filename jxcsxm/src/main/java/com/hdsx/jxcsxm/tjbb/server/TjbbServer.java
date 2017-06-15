package com.hdsx.jxcsxm.tjbb.server;

import java.util.List;

import com.hdsx.jxcsxm.tjbb.bean.Excel_list;
import com.hdsx.jxcsxm.xtgl.bean.TreeNode;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;



public interface TjbbServer {

	List<TreeNode> createBtTree(Excel_list elist);

	List<Excel_list> getZdyBbzd(Excel_list elist);

	List<Excel_list> getJhzxqkb(Excel_list elist);

	List<Excel_list> getTzhzb(Excel_list elist);

	List<Xmjbxx> queryXmlist(Xmjbxx xmjbxx);

	int queryXmlistCount(Xmjbxx xmjbxx);

	List<Excel_list> getTzmxbbt(Excel_list elist);

	

}
