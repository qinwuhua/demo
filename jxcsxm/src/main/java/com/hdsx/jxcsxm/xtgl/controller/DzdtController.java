package com.hdsx.jxcsxm.xtgl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxcsxm.utile.EasyUIPage;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.xtgl.bean.Dzdt;
import com.hdsx.jxcsxm.xtgl.bean.Param;
import com.hdsx.jxcsxm.xtgl.bean.ProgBean;
import com.hdsx.jxcsxm.xtgl.server.DzdtServer;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class DzdtController extends BaseActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8695511293141707190L;
	@Resource(name = "dzdtServerImpl")
	private DzdtServer dzdtServer;
	private Dzdt dzdt;
	private Param param;
	private ProgBean pb;


	/*
	 * 右侧项目类型统计表
	 */
	public void xmlxCountTj(){
		String[] arr=param.getId().split(",");
		param.setId(null);
		List<Param> rl=dzdtServer.xmlxCountTj(param);//未加权
		List<Param> rl_n=new ArrayList<Param>();//权限列表
		
		for(int i=0;i<rl.size();i++){
			for(int j=0;j<arr.length;j++){
				if(arr[j].equals(rl.get(i).getId())){
					rl.get(i).setBz("1");
					rl_n.add(rl.get(i));
				}
			}
		}
		//循环设置合并单元格
		Param temp=rl_n.get(0);
		int flag=1;
		int index=0;
		if(rl_n.size()>1)
			for(int i=1;i<rl_n.size();i++){
				if(temp.getParent().equals(rl_n.get(i).getParent())){
					flag++;
					if(i==rl_n.size()-1) rl_n.get(index).setDesr(flag+"");
				}else{
					rl_n.get(index).setDesr(flag+"");
					index=i;
					flag=1;
					temp=rl_n.get(i);
					if(i==rl_n.size()-1) rl_n.get(index).setDesr(flag+"");
				}
			}
		try {
			JsonUtils.write(rl_n, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	/*
	 * 路线弹出框
	 * */
	public void selectExistLxProgramList(){
		try {
			if(pb.getRoadcode().length()>6){
				pb.setRoadcode(pb.getRoadcode().substring(0,pb.getRoadcode().length()-6));
			}
			List<ProgBean> list=dzdtServer.selectExistLxProgramList(pb);
			//int count=dzdtServer.selectExistLxProgramListCount(param);
			EasyUIPage<ProgBean> ep = new EasyUIPage<ProgBean>();
			//ep.setTotal(count);
			ep.setRows(list);
			JsonUtils.write(ep, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	/*
	 * 桥梁弹出框
	 * */
	public void selectExistQlProgramList(){
		List<Param> list=dzdtServer.selectExistQlProgramList(param);
		EasyUIPage<Param> ep = new EasyUIPage<Param>();
		ep.setRows(list);
		try {
			JsonUtils.write(ep, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public Dzdt getDzdt() {
		return dzdt;
	}

	public void setDzdt(Dzdt dzdt) {
		this.dzdt = dzdt;
	}

	public Param getParam() {
		return param;
	}

	public void setParam(Param param) {
		this.param = param;
	}

	public ProgBean getPb() {
		return pb;
	}

	public void setPb(ProgBean pb) {
		this.pb = pb;
	}
	
	
}
