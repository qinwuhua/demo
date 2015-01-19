package com.hdsx.jxzhpt.jhgl.server;

import java.util.List;

import com.hdsx.jxzhpt.jhgl.bean.Plan_gcgj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_lx_gcgj;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;

public interface Plan_gcgjServer {
	
	/**
	 * 分页查询
	 * @param page
	 * @param row
	 * @return
	 */
	List<Plan_gcgj> queryGcgjList(int page,int row,Plan_gcgj plan_gcgj,Plan_lx_gcgj plan_lx_gcgj);
	
	/**
	 * 查询计划总个数
	 * @param plan_gcgj 查询条件
	 * @return
	 */
	int queryGcgjCount(Plan_gcgj plan_gcgj,Plan_lx_gcgj plan_lx_gcgj);
	
	/**
	 * 根据计划ID查询对应的工程改建信息
	 * @param id
	 * @return
	 */
	Plan_gcgj queryGcgjById(String id);

	/**
	 * 获取工程改建的年份列表
	 * @return
	 */
	List<TreeNode> queryGcgjNfs();
	/**
	 * 根据ID删除信息
	 * @param id
	 * @return
	 */
	boolean dropGcgjById(String id);
}