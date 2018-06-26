package com.hdsx.jxcsxm.zjtj.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxcsxm.utile.EasyUIPage;
import com.hdsx.jxcsxm.utile.ExcelReader;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.utile.MyUtil;
import com.hdsx.jxcsxm.utile.ResponseUtils;
import com.hdsx.jxcsxm.utile.excel.ExcelCoordinate;
import com.hdsx.jxcsxm.utile.excel.ExcelEntity;
import com.hdsx.jxcsxm.utile.excel.ExcelExportUtil;
import com.hdsx.jxcsxm.utile.excel.ExcelTitleCell;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjtj.bean.XmZjtj;
import com.hdsx.jxcsxm.zjtj.server.ZjtjServer;
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;



/**
 * 资金调剂Controller层
 * @author qwh
 *
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller
public class ZjtjController extends BaseActionSupport implements ModelDriven<XmZjtj>{
	
	//定义变量
	private int page = 1;
	private int rows = 10;
	@Resource(name = "zjtjServerImpl")
	private ZjtjServer zjtjServer;
	private Xmjbxx xmjbxx=new Xmjbxx();
	private XmZjtj xmZjtj=new XmZjtj();
	private String xmname;
	private File fileupload;
	private String fileuploadFileName;
	@Override
	public XmZjtj getModel() {
		return xmZjtj;
	}
	
	public String getXmname() {
		return xmname;
	}

	public void setXmname(String xmname) {
		this.xmname = xmname;
	}

	//方法
		public void queryXmlist_tj(){
			
			xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
			xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
			
			xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
			xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
			xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "jsxz||gcfl"));
			xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
			xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
			xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
			xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
			xmjbxx.setSfkytj(MyUtil.getQueryTJ(xmjbxx.getSfkytj(), "fun_sfkytj(t.xmbm)"));
			xmjbxx.setSfygtj(MyUtil.getQueryTJ(xmjbxx.getSfygtj(), "fun_sfygtj(t.xmbm)"));
			if(xmZjtj.getPage()>0){
				xmjbxx.setPage(xmZjtj.getPage());
				xmjbxx.setRows(xmZjtj.getRows());
			}else{
				xmjbxx.setPage(page);
				xmjbxx.setRows(rows);
			}
			
			List<Xmjbxx> list=zjtjServer.queryXmlist_tj(xmjbxx);
			int count=zjtjServer.queryXmlist_tjCount(xmjbxx);
			EasyUIPage<Xmjbxx> e=new EasyUIPage<Xmjbxx>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}
	
	//方法
	public void queryXmlist(){
		
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "jsxz||gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfkytj(MyUtil.getQueryTJ(xmjbxx.getSfkytj(), "fun_sfkytj(t.xmbm)"));
		xmjbxx.setSfygtj(MyUtil.getQueryTJ(xmjbxx.getSfygtj(), "fun_sfygtj(t.xmbm)"));
		if(xmZjtj.getPage()>0){
			xmjbxx.setPage(xmZjtj.getPage());
			xmjbxx.setRows(xmZjtj.getRows());
		}else{
			xmjbxx.setPage(page);
			xmjbxx.setRows(rows);
		}
		
		List<Xmjbxx> list=zjtjServer.queryXmlist(xmjbxx);
		int count=zjtjServer.queryXmlistCount(xmjbxx);
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
	public void gettjTjAll(){
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "jsxz||gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfkytj(MyUtil.getQueryTJ(xmjbxx.getSfkytj(), "fun_sfkytj(t.xmbm)"));
		xmjbxx.setSfygtj(MyUtil.getQueryTJ(xmjbxx.getSfygtj(), "fun_sfygtj(t.xmbm)"));
		try {
			JsonUtils.write(zjtjServer.gettjTjAll(xmjbxx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void insertZjtj(){
		if("改建".equals(xmZjtj.getXmlx())||"路面改造".equals(xmZjtj.getXmlx())||"新建".equals(xmZjtj.getXmlx())) {
			xmZjtj.setJsxz("国省道改造");xmZjtj.setGcfl(xmZjtj.getXmlx());
		}else if("危桥改造".equals(xmZjtj.getXmlx())||"安防工程".equals(xmZjtj.getXmlx())||"灾害防治".equals(xmZjtj.getXmlx())) {
			xmZjtj.setJsxz("路网结构改造");xmZjtj.setGcfl(xmZjtj.getXmlx());
		}else {
			xmZjtj.setJsxz(xmZjtj.getXmlx());xmZjtj.setGcfl(xmZjtj.getXmlx());
		}
		
		ResponseUtils.write(getresponse(), ""+zjtjServer.insertZjtj(xmZjtj));
	}
	public void insertZjtjxz(){
		ResponseUtils.write(getresponse(), ""+zjtjServer.insertZjtjxz(xmZjtj));
	}
	
	
	public void queryzjtjlist(){
		//System.out.println(page+"    "+xmZjtj.getPage());
		if("0".equals(xmZjtj.getSffy())){
			xmZjtj.setPage(1);
			xmZjtj.setRows(500);
		}
		
		List<XmZjtj> list=zjtjServer.queryzjtjlist(xmZjtj);
		int count=zjtjServer.queryzjtjlistCount(xmZjtj);
		EasyUIPage<XmZjtj> e=new EasyUIPage<XmZjtj>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	//根据资金到位id查询详细
	public void queryTjByid(){
		try {
			JsonUtils.write(zjtjServer.queryTjByid(xmZjtj), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//到位资金统计
	public void gettjTj(){
		try {
			JsonUtils.write(zjtjServer.gettjTj(xmZjtj), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//编辑到位资金
	public void updateZjtj(){
		if("改建".equals(xmZjtj.getXmlx())||"路面改造".equals(xmZjtj.getXmlx())||"新建".equals(xmZjtj.getXmlx())) {
			xmZjtj.setJsxz("国省道改造");xmZjtj.setGcfl(xmZjtj.getXmlx());
		}else if("危桥改造".equals(xmZjtj.getXmlx())||"安防工程".equals(xmZjtj.getXmlx())||"灾害防治".equals(xmZjtj.getXmlx())) {
			xmZjtj.setJsxz("路网结构改造");xmZjtj.setGcfl(xmZjtj.getXmlx());
		}else {
			xmZjtj.setJsxz(xmZjtj.getXmlx());xmZjtj.setGcfl(xmZjtj.getXmlx());
		}
		ResponseUtils.write(getresponse(), ""+zjtjServer.updateZjtj(xmZjtj));
	}
	//编辑到位资金状态
	public void updateZjtjType(){
		xmZjtj.setId(MyUtil.getQueryTJ(xmZjtj.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjtjServer.updateZjtjType(xmZjtj));
	}
	//删除资金到位
	public void deltj(){
		ResponseUtils.write(getresponse(), ""+zjtjServer.deltj(xmZjtj));
	}
	
	public void queryXmlistshqx(){
		
		xmZjtj.setGydw(MyUtil.getQueryTJ(xmZjtj.getGydw(), "gydwdm"));
		
		List<XmZjtj> list=zjtjServer.queryXmlistshqx(xmZjtj);
		int count=zjtjServer.queryXmlistshqxCount(xmZjtj);
		EasyUIPage<XmZjtj> e=new EasyUIPage<XmZjtj>();
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
				String[] gydwdm = xmZjtj.getGydwdm().split(",");
				String[] parent = xmZjtj.getParent().split(",");
				String[] bfyf = xmZjtj.getBfyf().split(",");
				String[] cgs = xmZjtj.getCgs1().split(",");
				String[] rys = xmZjtj.getRys1().split(",");
				String[] ttc = xmZjtj.getTtc1().split(",");
				String[] dfzc = xmZjtj.getDfzc1().split(",");
				String[] ztz = xmZjtj.getZtz1().split(",");
				String[] bd = xmZjtj.getBd().split(",");
				String[] jhxdwh = xmZjtj.getJhxdwh().split(",");
				String[] bz = xmZjtj.getBz().split(",");
				
				String[] nf = xmZjtj.getNf().split(",");
				String[] tbr = xmZjtj.getTbr().split(",");
				String[] tbsj = xmZjtj.getTbsj().split(",");
				
				
				List<XmZjtj> save = new ArrayList<XmZjtj>();
				List<XmZjtj> update = new ArrayList<XmZjtj>();
				for (int i = 0; i < gydwdm.length; i++) {
					XmZjtj xm = new XmZjtj();
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
					xm.setXmbm(nf[i]+gydwdm[i]+jhxdwh[i]);
					xm.setBz(bz[i]);
					xm.setNf(nf[i]);
					xm.setTbr(tbr[i]);
					xm.setTbsj(tbsj[i]);
					
					if (zjtjServer.queryShqxByOne(xm) == null) {
						save.add(xm);
					} else {
						update.add(xm);
					}
				}
				System.out.println("保存个数：" + save.size());
				System.out.println("修改个数：" + update.size());
				int a = 0;
				if (save.size() > 0) {
					a = zjtjServer.insertShqx(save);
				}
				if (update.size() > 0) {
					a = zjtjServer.updateShqx(update);
				}
				ResponseUtils.write(getresponse(), (a>0)+"");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		//根据单位查询资金
		public void queryZjByGydwdm(){
			try {
				List<XmZjtj> list =zjtjServer.queryZjByGydwdm(xmZjtj);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//根据单位查询资金
		public void queryZjdwbfByGydwdm(){
			try {
				List<XmZjtj> list =zjtjServer.queryZjdwbfByGydwdm(xmZjtj);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//批量审核拨付
		public void plshbf(){
			xmZjtj.setXmbm(MyUtil.getQueryTJ(xmZjtj.getXmbm(), "xmbm").replaceAll("and", ""));
			ResponseUtils.write(getresponse(), ""+zjtjServer.plshbf(xmZjtj));
		}
	
		//导出模版
		public void dcmb() {
			try {
				//System.out.println("进入方法");
				//设置表头
				ExcelTitleCell[] title = null;
				title = new ExcelTitleCell[20];
				title[0] = new ExcelTitleCell("项目编码", false,
						new ExcelCoordinate(0, (short) 0), null, 20,false);
				title[1] = new ExcelTitleCell("项目年份", false,
						new ExcelCoordinate(0, (short) 1), null, 10,false);
				title[2] = new ExcelTitleCell("项目名称", false,
						new ExcelCoordinate(0, (short) 2), null, 20,false);
				title[3] = new ExcelTitleCell("管养单位", false,
						new ExcelCoordinate(0, (short) 3), null, 20,false);
				title[4] = new ExcelTitleCell("行政区划", false,
						new ExcelCoordinate(0, (short) 4), null, 20,false);
				title[5] = new ExcelTitleCell("计划总投资", false,
						new ExcelCoordinate(0, (short) 5), null, 15,false);
				title[6] = new ExcelTitleCell("到位车购税", false,
						new ExcelCoordinate(0, (short) 6), null, 15,false);
				title[7] = new ExcelTitleCell("到位燃油税", false,
						new ExcelCoordinate(0, (short) 7), null, 15,false);
				title[8] = new ExcelTitleCell("到位地方自筹", false,
						new ExcelCoordinate(0, (short) 8), null, 15,false);
				title[9] = new ExcelTitleCell("到位厅统筹", false,
						new ExcelCoordinate(0, (short) 9), null, 15,false);
				title[10] = new ExcelTitleCell("计划下达文号", false,
						new ExcelCoordinate(0, (short) 10), null, 20,false);
				title[11] = new ExcelTitleCell("标段", false,
						new ExcelCoordinate(0, (short) 11), null, 15,false);
				title[12] = new ExcelTitleCell("拨付车购税", false,
						new ExcelCoordinate(0, (short) 12), null, 15,false);
				title[13] = new ExcelTitleCell("拨付燃油税", false,
						new ExcelCoordinate(0, (short) 13), null, 15,false);
				title[14] = new ExcelTitleCell("拨付地方自筹", false,
						new ExcelCoordinate(0, (short) 14), null, 15,false);
				title[15] = new ExcelTitleCell("拨付厅统筹", false,
						new ExcelCoordinate(0, (short) 15), null, 15,false);
				title[16] = new ExcelTitleCell("拨付月份", false,
						new ExcelCoordinate(0, (short) 16), null, 15,false);
				title[17] = new ExcelTitleCell("填报人", false,
						new ExcelCoordinate(0, (short) 17), null, 20,false);
				title[18] = new ExcelTitleCell("填报时间", false,
						new ExcelCoordinate(0, (short) 18), null, 20,false);
				title[19] = new ExcelTitleCell("备注", false,
						new ExcelCoordinate(0, (short) 19), null, 50,false);
				//设置列与字段对应
				Map<String, String> attribute = new HashMap<String, String>();
				attribute.put("0", "xmbm");//项目编码
				attribute.put("1", "xmnf");//项目年份
				attribute.put("2", "xmmc");//项目名称
				attribute.put("3", "gydw");//管养单位
				attribute.put("4", "xzqh");//行政区划
				attribute.put("5", "jhztz");//计划总投资
				attribute.put("6", "dwcgs");//计划下达车购税
				attribute.put("7", "dwrys");//计划下达燃油税
				attribute.put("8", "dwdfzc");//计划下达地方自筹
				attribute.put("9", "dwttc");//计划下达厅统筹
				attribute.put("10", "jhxdwh");//计划下达文号
				attribute.put("11", "bd");//计划下达文号
				attribute.put("12", "cgs");//车购税
				attribute.put("13", "rys");//燃油税
				attribute.put("14", "dfzc");//地方自筹
				attribute.put("15", "ttc");//厅统筹
				attribute.put("16", "bfyf");//到位月份
				attribute.put("17", "tbr");//填报人
				attribute.put("18", "tbsj");//填报时间
				attribute.put("19", "bz");//备注
				List<Object> excelData = new ArrayList<Object>();
				String titleName = "通自然村资金拨付模版";
				String fileName = "通自然村资金拨付模版";
				xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
				xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
				
				xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
				xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
				xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
				xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
				xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
				xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
				xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
				List<XmZjtj> ql = zjtjServer.queryzjtjmb(xmjbxx);
				excelData.addAll(ql);
				ExcelEntity excel = new ExcelEntity(titleName, title, attribute,excelData);
				ExcelExportUtil.excelWritelock(excel, fileName, getresponse());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//批量导入拨付
		
		public void importZjtj() {
			String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
			HttpServletResponse response = getresponse();
			try{
				if(!"xls".equals(fileType)){
					response.getWriter().print(fileuploadFileName+"不是系统导出的excel模版文件");
					return ;
				}
				response.setCharacterEncoding("utf-8"); 
				FileInputStream fs = new FileInputStream(this.fileupload);
				List<Map>[] dataMapArray;
				try{
					dataMapArray = ExcelReader.readExcelContent(0,20,fs,Object.class);
				}catch(Exception e){
					response.getWriter().print(fileuploadFileName+"数据有误");
					return;
				}
				List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
				
				if(data.size()>=1) {
					if(data.get(0).get("0").equals("项目编码")&&data.get(0).get("10").equals("计划下达文号")&&data.get(0).get("11").equals("标段")&&data.get(0).get("12").equals("拨付车购税")&&data.get(0).get("13").equals("拨付燃油税")&&data.get(0).get("14").equals("拨付地方自筹")&&data.get(0).get("15").equals("拨付厅统筹")&&data.get(0).get("16").equals("拨付月份")&&data.get(0).get("17").equals("填报人")&&data.get(0).get("18").equals("填报时间")&&data.get(0).get("19").equals("备注"))
					data.remove(0);
					else {
						response.getWriter().print(fileuploadFileName+"数据有误");
						return;
					}
				}else {
					response.getWriter().print(fileuploadFileName+"数据有误");
					return;
				}
				for (Map map : data) {
					map.put("SBTHCD", xmZjtj.getSbthcd());
				}
				//将数据插入到数据库
				boolean b=zjtjServer.importZjtj(data);
				if(b)
					response.getWriter().print(fileuploadFileName+"导入成功");
				else 
					response.getWriter().print(fileuploadFileName+"导入失败");
			}catch(Exception e){
				e.printStackTrace();
			}
			
			
		}
		
		//批量上报县级
		public void plsbbfxj() {
			xmZjtj.setXmbm(MyUtil.getQueryTJ(xmZjtj.getId(), "xmbm"));
			ResponseUtils.write(getresponse(), ""+zjtjServer.plsbbfxj(xmZjtj));
			
		}
		//批量上报市级
		public void plsbbfsj() {
			xmZjtj.setXmbm(MyUtil.getQueryTJ(xmZjtj.getId(), "xmbm"));
			ResponseUtils.write(getresponse(), ""+zjtjServer.plsbbfsj(xmZjtj));
			
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

	public XmZjtj getXmZjtj() {
		return xmZjtj;
	}

	public void setXmZjtj(XmZjtj xmZjtj) {
		this.xmZjtj = xmZjtj;
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	
	
	
	//自然村全部审核
	public void qbshbf() {
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfqbbf(MyUtil.getQueryTJ(xmjbxx.getSfqbbf(), "sfqbbf"));
		
		ResponseUtils.write(getresponse(), ""+zjtjServer.qbshbf(xmjbxx));
		
	}
	
	
	public void queryzjtjtbsj(){
		try {
			xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
			xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
			JsonUtils.write(zjtjServer.queryzjtjtbsj(xmjbxx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//全部删除的方法
	public void delzjtjqb() {
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
		xmjbxx.setTbsj(MyUtil.getQueryTJ(xmjbxx.getTbsj(), "tbsj"));
		ResponseUtils.write(getresponse(), ""+zjtjServer.delzjtjqb(xmjbxx));
	}
	
	//自然村全部退回
		public void qbthsj() {
			xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
			xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
			xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
			xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
			xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
			xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
			xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
			xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
			xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
			xmjbxx.setSfqbbf(MyUtil.getQueryTJ(xmjbxx.getSfqbbf(), "sfqbbf"));
			xmjbxx.setZgx(MyUtil.getQueryTJ(xmjbxx.getZgx(), "gydwdm"));
			xmjbxx.setZgx1(MyUtil.getQueryTJNO(xmjbxx.getZgx(), "gydwdm"));
			
			ResponseUtils.write(getresponse(), ""+zjtjServer.qbthsj(xmjbxx));
			
		}
		//自然村全部退回县级
		public void qbthxj() {
			xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
			xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
			xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
			xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
			xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
			xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
			xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
			xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
			xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
			xmjbxx.setSfqbbf(MyUtil.getQueryTJ(xmjbxx.getSfqbbf(), "sfqbbf"));
			
			ResponseUtils.write(getresponse(), ""+zjtjServer.qbthxj(xmjbxx));
			
		}
	
		//方法
		public void queryTjXmlist(){
			
			xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
			xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
			xmjbxx.setSfppjh(MyUtil.getQueryTJ(xmjbxx.getSfppjh(), "sfppjh"));
			xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
			xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
			xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
			xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "t.gydwdm"));
			if(xmZjtj.getPage()>0){
				xmjbxx.setPage(xmZjtj.getPage());
				xmjbxx.setRows(xmZjtj.getRows());
			}else{
				xmjbxx.setPage(page);
				xmjbxx.setRows(rows);
			}
			
			List<Xmjbxx> list=zjtjServer.queryTjXmlist(xmjbxx);
			int count=zjtjServer.queryTjXmlistCount(xmjbxx);
			EasyUIPage<Xmjbxx> e=new EasyUIPage<Xmjbxx>();
			e.setRows(list);
			e.setTotal(count);
			try {
				JsonUtils.write(e, getresponse().getWriter());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
			
		}
		
		public void getTjTjAll() {
			xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
			xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
			xmjbxx.setSfppjh(MyUtil.getQueryTJ(xmjbxx.getSfppjh(), "sfppjh"));
			xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
			xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
			xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
			xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "t.gydwdm"));
			try {
				JsonUtils.write(zjtjServer.getTjTjAll(xmjbxx), getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		//关联计划
		public void glxm() {
			try {
				ResponseUtils.write(getresponse(), ""+zjtjServer.glxm(xmjbxx));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//取消关联
		public void qxgljh() {
			try {
				ResponseUtils.write(getresponse(), ""+zjtjServer.qxgljh(xmjbxx));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//获取项目
		public void getXm() {
			try {
				if ("".equals(xmname.trim()) || xmname.trim().length() < 2) {
					return;
				}
				List<XmZjtj> l = zjtjServer.getXm(xmname);
				JsonUtils.write(l, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getxmwh() {
			try {
				JsonUtils.write(zjtjServer.getxmwh(xmjbxx), getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		public void yzglxmzj(){
			try {
				ResponseUtils.write(getresponse(),zjtjServer.yzglxmzj(xmjbxx)+"");
			}catch (Exception e){
				e.printStackTrace();
			}
		}

}
