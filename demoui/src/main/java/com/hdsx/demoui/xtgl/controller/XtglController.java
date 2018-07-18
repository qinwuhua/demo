package com.hdsx.demoui.xtgl.controller;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.demoui.xtgl.bean.Xmjbxx;
import com.hdsx.demoui.xtgl.server.XtglServer;
import com.hdsx.webutil.struts.BaseActionSupport;

/**
 * 系统管理Controller层
 * @author qinwh
 *
 */
@Scope("prototype")
@Controller
public class XtglController extends BaseActionSupport{
	
	private static final long serialVersionUID = -1512493918772500846L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "xtglServerImpl")
	private XtglServer xtglServer;
	
	public void hello() {
		System.out.println(new Xmjbxx());
	}
	
}
