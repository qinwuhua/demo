package com.hdsx.jxzhpt.lwxm.xmsck.controller;

import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.server.SckwqgzServer;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExcelReader;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.ResponseUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 项目审查库——灾害防治Action层
 * @author lhp
 *
 */
@Scope("prototype")
@Controller
public class SckwqgzController extends BaseActionSupport implements ModelDriven<Sckwqgz>{

	private static final long serialVersionUID = 1L;
	@Resource(name="sckwqgzServerImpl")
	private SckwqgzServer wqgzServer;
	private Sckwqgz sckwqgz=new Sckwqgz();
	private String delstr;
	private String fileuploadFileName;
	private File fileupload;
	
	//审查库安保工程模板数据导入
	public void importWqgz_sc(){
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		HttpServletResponse response = ServletActionContext.getResponse();
		try{
			if(!"xls".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是excel文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader.readExcelContent(fs,Jckwqgz.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			//将数据插入到数据库
			boolean b=wqgzServer.importWqgz_sc(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){}
	}
	public void exportExcel_wqgz_scgl(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqgz_scgl(sckwqgz);
			//导出设置
			String excelHtml="<tr><td>审核状态</td><td>管养单位</td><td>行政区划</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>路线编码</td><td>路线名称</td><td>桥梁评定等级</td><td>修建/改建年度</td><td>项目年份</td><td>建设性质</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥改造项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)12);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥改造项目";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void exportExcel_wqgz_scsh(){
		try {
			//先得到导出的数据集
			List <SjbbMessage> list=wqgzServer.exportExcel_wqgz_scsh(sckwqgz);
			//导出设置
			String excelHtml="<tr><td>审核状态</td><td>管养单位</td><td>行政区划</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>路线编码</td><td>路线名称</td><td>桥梁评定等级</td><td>修建/改建年度</td><td>项目年份</td><td>建设性质</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥改造项目");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)12);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥改造项目";//excel 文件的名字
			//导出excel
			ExportExcel_new ee = new ExportExcel_new();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void insertSckwqgz(){
		boolean b = wqgzServer.insertSckwqgz(sckwqgz);
		if(b)  ResponseUtils.write(getresponse(), "true");
		else ResponseUtils.write(getresponse(), "false");
	}
	public void selectSckwqgz(){
		List<Sckwqgz> list = wqgzServer.selectSckwqgz(sckwqgz);
		int count = wqgzServer.selectWqgzCount(sckwqgz);
		EasyUIPage<Sckwqgz> eui = new EasyUIPage<Sckwqgz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteSckWqgz(){
		if(wqgzServer.deleteSckWqgz(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void updateSckwqgz(){
		if(wqgzServer.updateSckWqgz(sckwqgz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckwqgzById(){
		try {
			JsonUtils.write(wqgzServer.selectSckwqgzById(sckwqgz), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckWqgzSbzt(){
		if(wqgzServer.xgSckWqgzSbzt(delstr)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	public void selectSckShwqgz(){
		List<Sckwqgz> list = wqgzServer.selectSckShwqgz(sckwqgz);
		int count = wqgzServer.selectWqgzShCount(sckwqgz);
		EasyUIPage<Sckwqgz> eui = new EasyUIPage<Sckwqgz>();
		eui.setRows(list);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void xgSckWqgzShzt(){
		if(wqgzServer.xgSckWqgzShzt(sckwqgz)){
			ResponseUtils.write(getresponse(), "true");
		}else{
			ResponseUtils.write(getresponse(), "false");
		}
	}
	
	

	public Sckwqgz getSckwqgz() {
		return sckwqgz;
	}
	public void setSckwqgz(Sckwqgz sckwqgz) {
		this.sckwqgz = sckwqgz;
	}
	public String getDelstr() {
		return delstr;
	}
	public void setDelstr(String delstr) {
		this.delstr = delstr;
	}

	@Override
	public Sckwqgz getModel() {
		return sckwqgz;
	}
	public SckwqgzServer getWqgzServer() {
		return wqgzServer;
	}
	public void setWqgzServer(SckwqgzServer wqgzServer) {
		this.wqgzServer = wqgzServer;
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
	
}