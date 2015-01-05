package com.hdsx.jxzhpt.lwxm.xmjck.controller;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Abgc;
import com.hdsx.jxzhpt.lwxm.xmjck.server.AbgcServer;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.webutil.struts.BaseActionSupport;
/**
 * 项目基础库——安保工程Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class AbgcController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource(name="abgcServerImpl")
	private AbgcServer abgcServer;
	private Abgc abgc;
	
	public void insertAbgc(){
		boolean b = abgcServer.insertAbgc(abgc);
		if(b){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}

	public Abgc getAbgc() {
		return abgc;
	}

	public void setAbgc(Abgc abgc) {
		this.abgc = abgc;
	}
	
	
}
