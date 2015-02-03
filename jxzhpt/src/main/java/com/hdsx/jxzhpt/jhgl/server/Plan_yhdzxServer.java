package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;
import java.util.Map;

import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_yhdzx;
import com.hdsx.jxzhpt.jhgl.bean.Plan_yhdzx;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_yhdzxServer {
	/**
	 * 总计信息查询
	 * @return
	 */
	Plan_yhdzx querySumYhdzx();
	/**
	 * 养护大中修列表查询
	 * @param jh
	 * @param lx
	 * @return
	 */
	List<Plan_yhdzx> queryYhdzxList(int page,int rows,Plan_yhdzx jh,Plan_lx_yhdzx lx);
	/**
	 * 养护大中修列表总数查询
	 * @param jh
	 * @param lx
	 * @return
	 */
	int queryYhdzxCount(Plan_yhdzx jh,Plan_lx_yhdzx lx);
	/**
	 * 获取养护大中修年份
	 * @return
	 */
	List<TreeNode> queryYhdzxNfs();
	/**
	 * 根据ID删除信息
	 * @param id
	 * @return
	 */
	boolean dropYhdzxById(String id);
	/**
	 * 修改养护大中修计划信息
	 * @param jh
	 * @return
	 */
	boolean editYhdzxById(Plan_yhdzx jh);
	/**
	 * 修改养护大中修的状态信息
	 * @param jh
	 * @return
	 */
	boolean editYhdzxStatus(Plan_yhdzx jh);
	/**
	 * 添加养护大中修的计划信息
	 * @param jh
	 * @return
	 */
	boolean insertYhdzx_jh(List<Map> jh);
	/**
	 * 添加养护大中修的路线信息
	 * @param lx
	 * @return
	 */
	boolean insertYhdzx_lx(List<Map> lx);
	/**
	 * 根据ID查询详细信息
	 * @param id
	 * @return
	 */
	Plan_yhdzx queryYhdzxById(String id);
}