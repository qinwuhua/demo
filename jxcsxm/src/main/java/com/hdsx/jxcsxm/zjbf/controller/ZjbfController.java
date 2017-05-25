package com.hdsx.jxcsxm.zjbf.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxcsxm.utile.EasyUIPage;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.utile.MyUtil;
import com.hdsx.jxcsxm.utile.ResponseUtils;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjbf.bean.XmZjbf;
import com.hdsx.jxcsxm.zjbf.server.ZjbfServer;
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
public class ZjbfController extends BaseActionSupport implements ModelDriven<XmZjbf>{
	
	//定义变量
	private int page = 1;
	private int rows = 10;
	@Resource(name = "zjbfServerImpl")
	private ZjbfServer zjbfServer;
	private Xmjbxx xmjbxx=new Xmjbxx();
	private XmZjbf xmZjbf=new XmZjbf();
	@Override
	public XmZjbf getModel() {
		return xmZjbf;
	}
	//方法
	public void queryXmlist(){
		
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		if(xmZjbf.getPage()>0){
			xmjbxx.setPage(xmZjbf.getPage());
			xmjbxx.setRows(xmZjbf.getRows());
		}else{
			xmjbxx.setPage(page);
			xmjbxx.setRows(rows);
		}
		
		List<Xmjbxx> list=zjbfServer.queryXmlist(xmjbxx);
		int count=zjbfServer.queryXmlistCount(xmjbxx);
		EasyUIPage<Xmjbxx> e=new EasyUIPage<Xmjbxx>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	public void insertZjbf(){
		ResponseUtils.write(getresponse(), ""+zjbfServer.insertZjbf(xmZjbf));
	}
	
	public void queryzjbflist(){
		
		xmZjbf.setPage(page);
		xmZjbf.setRows(rows);
		List<XmZjbf> list=zjbfServer.queryzjbflist(xmZjbf);
		int count=zjbfServer.queryzjbflistCount(xmZjbf);
		EasyUIPage<XmZjbf> e=new EasyUIPage<XmZjbf>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//根据资金到位id查询详细
	public void queryBfByid(){
		try {
			JsonUtils.write(zjbfServer.queryBfByid(xmZjbf), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//到位资金统计
	public void getbfTj(){
		try {
			JsonUtils.write(zjbfServer.getbfTj(xmZjbf), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//编辑到位资金
	public void updateZjbf(){
		xmZjbf.setId(MyUtil.getQueryTJ(xmZjbf.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjbfServer.updateZjbf(xmZjbf));
	}
	//编辑到位资金状态
	public void updateZjbfType(){
		xmZjbf.setId(MyUtil.getQueryTJ(xmZjbf.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjbfServer.updateZjbfType(xmZjbf));
	}
	//删除资金到位
	public void delbf(){
		xmZjbf.setId(MyUtil.getQueryTJ(xmZjbf.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjbfServer.delbf(xmZjbf));
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

	public XmZjbf getXmZjbf() {
		return xmZjbf;
	}

	public void setXmZjbf(XmZjbf xmZjbf) {
		this.xmZjbf = xmZjbf;
	}
	
	
	
	
	
	
}
