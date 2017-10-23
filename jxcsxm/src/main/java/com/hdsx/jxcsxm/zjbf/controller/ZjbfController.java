package com.hdsx.jxcsxm.zjbf.controller;

import java.io.File;
import java.io.FileInputStream;
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
import com.hdsx.jxcsxm.zjbf.bean.XmZjbf;
import com.hdsx.jxcsxm.zjbf.server.ZjbfServer;
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;
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
	private File fileupload;
	private String fileuploadFileName;
	@Override
	public XmZjbf getModel() {
		return xmZjbf;
	}
	//方法
	public void queryXmlist(){
		
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfqbbf(MyUtil.getQueryTJ(xmjbxx.getSfqbbf(), "sfqbbf"));
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
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfqbbf(MyUtil.getQueryTJ(xmjbxx.getSfqbbf(), "sfqbbf"));
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
				
				String[] nf = xmZjbf.getNf().split(",");
				String[] tbr = xmZjbf.getTbr().split(",");
				String[] tbsj = xmZjbf.getTbsj().split(",");
				
				
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
					xm.setXmbm(nf[i]+gydwdm[i]+jhxdwh[i]);
					xm.setBz(bz[i]);
					xm.setNf(nf[i]);
					xm.setTbr(tbr[i]);
					xm.setTbsj(tbsj[i]);
					
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
		//根据单位查询资金
		public void queryZjdwbfByGydwdm(){
			try {
				List<XmZjbf> list =zjbfServer.queryZjdwbfByGydwdm(xmZjbf);
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
				xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
				xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
				xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
				xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
				xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
				xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
				xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
				xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
				List<XmZjbf> ql = zjbfServer.queryzjbfmb(xmjbxx);
				excelData.addAll(ql);
				ExcelEntity excel = new ExcelEntity(titleName, title, attribute,excelData);
				ExcelExportUtil.excelWritelock(excel, fileName, getresponse());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//批量导入拨付
		
		public void importZjbf() {
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
					map.put("SBTHCD", xmZjbf.getSbthcd());
				}
				//将数据插入到数据库
				boolean b=zjbfServer.importZjbf(data);
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
			xmZjbf.setXmbm(MyUtil.getQueryTJ(xmZjbf.getId(), "xmbm"));
			ResponseUtils.write(getresponse(), ""+zjbfServer.plsbbfxj(xmZjbf));
			
		}
		//批量上报市级
		public void plsbbfsj() {
			xmZjbf.setXmbm(MyUtil.getQueryTJ(xmZjbf.getId(), "xmbm"));
			ResponseUtils.write(getresponse(), ""+zjbfServer.plsbbfsj(xmZjbf));
			
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
	
	
	
	
	
	
}
