package com.hdsx.jxcsxm.zjdw.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxcsxm.utile.EasyUIPage;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.utile.MyUtil;
import com.hdsx.jxcsxm.utile.ResponseUtils;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;
import com.hdsx.jxcsxm.zjdw.server.ZjdwServer;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;



/**
 * 系统管理Controller层
 * @author xunq
 *
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller
public class ZjdwController extends BaseActionSupport implements ModelDriven<XmZjdw>{
	
	//定义变量
	private int page = 1;
	private int rows = 10;
	@Resource(name = "zjdwServerImpl")
	private ZjdwServer zjdwServer;
	private Xmjbxx xmjbxx=new Xmjbxx();
	private XmZjdw xmZjdw=new XmZjdw();
	@Override
	public XmZjdw getModel() {
		return xmZjdw;
	}
	//方法
	public void queryXmlist(){
		
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setPage(page);
		xmjbxx.setRows(rows);
		List<Xmjbxx> list=zjdwServer.queryXmlist(xmjbxx);
		int count=zjdwServer.queryXmlistCount(xmjbxx);
		EasyUIPage<Xmjbxx> e=new EasyUIPage<Xmjbxx>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	public void insertZjdw(){
		ResponseUtils.write(getresponse(), ""+zjdwServer.insertZjdw(xmZjdw));
	}
	
	public void queryzjdwlist(){
		
		xmZjdw.setPage(page);
		xmZjdw.setRows(rows);
		List<XmZjdw> list=zjdwServer.queryzjdwlist(xmZjdw);
		int count=zjdwServer.queryzjdwlistCount(xmZjdw);
		EasyUIPage<XmZjdw> e=new EasyUIPage<XmZjdw>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//根据资金到位id查询详细
	public void queryDwByid(){
		try {
			JsonUtils.write(zjdwServer.queryDwByid(xmZjdw), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//到位资金统计
	public void getdwTj(){
		try {
			JsonUtils.write(zjdwServer.getdwTj(xmZjdw), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//编辑到位资金
	public void updateZjdw(){
		xmZjdw.setId(MyUtil.getQueryTJ(xmZjdw.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjdwServer.updateZjdw(xmZjdw));
	}
	//编辑到位资金状态
	public void updateZjdwType(){
		xmZjdw.setId(MyUtil.getQueryTJ(xmZjdw.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjdwServer.updateZjdwType(xmZjdw));
	}
	//删除资金到位
	public void deldw(){
		xmZjdw.setId(MyUtil.getQueryTJ(xmZjdw.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjdwServer.deldw(xmZjdw));
	}
	
	
	
	
	
	
	
	
	
	//get/set
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getRows() {
		return rows;
	}
	public void setRows(int rows) {
		this.rows = rows;
	}
	public Xmjbxx getXmjbxx() {
		return xmjbxx;
	}
	public void setXmjbxx(Xmjbxx xmjbxx) {
		this.xmjbxx = xmjbxx;
	}

	public XmZjdw getXmZjdw() {
		return xmZjdw;
	}

	public void setXmZjdw(XmZjdw xmZjdw) {
		this.xmZjdw = xmZjdw;
	}
	
	
	
	
	
	
}
