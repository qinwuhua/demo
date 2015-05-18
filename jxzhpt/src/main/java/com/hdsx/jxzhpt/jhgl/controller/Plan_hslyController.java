package com.hdsx.jxzhpt.jhgl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_gcsj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_hsly;
import com.hdsx.jxzhpt.jhgl.bean.Plan_hslyZjzj;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjxd;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zjzj;
import com.hdsx.jxzhpt.jhgl.excel.ExcelCoordinate;
import com.hdsx.jxzhpt.jhgl.excel.ExcelEntity;
import com.hdsx.jxzhpt.jhgl.excel.ExcelExportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelImportUtil;
import com.hdsx.jxzhpt.jhgl.excel.ExcelTitleCell;
import com.hdsx.jxzhpt.jhgl.server.Plan_hslyServer;
import com.hdsx.jxzhpt.jhgl.server.Plan_zjxdServer;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.webutil.struts.BaseActionSupport;

@Scope("prototype")
@Controller
public class Plan_hslyController  extends BaseActionSupport{
	private int page;
	private int rows;
	private String gydwdm;
	private String fileuploadFileName;
	private String tbbmbm2;
	private File fileupload;
	private Plan_hslyZjzj zjzj;
	private Plan_hsly hsly;
	@Resource(name = "plan_HslyServerImpl")
	private Plan_hslyServer hslyServer;
	@Resource(name = "plan_zjxdServerImpl")
	private Plan_zjxdServer zjxdServer;
	
