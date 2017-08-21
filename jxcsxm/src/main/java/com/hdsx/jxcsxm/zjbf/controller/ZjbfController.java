package com.hdsx.jxcsxm.zjbf.controller;

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
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
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
	
	//统计
	public void getbfTjAll(){
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		try {
			JsonUtils.write(zjbfServer.getbfTjAll(xmjbxx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void insertZjbf(){
		ResponseUtils.write(getresponse(), ""+zjbfServer.insertZjbf(xmZjbf));
	}
	
	public void queryzjbflist(){
		if("0".equals(xmZjbf.getSffy())){
			xmZjbf.setPage(1);
			xmZjbf.setRows(500);
		}else{
			xmZjbf.setPage(page);
			xmZjbf.setRows(rows);
		}
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
	
	public void queryXmlistshqx(){
		
		xmZjbf.setGydw(MyUtil.getQueryTJ(xmZjbf.getGydw(), "gydwdm"));
		
		List<XmZjbf> list=zjbfServer.queryXmlistshqx(xmZjbf);
		int count=zjbfServer.queryXmlistshqxCount(xmZjbf);
		EasyUIPage<XmZjbf> e=new EasyUIPage<XmZjbf>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	//添加修改水毁抢修
		public void insertOrUpdateShqx(){
			try {
				String[] gydwdm = xmZjbf.getGydwdm().split(",");
				String[] parent = xmZjbf.getParent().split(",");
				String[] bfyf = xmZjbf.getBfyf().split(",");
				String[] cgs = xmZjbf.getCgs1().split(",");
				String[] rys = xmZjbf.getRys1().split(",");
				String[] ttc = xmZjbf.getTtc1().split(",");
				String[] dfzc = xmZjbf.getDfzc1().split(",");
				String[] ztz = xmZjbf.getZtz1().split(",");
				String[] bd = xmZjbf.getBd().split(",");
				String[] jhxdwh = xmZjbf.getJhxdwh().split(",");
				String[] bz = xmZjbf.getBz().split(",");
				
				List<XmZjbf> save = new ArrayList<XmZjbf>();
				List<XmZjbf> update = new ArrayList<XmZjbf>();
				for (int i = 0; i < gydwdm.length; i++) {
					XmZjbf xm = new XmZjbf();
					xm.setGydwdm(gydwdm[i]);
					xm.setParent(parent[i]);
					xm.setBfyf(bfyf[i]);
					xm.setCgs(Double.parseDouble("".equals(cgs[i]) ? "0" : cgs[i]));
					xm.setRys(Double.parseDouble("".equals(rys[i]) ? "0" : rys[i]));
					xm.setTtc(Double.parseDouble("".equals(ttc[i]) ? "0" : ttc[i]));
					xm.setDfzc(Double.parseDouble("".equals(dfzc[i]) ? "0" : dfzc[i]));
					xm.setZtz(Double.parseDouble("".equals(ztz[i]) ? "0" : ztz[i]));
					xm.setBd(bd[i]);
					xm.setJhxdwh(jhxdwh[i]);
					xm.setXmbm(bfyf[i].substring(0, 4)+gydwdm[i]+jhxdwh[i]);
					xm.setBz(bz[i]);
					if (zjbfServer.queryShqxByOne(xm) == null) {
						save.add(xm);
					} else {
						update.add(xm);
					}
				}
				System.out.println("保存个数：" + save.size());
				System.out.println("修改个数：" + update.size());
				int a = 0;
				if (save.size() > 0) {
					a = zjbfServer.insertShqx(save);
				}
				if (update.size() > 0) {
					a = zjbfServer.updateShqx(update);
				}
				ResponseUtils.write(getresponse(), (a>0)+"");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		//根据单位查询资金
		public void queryZjByGydwdm(){
			try {
				List<XmZjbf> list =zjbfServer.queryZjByGydwdm(xmZjbf);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//批量审核拨付
		public void plshbf(){
			xmZjbf.setXmbm(MyUtil.getQueryTJ(xmZjbf.getXmbm(), "xmbm").replaceAll("and", ""));
			ResponseUtils.write(getresponse(), ""+zjbfServer.plshbf(xmZjbf));
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
