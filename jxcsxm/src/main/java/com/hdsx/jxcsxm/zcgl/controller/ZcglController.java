package com.hdsx.jxcsxm.zcgl.controller;


import java.util.List;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxcsxm.utile.EasyUIPage;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.utile.MyUtil;
import com.hdsx.jxcsxm.utile.ResponseUtils;
import com.hdsx.jxcsxm.zcgl.bean.Zcgl;
import com.hdsx.jxcsxm.zcgl.server.ZcglServer;
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
public class ZcglController extends BaseActionSupport implements ModelDriven<Zcgl>{
	
	//定义变量
	private int page = 1;
	private int rows = 10;
	@Resource(name = "zcglServerImpl")
	private ZcglServer zcglServer;

	private Zcgl zcgl=new Zcgl();
	@Override
	public Zcgl getModel() {
		return zcgl;
	}
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
	public Zcgl getZcgl() {
		return zcgl;
	}
	public void setZcgl(Zcgl zcgl) {
		this.zcgl = zcgl;
	}
	
	public void queryZclist(){
		try {
			
			zcgl.setGydw(MyUtil.getQueryTJ(zcgl.getGydw(), "gydwdm"));
			zcgl.setShzt(MyUtil.getQueryTJ(zcgl.getShzt(), "shztstr||sftx"));
			zcgl.setSsbzt(MyUtil.getQueryTJ(zcgl.getSsbzt(), "ssbztstr||sftx"));
			zcgl.setXsbzt(MyUtil.getQueryTJ(zcgl.getXsbzt(), "xsbztstr||sftx"));
			zcgl.setJsdj(MyUtil.getQueryTJ(zcgl.getJsdj(), "jsdj"));
			List<Zcgl> list=zcglServer.queryZclist(zcgl);
			int count=zcglServer.queryZclistCount(zcgl);
			EasyUIPage<Zcgl> e=new EasyUIPage<Zcgl>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void getsfktj(){
		ResponseUtils.write(getresponse(), ""+zcglServer.getsfktj(zcgl));
	}
	
	public void insertZcgl(){
		ResponseUtils.write(getresponse(), ""+zcglServer.insertZcgl(zcgl));
	}
	
	public void plsbshzc(){
		String tj=MyUtil.getQueryTJ(zcgl.getId(), "id");
		tj=tj.substring(4, tj.length());
		zcgl.setId(tj);
		ResponseUtils.write(getresponse(), ""+zcglServer.plsbshzc(zcgl));
	}
}