	public void querySumHsly(){
		try {
			JsonUtils.write(hslyServer.querySumHsly(), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryHslyById(){
		try {
			JsonUtils.write(hslyServer.queryHslyById(hsly.getId()), getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryHslyList(){
		try {
			hsly.setXzqhdm(gydwOrxzqhBm(hsly.getXzqhdm(),"xzqhdm"));
			Map<String, Object> result =new HashMap<String, Object>();
			result.put("rows", hslyServer.queryHslyList(page, rows, hsly));
			result.put("total", hslyServer.queryHslyCount(hsly));
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryHslyZjzj(){
		try {
			List<Plan_hsly> queryHslyZjzj = hslyServer.queryHslyZjzj(hsly.getId());
			Map<String, Object> result =new HashMap<String, Object>();
			for (Plan_hsly item : queryHslyZjzj) {
				System.out.println(item.getXzscl());
			}
			result.put("rows", queryHslyZjzj);
			result.put("total", queryHslyZjzj.size());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void dropHslyById(){
		try {
			Map<String, String> result=new HashMap<String, String>();
			result.put("result", new Boolean(hslyServer.dropHslyById(hsly.getId())).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void editHsly(){
		try {
			Map<String, String> result =new HashMap<String, String>();
			result.put("result", new Boolean(hslyServer.editHsly(hsly)).toString());
			JsonUtils.write(result, getresponse().getWriter());
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void importHsly_jh(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		System.out.println("文件类型："+fileType);
		
		ExcelEntity excel=new ExcelEntity();
		//设置列与字段对应
		Map<String, String> attribute=new HashMap<String, String>();
		attribute.put("0", "xzqhmc");
		attribute.put("1", "xmmc");
		attribute.put("2", "jsxz");
		attribute.put("3", "gydwmc");
		attribute.put("4", "gydwdm");
		attribute.put("5", "jsgmhj");
		attribute.put("6", "jsgmy");
		attribute.put("7", "jsgme");
		attribute.put("8", "jsgms");
		attribute.put("9", "jsgmf");
		attribute.put("10", "jsgmdldq");
		attribute.put("11", "kgn");
		attribute.put("12", "wgn");
		attribute.put("13", "jhnf");
		attribute.put("14", "ztz");
		attribute.put("15", "zytz");
		attribute.put("16", "dfta");
		attribute.put("17", "gndk");
		attribute.put("18", "lywz");
		attribute.put("19", "zyjsnr");
		attribute.put("20", "xzscl");
		attribute.put("21", "gkpfwh");
		attribute.put("22", "sgtpfwh");
		excel.setAttributes(attribute);
		try {
			List<Plan_hsly> readerExcel = ExcelImportUtil.readerExcel(fileupload, Plan_hsly.class, 3, excel);
			List<Plan_hsly> data=new ArrayList<Plan_hsly>();
			readerExcel.remove(readerExcel.size()-1);
			System.out.println("开始个数："+readerExcel.size());
			for (int i = 0; i < readerExcel.size(); i++) {
				if(readerExcel.get(i).getGydwdm()==null || readerExcel.get(i).getGydwdm().equals("")){
					readerExcel.remove(i);
				}else{
					readerExcel.get(i).setZtz(new Double(new Double(readerExcel.get(i).getZytz()).doubleValue() + 
							new Double(readerExcel.get(i).getLywz()).doubleValue() + 
							new Double(readerExcel.get(i).getDfta()).doubleValue() + 
							new Double(readerExcel.get(i).getGndk()).doubleValue()).toString());
					readerExcel.get(i).setTbbm(tbbmbm2);
					readerExcel.get(i).setTbsj(new Date());
					data.add(readerExcel.get(i));
				}
			}
			boolean result = hslyServer.insertHsly2(data);
			HttpServletResponse response = ServletActionContext.getResponse();
			response.setCharacterEncoding("utf-8"); 
			if(result)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
			
		} catch (Exception e1) {
			e1.printStackTrace();
		}
//		try{
//			if(!"xls".equals(fileType)){
//				response.getWriter().print(fileuploadFileName+"不是excel文件");
//				return ;
//			}
			
//			FileInputStream fs = new FileInputStream(this.fileupload);
//			List<Map>[] dataMapArray;
//			try{
//				dataMapArray = ExcelReader.readExcelContent(3,23,fs,Plan_gcsj.class);
//			}catch(Exception e){
//				response.getWriter().print(fileuploadFileName+"数据有误");
//				return;
//			}
//			String strVerify=null;
//			boolean boolJh=false,boolLx=false;
//			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
//			for (Map map : data) {
//				UUID jhId = UUID.randomUUID(); 
//				map.put("jhid", jhId.toString().replace("-", ""));
//				map.put("gydwdm", getGydwdm());
//				map.put("tbsj", new Date());
//				map.put("tbbm", getGydwdm());
//				map.put("11", map.get("11").toString().substring(0, map.get("11").toString().indexOf(".")));
//				map.put("12", map.get("12").toString().substring(0, map.get("12").toString().indexOf(".")));
//				map.put("13", map.get("13").toString().substring(0, map.get("13").toString().indexOf(".")));
//				map.put("xzqhmc", map.get("0").toString());
//				//strVerify=ImportVerify.gcsjVerify(map);
////				if(gcsjServer.queryGPSBylxbm(map.get("3").toString())==0){
////					strVerify="【"+map.get("3").toString()+"】不存在！";
////				}
//			}
//			System.out.println(data);
//			boolean result = hslyServer.insertHsly(data);
			//将数据插入到数据库
	}
	
	public void exportExcelHslyZjxd(){
		try{
			hsly.setXzqhdm(gydwOrxzqhBm(hsly.getXzqhdm(),"xzqhdm"));
			System.out.println("行政区划："+hsly.getXzqhdm());
			hslyServer.queryHslyList(hsly);
			//设置表头
			ExcelTitleCell [] title=new ExcelTitleCell[8];
			title[0]=new ExcelTitleCell("项目名称",false, new ExcelCoordinate(0, (short)0), null,50);
			title[1]=new ExcelTitleCell("填报单位",false, new ExcelCoordinate(0, (short)1), null,15);
			title[2]=new ExcelTitleCell("下达年份",false, new ExcelCoordinate(0, (short)2), null,15);
			title[3]=new ExcelTitleCell("总投资",false, new ExcelCoordinate(0, (short)3), null,15);
			title[4]=new ExcelTitleCell("车购税",false, new ExcelCoordinate(0, (short)4), null,15);
			title[5]=new ExcelTitleCell("省投资",false, new ExcelCoordinate(0, (short)5), null,15);
			title[6]=new ExcelTitleCell("计划下达文号",false, new ExcelCoordinate(0, (short)6), null,15);
			title[7]=new ExcelTitleCell("ID",true, new ExcelCoordinate(0, (short)7), null,20);
			//设置列与字段对应
			Map<String, String> attribute=new HashMap<String, String>();
			attribute.put("0", "xmmc");//项目名称
			attribute.put("1", "tbdw");//填报单位-即导出单位
			attribute.put("2", "xdnf");//下达年份
			attribute.put("3", "xdzj");//下达的总投资
			attribute.put("4", "btzzj");//下达的部投资
			attribute.put("5", "stz");//下达的部投资
			attribute.put("6", "jhxdwh");//下达的部投资
			attribute.put("7", "xmid");
			//准备数据
			String gydwmc=zjxdServer.queryGydwmcById(gydwdm);
			List<Object> excelData = new ArrayList<Object>();
			if(gydwdm.equals("36")){
				gydwdm=null;
			}
			//此处遍历查询资金下达模块的所有项目
			for (Plan_hsly item : hslyServer.queryHslyList(hsly)) {
				Plan_zjxd zjxd=new Plan_zjxd();
				zjxd.setXmid(item.getId());
				zjxd.setXmmc(item.getXmmc());
				zjxd.setTbdw(gydwmc);
				excelData.add(zjxd);
			}
			ExcelEntity excel=new ExcelEntity("红色旅游",title,attribute,excelData);
			ExcelExportUtil.excelWrite(excel, "红色旅游-资金下达", getresponse());
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	public void editHslyzj() throws Exception{
		try{
			String str="false";
			hsly.setZtz(new Integer(new Integer(hsly.getZtz()).intValue()+new Integer(zjzj.getZtz()).intValue()).toString());
			hsly.setDfta(new Integer(new Integer(hsly.getDfta().equals("")?"0":hsly.getDfta()).intValue()+new Integer(zjzj.getDfzc()).intValue()).toString());
			hsly.setGndk(new Integer(new Integer(hsly.getGndk().equals("")?"0":hsly.getGndk()).intValue()+new Integer(zjzj.getGndk()).intValue()).toString());
			hsly.setLywz(new Integer(new Integer(hsly.getLywz().equals("")?"0":hsly.getLywz()).intValue()+new Integer(zjzj.getLywz()).intValue()).toString());
			hsly.setZytz(new Integer(new Integer(hsly.getZytz().equals("")?"0":hsly.getZytz()).intValue()+new Integer(zjzj.getZytzcgs()).intValue()).toString());
			if(hslyServer.editHslyZj(hsly) && zjxdServer.insertHslyZjzj(zjzj)) {
				str="true";
			}
			Map<String, String> result=new HashMap<String, String>();
			result.put("result",str);
			JsonUtils.write(result, getresponse().getWriter());
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
	}
	/**
	 * 管养单位或行政区划代码处理
	 * @param bh
	 * @param name
	 * @return
	 */
	public String gydwOrxzqhBm(String bh,String name){
		if(bh.indexOf(",")==-1){
			int i=0;
			if(bh.matches("^[0-9]*[1-9]00$")){
				i=2;
			}else if(bh.matches("^[0-9]*[1-9]0000$")){
				i=4;
			}
			bh=bh.substring(0,bh.length()-i);
		}
		return bh.indexOf(",")==-1 ? name+" like '%"+bh+"%'": name+" in ("+bh+")";
	}
	//get set
	public int getPage() {
		return page;
	}
	public Plan_hsly getHsly() {
		return hsly;
	}
	public void setHsly(Plan_hsly hsly) {
		this.hsly = hsly;
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
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
	public String getFileuploadFileName() {
		return fileuploadFileName;
	}
	public void setFileuploadFileName(String fileuploadFileName) {
		this.fileuploadFileName = fileuploadFileName;
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}
	public String getTbbmbm2() {
		return tbbmbm2;
	}
	public void setTbbmbm2(String tbbmbm2) {
		this.tbbmbm2 = tbbmbm2;
	}
	public Plan_hslyZjzj getZjzj() {
		return zjzj;
	}
	public void setZjzj(Plan_hslyZjzj zjzj) {
		this.zjzj = zjzj;
	}
}
