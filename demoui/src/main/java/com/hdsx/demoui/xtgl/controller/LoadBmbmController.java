package com.hdsx.demoui.xtgl.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.demoui.utile.JsonUtils;
import com.hdsx.demoui.xtgl.bean.TreeNode;
import com.hdsx.demoui.xtgl.bean.Unit;
import com.hdsx.demoui.xtgl.server.XtglServer;
import com.hdsx.webutil.struts.BaseActionSupport;


@Controller
public class LoadBmbmController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource (name="xtglServerImpl")
	private XtglServer xtglServer;
	private Unit unit;
	private String yhm;
	
	private List<TreeNode> tempList=new ArrayList<TreeNode>();
	private Lock bankLock=new ReentrantLock();
	
	public void getBmbmTreeByName2() throws Exception{
		try {
			yhm=java.net.URLDecoder.decode(yhm,"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		
		List<TreeNode> list=new ArrayList<TreeNode>();
		
		if(tempList.size()==0) tempList =  xtglServer.loadBmbmList(unit);
		for(int i=0;i<tempList.size();i++){
			String ss = tempList.get(i).getText();
			if(yhm.equals(tempList.get(i).getText())) list.add(tempList.get(i));
		}
		
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Unit getUnit() {
		return unit;
	}

	public void setUnit(Unit unit) {
		bankLock.lock();
		this.unit = unit;
	}

	public String getYhm() {
		return yhm;
	}

	public void setYhm(String yhm) {
		this.yhm = yhm;
	}
	
	
}
