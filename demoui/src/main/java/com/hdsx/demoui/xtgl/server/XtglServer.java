package com.hdsx.demoui.xtgl.server;

import java.util.List;

import com.hdsx.demoui.xtgl.bean.TreeNode;
import com.hdsx.demoui.xtgl.bean.Unit;
import com.hdsx.demoui.xtgl.bean.Xmjbxx;

public interface XtglServer {

	List<Xmjbxx> selectxmlist(Xmjbxx xmjbxx)throws Exception;

	List<TreeNode> loadBmbmList(Unit unit)throws Exception;

	
	
}
