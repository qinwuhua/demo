package com.hdsx.jxcsxm.jhcx.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxcsxm.jhcx.server.JhcxServer;
import com.hdsx.jxcsxm.utile.EasyUIPage;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.utile.MyUtil;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;

import com.hdsx.webutil.struts.BaseActionSupport;



/**
 * 系统管理Controller层
 * @author xunq
 *
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller
public class JhcxController extends BaseActionSupport{
	
	//定义变量
	private int page = 1;
	private int rows = 10;
	@Resource(name = "jhcxServerImpl")
	private JhcxServer jhcxServer;
	private Xmjbxx xmjbxx=new Xmjbxx();
	
	
	//方法
	public void queryXmlist(){
		
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setPage(page);
		xmjbxx.setRows(rows);
		List<Xmjbxx> list=jhcxServer.queryXmlist(xmjbxx);
		int count=jhcxServer.queryXmlistCount(xmjbxx);
		EasyUIPage<Xmjbxx> e=new EasyUIPage<Xmjbxx>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	//统计
	public void getTjAll(){
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		try {
			JsonUtils.write(jhcxServer.getTjAll(xmjbxx), getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	//查询项目基本信息
	public void getxmInfo(){
		try {
			JsonUtils.write(jhcxServer.getxmInfo(xmjbxx), getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	//查询项目基本信息
		public void gettjxmInfo(){
			try {
				JsonUtils.write(jhcxServer.gettjxmInfo(xmjbxx), getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	
	//
	public void queryZjByGydwdm(){
		try {
			List<Xmjbxx> list =jhcxServer.queryZjByGydwdm(xmjbxx);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	
	
	
	
	
}
