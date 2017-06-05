package com.hdsx.jxcsxm.zjdw.controller;

import java.util.ArrayList;
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
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		
		if(xmZjdw.getPage()>0){
			xmjbxx.setPage(xmZjdw.getPage());
			xmjbxx.setRows(xmZjdw.getRows());
		}else{
			xmjbxx.setPage(page);
			xmjbxx.setRows(rows);
		}
		
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
	//getdwTjAll  统计
	public void getdwTjAll(){
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		try {
			JsonUtils.write(zjdwServer.getdwTjAll(xmjbxx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void queryXmlistshqx(){
		
		xmZjdw.setGydw(MyUtil.getQueryTJ(xmZjdw.getGydw(), "gydwdm"));
		
		List<XmZjdw> list=zjdwServer.queryXmlistshqx(xmZjdw);
		int count=zjdwServer.queryXmlistshqxCount(xmZjdw);
		EasyUIPage<XmZjdw> e=new EasyUIPage<XmZjdw>();
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
	
	public void queryzjxdlist(){
		xmZjdw.setPage(page);
		xmZjdw.setRows(rows);
		List<XmZjdw> list=zjdwServer.queryzjxdlist(xmZjdw);
		int count=zjdwServer.queryzjxdlistCount(xmZjdw);
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
	//查询管养单位
	public void queryChildGydw(){
		try {
			List<XmZjdw> list =zjdwServer.queryChildGydw(xmZjdw);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//添加修改水毁抢修
	public void insertOrUpdateShqx(){
		try {
			String[] gydwdm = xmZjdw.getGydwdm().split(",");
			String[] parent = xmZjdw.getParent().split(",");
			String[] dwyf = xmZjdw.getDwyf().split(",");
			String[] cgs = xmZjdw.getCgs1().split(",");
			String[] rys = xmZjdw.getRys1().split(",");
			String[] ttc = xmZjdw.getTtc1().split(",");
			String[] dfzc = xmZjdw.getDfzc1().split(",");
			String[] ztz = xmZjdw.getZtz1().split(",");
			String[] bd = xmZjdw.getBd().split(",");
			String[] jhxdwh = xmZjdw.getJhxdwh().split(",");
			
			List<XmZjdw> save = new ArrayList<XmZjdw>();
			List<XmZjdw> update = new ArrayList<XmZjdw>();
			for (int i = 0; i < gydwdm.length; i++) {
				XmZjdw xm = new XmZjdw();
				xm.setGydwdm(gydwdm[i]);
				xm.setParent(parent[i]);
				xm.setDwyf(dwyf[i]);
				xm.setCgs(Double.parseDouble("".equals(cgs[i]) ? "0" : cgs[i]));
				xm.setRys(Double.parseDouble("".equals(rys[i]) ? "0" : rys[i]));
				xm.setTtc(Double.parseDouble("".equals(ttc[i]) ? "0" : ttc[i]));
				xm.setDfzc(Double.parseDouble("".equals(dfzc[i]) ? "0" : dfzc[i]));
				xm.setZtz(Double.parseDouble("".equals(ztz[i]) ? "0" : ztz[i]));
				xm.setBd(bd[i]);
				xm.setJhxdwh(jhxdwh[i]);
				if (zjdwServer.queryShqxByOne(xm) == null) {
					save.add(xm);
				} else {
					update.add(xm);
				}
			}
			System.out.println("保存个数：" + save.size());
			System.out.println("修改个数：" + update.size());
			int a = 0;
			if (save.size() > 0) {
				a = zjdwServer.insertShqx(save);
			}
			if (update.size() > 0) {
				a = zjdwServer.updateShqx(update);
			}
			ResponseUtils.write(getresponse(), (a>0)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	//根据单位查询资金
	public void queryZjByGydwdm(){
		try {
			List<XmZjdw> list =zjdwServer.queryZjByGydwdm(xmZjdw);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//批量审核
	public void plshdw(){
		xmZjdw.setXmbm(MyUtil.getQueryTJ(xmZjdw.getXmbm(), "xmbm").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjdwServer.plshdw(xmZjdw));
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
