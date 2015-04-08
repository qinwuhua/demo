package com.hdsx.jxzhpt.jhgl.controller;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.PlanZjqf;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjqfServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.xtgl.bean.TreeNode;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_zjqfController extends BaseActionSupport{
	private PlanZjqf zjqf;
	private PlanZjqf zjqf2;
	@Resource(name = "plan_zjqfServerImpl")
	private Plan_zjqfServer zjqfServer;
	private TreeNode xzqh;
	private Map<String, Object> result;
	
	public void queryZjqfByXzqh(){
		try {
			JsonUtils.write(zjqfServer.queryZjqfByXzqh(zjqf), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryChildGydw(){
		try {
			List<TreeNode> list =zjqfServer.queryChildGydw(xzqh);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void saveZjqf(){
		try {
			result=new HashMap<String, Object>();
			if(zjqf.getId()!=null && !zjqf.getId().equals("")){
				result.put("result", zjqfServer.editZjqfById(zjqf));
			}else{
				PlanZjqf queryZjqfByXzqh = zjqfServer.queryZjqfByXzqh(zjqf);
				if(queryZjqfByXzqh==null){
					result.put("result", zjqfServer.addZjqf(zjqf));
				}else{
					result.put("result", zjqfServer.editZjqfById(zjqf));
				}
			}
			JsonUtils.write(result, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryChildXzqh(){
		try {
			JsonUtils.write(zjqfServer.queryChildXzqh(xzqh), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateZjqf(){
		System.out.println("资金切分年份："+zjqf2.getNf());
//		try {
//			JsonUtils.write(zjqfServer.updateZjqf(zjqf2), getresponse().getWriter());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}
	//get set
	public PlanZjqf getZjqf() {
		return zjqf;
	}
	public void setZjqf(PlanZjqf zjqf) {
		this.zjqf = zjqf;
	}
	public Plan_zjqfServer getZjqfServer() {
		return zjqfServer;
	}
	public void setZjqfServer(Plan_zjqfServer zjqfServer) {
		this.zjqfServer = zjqfServer;
	}

	public TreeNode getXzqh() {
		return xzqh;
	}
	public void setXzqh(TreeNode xzqh) {
		this.xzqh = xzqh;
	}

	public PlanZjqf getZjqf2() {
		return zjqf2;
	}

	public void setZjqf2(PlanZjqf zjqf2) {
		this.zjqf2 = zjqf2;
	}
}
