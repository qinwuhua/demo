package com.hdsx.jxzhpt.gcbb.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcbb.server.DbbbServer;
import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;
import com.hdsx.jxzhpt.jhgl.bean.Plan_abgc;
import com.hdsx.jxzhpt.jhgl.bean.Plan_wqgz;
import com.hdsx.jxzhpt.jhgl.bean.Plan_zhfz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckabgc;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckwqgz;
import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckabgc;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckwqgz;
import com.hdsx.jxzhpt.lwxm.xmsck.bean.Sckzhfz;
import com.hdsx.jxzhpt.utile.EasyUIPage;
import com.hdsx.jxzhpt.utile.ExportExcel_new;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.utile.SheetBean;
import com.hdsx.jxzhpt.utile.SjbbMessage;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.util.lang.JsonUtil;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
public class DbbbController extends BaseActionSupport implements ModelDriven<Jckwqgz>{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8781627913390367320L;
	@Resource(name="dbbbServerImpl")
	private DbbbServer dbServer;
	private Jckwqgz jckwqgz=new Jckwqgz();
	/***
	 * 获取年份列表
	 */
	public void getYearList(){
		List<String> list= new ArrayList<String>();
		Calendar calendar =Calendar.getInstance();
		int temp=calendar.get(Calendar.YEAR);
		System.out.println(temp);
		for(int i=temp;i>temp-10;i--){
			list.add(i+"");
		}
		try {
			JsonUtils.write(list, getresponse().getWriter());
		}catch (Exception e) {}
	}
	//危桥
	public void selectWqjc(){
		String tiaojian1="";
		if(jckwqgz.getGydw().indexOf(",")==-1){
			tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
		}else{
			tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
		}
		jckwqgz.setGydw(tiaojian1);
		List<Jckwqgz> selectWqjc = dbServer.selectWqjc(jckwqgz);
		int count = dbServer.selectWqjcCount(jckwqgz);
		EasyUIPage<Jckwqgz> eui =new EasyUIPage<Jckwqgz>();
		eui.setRows(selectWqjc);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_wqjc(){
		try {
			//先得到导出的数据集
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List <SjbbMessage> list=dbServer.exportExcel_wqjc(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>修建/改建年度</td>" +
					"<td>桥梁全长</td><td>桥梁全宽</td><td>跨径总长</td><td>单孔最大跨径</td><td>按跨径分类</td><td>" +
					"上部结构形式</td><td>评定等级</td><td>病害内容</td><td>备注</td>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥基础库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)18);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥基础库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Jckwqgz> ee = new ExportExcel_new<Jckwqgz>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void selectWqsc(){
		String tiaojian1="";
		if(jckwqgz.getGydw().indexOf(",")==-1){
			tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
		}else{
			tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
		}
		jckwqgz.setGydw(tiaojian1);
		List<Sckwqgz> selectWqsc = dbServer.selectWqsc(jckwqgz);
		int count = dbServer.selectWqscCount(jckwqgz);
		EasyUIPage<Sckwqgz> eui =new EasyUIPage<Sckwqgz>();
		eui.setRows(selectWqsc);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_wqsc(){
		try {
			//先得到导出的数据集
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List <SjbbMessage> list=dbServer.exportExcel_wqsc(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>桥梁编码</td><td>桥梁名称</td><td>桥梁中心桩号</td><td>桥梁全长</td>" +
					"<td>桥梁全宽</td><td>方案评估单位</td><td>方案审查单位</td><td>方案审批时间</td><td>审批文号</td>" +
					"<td>投资估算</td><td>建设性质</td><td>建设内容</td><td>备注</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥审查库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)13);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥审查库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Sckwqgz> ee = new ExportExcel_new<Sckwqgz>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void selectWqjh(){
		String tiaojian1="";
		if(jckwqgz.getGydw().indexOf(",")==-1){
			tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
		}else{
			tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
		}
		jckwqgz.setGydw(tiaojian1);
		List<Plan_wqgz> selectWqjh = dbServer.selectWqjh(jckwqgz);
		int count = dbServer.selectWqjhCount(jckwqgz);
		EasyUIPage<Plan_wqgz> eui =new EasyUIPage<Plan_wqgz>();
		eui.setRows(selectWqjh);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_wqjh(){
		try {
			//先得到导出的数据集
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List <SjbbMessage> list=dbServer.exportExcel_wqjh(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td>+" +
					"<td>修建/改建年度</td><td>设计单位 </td><td>设计批复单位</td><td>批复文号  </td>" +
					"<td>批复总投资（万元）</td><td>计划使用部补助金额（万元）</td>" +
					"<td>计划使用地方自筹资金（万元）</td><td>是否申请按比例补助 </td><td>按比例补助申请文号 </td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("危桥计划库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("危桥");
			sheetb.setList(list);
			sheetb.setColnum((short)17);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="危桥计划库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Plan_wqgz> ee = new ExportExcel_new<Plan_wqgz>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	//安保
	public void selectAbjc(){
		String tiaojian1="";
		if(jckwqgz.getGydw().indexOf(",")==-1){
			tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
		}else{
			tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
		}
		jckwqgz.setGydw(tiaojian1);
		List<Jckabgc> selectAbjc = dbServer.selectAbjc(jckwqgz);
		int count = dbServer.selectAbjcCount(jckwqgz);
		EasyUIPage<Jckabgc> eui =new EasyUIPage<Jckabgc>();
		eui.setRows(selectAbjc);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_abjc(){
		try {
			//先得到导出的数据集
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			
			List <SjbbMessage> list=dbServer.exportExcel_abjc(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
					"<td>修建/改建年度</td><td>隐患内容 </td><td>备注</td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保基础库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)12);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保基础库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Jckabgc> ee = new ExportExcel_new<Jckabgc>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
	public void selectAbsc(){
		String tiaojian1="";
		if(jckwqgz.getGydw().indexOf(",")==-1){
			tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
		}else{
			tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
		}
		jckwqgz.setGydw(tiaojian1);
		List<Sckabgc> selectAbsc = dbServer.selectAbsc(jckwqgz);
		int count = dbServer.selectAbscCount(jckwqgz);
		EasyUIPage<Sckabgc> eui =new EasyUIPage<Sckabgc>();
		eui.setRows(selectAbsc);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_absc(){
		try {
			//先得到导出的数据集
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List <SjbbMessage> list=dbServer.exportExcel_absc(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
					"<td>修建/改建年度</td><td>方案评估单位 </td><td>方案审查单位</td><td>方案审批时间</td>" +
					"<td>审批文号 </td><td>投资估算（万元）</td><td>建设性质 </td><td>建设内容 </td><td>备注 </td></tr>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保审查库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)18);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保审查库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Sckabgc> ee = new ExportExcel_new<Sckabgc>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	public void selectAbjh(){
		String tiaojian1="";
		if(jckwqgz.getGydw().indexOf(",")==-1){
			tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
		}else{
			tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
		}
		jckwqgz.setGydw(tiaojian1);
		List<Plan_abgc> selectAbjh = dbServer.selectAbjh(jckwqgz);
		int count = dbServer.selectAbjhCount(jckwqgz);
		EasyUIPage<Plan_abgc> eui =new EasyUIPage<Plan_abgc>();
		eui.setRows(selectAbjh);
		eui.setTotal(count);
		try {
			JsonUtils.write(eui, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportExcel_abjh(){
		try {
			//先得到导出的数据集
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List <SjbbMessage> list=dbServer.exportExcel_abjh(jckwqgz);
			System.out.println("------------"+list.size()+"--------------");
			//导出设置
			String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
					"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
					"<td>修建/改建年度</td><td>设计单位</td><td>设计批复单位</td><td>批复文号 </td><td>批复总投资（万元）</td>" +
					"<td>计划使用部补助金额（万元） </td><td>计划使用地方自筹资金（万元）</td><td>是否申请按比例补助</td>" +
					"<td>按比例补助申请文号</td>";
			List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
			SheetBean sheetb = new SheetBean();
			sheetb.setTableName("安保计划库报表");
			sheetb.setFooter(null);
			sheetb.setHeader(excelHtml);
			sheetb.setSheetName("安保");
			sheetb.setList(list);
			sheetb.setColnum((short)18);
			sheetBeans.add(sheetb);
			String stylefileName="module.xls";
			String tableName="安保计划库报表";//excel 文件的名字
			//导出excel
			ExportExcel_new <Plan_abgc> ee = new ExportExcel_new<Plan_abgc>();
			ee.initStyle(ee.workbook, stylefileName);
			HttpServletResponse response= getresponse();
			ee.makeExcel(tableName, sheetBeans, response);
		} catch (Exception e) {
			System.out.println("---------------------导出有误-----------------------");
			throw new RuntimeException();
		}
	}
	//灾害
		public void selectZhjc(){
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List<Jckzhfz> selectZhjc = dbServer.selectZhjc(jckwqgz);
			int count = dbServer.selectZhjcCount(jckwqgz);
			EasyUIPage<Jckzhfz> eui =new EasyUIPage<Jckzhfz>();
			eui.setRows(selectZhjc);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhjc(){
			try {
				//先得到导出的数据集
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
				String tiaojian1="";
				if(jckwqgz.getGydw().indexOf(",")==-1){
					tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
				}else{
					tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
				}
				jckwqgz.setGydw(tiaojian1);
				List <SjbbMessage> list=dbServer.exportExcel_zhjc(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
						"<td>修建/改建年度</td><td>隐患内容 </td><td>备注</td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害基础库报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害");
				sheetb.setList(list);
				sheetb.setColnum((short)12);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害基础库报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Jckzhfz> ee = new ExportExcel_new<Jckzhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectZhsc(){
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List<Sckzhfz> selectZhsc = dbServer.selectZhsc(jckwqgz);
			int count = dbServer.selectZhscCount(jckwqgz);
			EasyUIPage<Sckzhfz> eui =new EasyUIPage<Sckzhfz>();
			eui.setRows(selectZhsc);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhsc(){
			try {
				//先得到导出的数据集
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
				String tiaojian1="";
				if(jckwqgz.getGydw().indexOf(",")==-1){
					tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
				}else{
					tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
				}
				jckwqgz.setGydw(tiaojian1);
				List <SjbbMessage> list=dbServer.exportExcel_zhsc(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
						"<td>修建/改建年度</td><td>方案评估单位 </td><td>方案审查单位</td><td>方案审批时间</td>" +
						"<td>审批文号 </td><td>投资估算（万元）</td><td>建设性质 </td><td>建设内容 </td><td>备注 </td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害审查库报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害");
				sheetb.setList(list);
				sheetb.setColnum((short)18);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害审查库报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Sckzhfz> ee = new ExportExcel_new<Sckzhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectZhjh(){
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List<Plan_zhfz> selectZhjh = dbServer.selectZhjh(jckwqgz);
			int count = dbServer.selectZhjhCount(jckwqgz);
			EasyUIPage<Plan_zhfz> eui =new EasyUIPage<Plan_zhfz>();
			eui.setRows(selectZhjh);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhjh(){
			try {
				//先得到导出的数据集
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
				String tiaojian1="";
				if(jckwqgz.getGydw().indexOf(",")==-1){
					tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
				}else{
					tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
				}
				jckwqgz.setGydw(tiaojian1);
				List <SjbbMessage> list=dbServer.exportExcel_zhjh(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位 </td><td>行政区划代码 </td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称 </td><td>起点桩号</td><td>止点桩号 </td><td>总里程</td><td>隐患里程</td>" +
						"<td>修建/改建年度</td><td>设计单位</td><td>设计批复单位</td><td>批复文号 </td><td>批复总投资（万元）</td>" +
						"<td>计划使用部补助金额（万元） </td><td>计划使用地方自筹资金（万元）</td><td>是否申请按比例补助</td>" +
						"<td>按比例补助申请文号</td>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害计划库报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害");
				sheetb.setList(list);
				sheetb.setColnum((short)18);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害计划库报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Plan_zhfz> ee = new ExportExcel_new<Plan_zhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectWqkg(){
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List<Plan_wqgz> selectWqkg = dbServer.selectWqkg(jckwqgz);
			int count = dbServer.selectWqkgCount(jckwqgz);
			EasyUIPage<Plan_wqgz> eui =new EasyUIPage<Plan_wqgz>();
			eui.setRows(selectWqkg);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_wqkg(){
			try {
				//先得到导出的数据集
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
				String tiaojian1="";
				if(jckwqgz.getGydw().indexOf(",")==-1){
					tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
				}else{
					tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
				}
				jckwqgz.setGydw(tiaojian1);
				List <SjbbMessage> list=dbServer.exportExcel_wqkg(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>桥梁编号</td><td>桥梁名称</td><td>桥梁中心桩号</td>+" +
						"<td>计划下达时间</td><td>计划开工时间 </td><td>计划完工时间</td><td>实际开工时间</td>" +
						"<td>施工单位</td><td>监理单位</td><td>合同金额</td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("危桥进度库开工信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("危桥进度库开工信息");
				sheetb.setList(list);
				sheetb.setColnum((short)15);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="危桥进度库开工信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Plan_wqgz> ee = new ExportExcel_new<Plan_wqgz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectAbkg(){
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List<Plan_abgc> selectAbkg = dbServer.selectAbkg(jckwqgz);
			int count = dbServer.selectAbkgCount(jckwqgz);
			EasyUIPage<Plan_abgc> eui =new EasyUIPage<Plan_abgc>();
			eui.setRows(selectAbkg);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_abkg(){
			try {
				//先得到导出的数据集
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
				String tiaojian1="";
				if(jckwqgz.getGydw().indexOf(",")==-1){
					tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
				}else{
					tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
				}
				jckwqgz.setGydw(tiaojian1);
				List <SjbbMessage> list=dbServer.exportExcel_abkg(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>隐患里程</td>+" +
						"<td>计划下达时间</td><td>计划开工时间 </td><td>计划完工时间</td><td>实际开工时间</td>" +
						"<td>施工单位</td><td>监理单位</td><td>合同金额</td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("安保进度库开工信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("安保安保进度库开工信息");
				sheetb.setList(list);
				sheetb.setColnum((short)15);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="安保进度库开工信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Plan_abgc> ee = new ExportExcel_new<Plan_abgc>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectZhkg(){
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List<Plan_zhfz> selectZhkg = dbServer.selectZhkg(jckwqgz);
			int count = dbServer.selectZhkgCount(jckwqgz);
			EasyUIPage<Plan_zhfz> eui =new EasyUIPage<Plan_zhfz>();
			eui.setRows(selectZhkg);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhkg(){
			try {
				//先得到导出的数据集
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
				String tiaojian1="";
				if(jckwqgz.getGydw().indexOf(",")==-1){
					tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
				}else{
					tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
				}
				jckwqgz.setGydw(tiaojian1);
				List <SjbbMessage> list=dbServer.exportExcel_zhkg(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>管养单位</td><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>起止里程</td><td>隐患里程</td>+" +
						"<td>计划下达时间</td><td>计划开工时间 </td><td>计划完工时间</td><td>实际开工时间</td>" +
						"<td>施工单位</td><td>监理单位</td><td>合同金额</td></tr>";
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害进度库开工信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害进度库开工信息");
				sheetb.setList(list);
				sheetb.setColnum((short)15);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害进度库开工信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Plan_zhfz> ee = new ExportExcel_new<Plan_zhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		public void selectWqjz(){
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List<Gcglwqgz> selectWqjd = dbServer.selectWqjz(jckwqgz);
			int count = dbServer.selectWqjzCount(jckwqgz);
			EasyUIPage<Gcglwqgz> eui =new EasyUIPage<Gcglwqgz>();
			eui.setRows(selectWqjd);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_wqjz(){
			try {
				//先得到导出的数据集
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
				String tiaojian1="";
				if(jckwqgz.getGydw().indexOf(",")==-1){
					tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
				}else{
					tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
				}
				jckwqgz.setGydw(tiaojian1);
				List <SjbbMessage> list=dbServer.exportExcel_wqjz(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>桥梁编码</td><td>桥梁名称</td><td>上报时间</td><td>预计竣工时间</td>+" +
						"<td>完成中央投资(万元)</td><td>完成地方自筹(万元)</td><td>工程竣工时间</td><td>备注</td>" ;
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("危桥进度库进展信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("危桥进度库进展信息");
				sheetb.setList(list);
				sheetb.setColnum((short)12);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="危桥进度库进展信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Gcglwqgz> ee = new ExportExcel_new<Gcglwqgz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		
		public void selectAbjz(){
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List<Gcglabgc> selectWqjd = dbServer.selectAbjz(jckwqgz);
			int count = dbServer.selectAbjzCount(jckwqgz);
			EasyUIPage<Gcglabgc> eui =new EasyUIPage<Gcglabgc>();
			eui.setRows(selectWqjd);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_abjz(){
			try {
				//先得到导出的数据集
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
				String tiaojian1="";
				if(jckwqgz.getGydw().indexOf(",")==-1){
					tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
				}else{
					tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
				}
				jckwqgz.setGydw(tiaojian1);
				List <SjbbMessage> list=dbServer.exportExcel_abjz(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>上报时间</td><td>预计竣工时间</td>+" +
						"<td>完成中央投资(万元)</td><td>完成地方自筹(万元)</td><td>工程竣工时间</td><td>备注</td>" ;
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("安保进度库进展信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("安保进度库进展信息");
				sheetb.setList(list);
				sheetb.setColnum((short)12);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="安保进度库进展信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Gcglabgc> ee = new ExportExcel_new<Gcglabgc>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		
		public void selectZhjz(){
			String tiaojian1="";
			if(jckwqgz.getGydw().indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
			}
			jckwqgz.setGydw(tiaojian1);
			List<Gcglzhfz> selectWqjd = dbServer.selectZhjz(jckwqgz);
			int count = dbServer.selectZhjzCount(jckwqgz);
			EasyUIPage<Gcglzhfz> eui =new EasyUIPage<Gcglzhfz>();
			eui.setRows(selectWqjd);
			eui.setTotal(count);
			try {
				JsonUtils.write(eui, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_zhjz(){
			try {
				//先得到导出的数据集
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				jckwqgz.setGydw((String) session.getAttribute("gydwbb"));	
				String tiaojian1="";
				if(jckwqgz.getGydw().indexOf(",")==-1){
					tiaojian1="and gydwbm like '%'||substr('"+jckwqgz.getGydw()+"',0,4)||'_'||substr('"+jckwqgz.getGydw()+"',6)||'%'";
				}else{
					tiaojian1="and gydwbm in ("+jckwqgz.getGydw()+")";
				}
				jckwqgz.setGydw(tiaojian1);
				List <SjbbMessage> list=dbServer.exportExcel_zhjz(jckwqgz);
				System.out.println("------------"+list.size()+"--------------");
				//导出设置
				String excelHtml="<tr><td>行政区划代码</td><td>行政区划名称</td><td>路线编码</td>" +
						"<td>路线名称</td><td>起点桩号</td><td>止点桩号</td><td>上报时间</td><td>预计竣工时间</td>+" +
						"<td>完成中央投资(万元)</td><td>完成地方自筹(万元)</td><td>工程竣工时间</td><td>备注</td>" ;
				List<SheetBean> sheetBeans=new ArrayList<SheetBean>(); 
				SheetBean sheetb = new SheetBean();
				sheetb.setTableName("灾害进度库进展信息报表");
				sheetb.setFooter(null);
				sheetb.setHeader(excelHtml);
				sheetb.setSheetName("灾害进度库进展信息");
				sheetb.setList(list);
				sheetb.setColnum((short)12);
				sheetBeans.add(sheetb);
				String stylefileName="module.xls";
				String tableName="灾害进度库进展信息报表";//excel 文件的名字
				//导出excel
				ExportExcel_new <Gcglzhfz> ee = new ExportExcel_new<Gcglzhfz>();
				ee.initStyle(ee.workbook, stylefileName);
				HttpServletResponse response= getresponse();
				ee.makeExcel(tableName, sheetBeans, response);
			} catch (Exception e) {
				System.out.println("---------------------导出有误-----------------------");
				throw new RuntimeException();
			}
		}
		//公路建设下达计划
		public void gljsxdList(){
			try {
				String tiaojian1="";
				String tiaojian2="";
				String xzqhdm = "";
				String gydwdm = "";
				if("导出excel".equals(flag)){
					HttpServletRequest request = ServletActionContext.getRequest();
					HttpSession session = request.getSession();
					gydwdm=(String) session.getAttribute("gydwbb");	
					xzqhdm=(String) session.getAttribute("xzqhbb");	
				}else{
				gydwdm = xmbb.getGydw();
				xzqhdm	= xmbb.getXzqh();
				}
				if(gydwdm.indexOf(",")==-1){
					tiaojian1="and gydw like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
				}else{
					tiaojian1="and gydw in ("+gydwdm+")";
				}
				if(xzqhdm.indexOf(",")==-1){
					tiaojian2="and xzqh like '%"+xzqhdm+"%'";
				}else{
					tiaojian2="and xzqh in ("+xzqhdm+")";
				}
				//System.out.println(tiaojian1);
				//System.out.println(tiaojian2);
			xmbb.setGydw(tiaojian1);
			xmbb.setXzqh(tiaojian2);
			List<Map<String,Object>> list = dbServer.selectgljsxdList(xmbb);
			System.out.println("导出excel".equals(flag));
			if("导出excel".equals(flag)){
				List<Excel_list> elist=new ArrayList<Excel_list>();
				for (Map<String, Object> map : list) {
					Excel_list l=new Excel_list();
					try {l.setV_0(map.get("BZ").toString());} catch (Exception e) {l.setV_0("");}
					try {l.setV_1(map.get("XMMC").toString());} catch (Exception e) {l.setV_1("");}
					try {l.setV_2(map.get("XZDJ").toString());} catch (Exception e) {l.setV_2("");}
					try {l.setV_3(map.get("QDZH").toString());} catch (Exception e) {l.setV_3("");}
					try {l.setV_4(map.get("ZDZH").toString());} catch (Exception e) {l.setV_4("");}
					try {l.setV_5(map.get("LXBH").toString());} catch (Exception e) {l.setV_5("");}
					try {l.setV_6(map.get("JSDJ").toString());} catch (Exception e) {l.setV_6("");}
					try {l.setV_7(map.get("TSDQ").toString());} catch (Exception e) {l.setV_7("");}
					try {l.setV_8(map.get("SHI").toString());} catch (Exception e) {l.setV_8("");}
					try {l.setV_9(map.get("XIAN").toString());} catch (Exception e) {l.setV_9("");}
					try {l.setV_10(map.get("JSXZ").toString());} catch (Exception e) {l.setV_10("");}
					try {l.setV_11(map.get("HEJGL").toString());} catch (Exception e) {l.setV_11("");}
					try {l.setV_12(map.get("YIJGL").toString());} catch (Exception e) {l.setV_12("");}
					try {l.setV_13(map.get("ERJGL").toString());} catch (Exception e) {l.setV_13("");}
					try {l.setV_14(map.get("SANJGL").toString());} catch (Exception e) {l.setV_14("");}
					try {l.setV_15(map.get("SIJGL").toString());} catch (Exception e) {l.setV_15("");}
					try {l.setV_16(map.get("DQIAO").toString());} catch (Exception e) {l.setV_16("");}
					try {l.setV_17(map.get("SDAO").toString());} catch (Exception e) {l.setV_17("");}
					try {l.setV_18(map.get("LMKD").toString());} catch (Exception e) {l.setV_18("");}
					try {l.setV_19(map.get("JSFA").toString());} catch (Exception e) {l.setV_19("");}
					try {l.setV_20(map.get("ZTZ").toString());} catch (Exception e) {l.setV_20("");}
					try {l.setV_21(map.get("BTZ").toString());} catch (Exception e) {l.setV_21("");}
					try {l.setV_22(map.get("STZ").toString());} catch (Exception e) {l.setV_22("");}
					try {l.setV_23(map.get("SNHJ").toString());} catch (Exception e) {l.setV_23("");}
					try {l.setV_24(map.get("SNBTZ").toString());} catch (Exception e) {l.setV_24("");}
					try {l.setV_25(map.get("BNHJ").toString());} catch (Exception e) {l.setV_25("");}
					try {l.setV_26(map.get("BNBTZ").toString());} catch (Exception e) {l.setV_26("");}
					try {l.setV_27(map.get("GKPFWH").toString());} catch (Exception e) {l.setV_27("");}
					try {l.setV_28(map.get("SJPFWH").toString());} catch (Exception e) {l.setV_28("");}
					try {l.setV_29(map.get("JHXDWH").toString());} catch (Exception e) {l.setV_29("");}
					elist.add(l);
				}
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("公路建设下达计划（国省道改造项目）");//设置第一行
				eldata.setSheetName("公路建设下达计划表");//设置sheeet名
				eldata.setFileName("公路建设下达计划表");//设置文件名
				eldata.setEl(elist);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("备注",1,2,0,0));
				et.add(new Excel_tilte("项目名称",1,2,1,1));
				et.add(new Excel_tilte("行政等级",1,2,2,2));
				et.add(new Excel_tilte("起点桩号",1,2,3,3));
				et.add(new Excel_tilte("终点桩号",1,2,4,4));
				et.add(new Excel_tilte("路线编码",1,2,5,5));
				et.add(new Excel_tilte("现公路技术等级",1,2,6,6));
				et.add(new Excel_tilte(" ",1,1,7,9));
				et.add(new Excel_tilte("建设性质",1,2,10,10));
				et.add(new Excel_tilte("建 设 规 模（ 公 里 ） / （ 延 米 ）",1,1,11,17));
				et.add(new Excel_tilte("路面宽度",1,2,18,18));
				et.add(new Excel_tilte("技术方案",1,2,19,19));
				et.add(new Excel_tilte("总投资（万元）",1,2,20,20));
				et.add(new Excel_tilte("中央投资（万元）",1,2,21,21));
				et.add(new Excel_tilte("省级补助（万元）",1,2,22,22));
				et.add(new Excel_tilte("上年累计完成投资（万元）",1,1,23,24));
				et.add(new Excel_tilte("本年建设计划（万元）",1,1,25,26));
				et.add(new Excel_tilte("前期工作情况",1,1,27,28));
				et.add(new Excel_tilte("计划下达文号",1,2,29,29));
				et.add(new Excel_tilte("特殊地区 ",2,2,7,7));
				et.add(new Excel_tilte("市",2,2,8,8));
				et.add(new Excel_tilte("县",2,2,9,9));
				et.add(new Excel_tilte("合计",2,2,11,11));
				et.add(new Excel_tilte("一级公路",2,2,12,12));
				et.add(new Excel_tilte("二级公路",2,2,13,13));
				et.add(new Excel_tilte("三级公路",2,2,14,14));
				et.add(new Excel_tilte("四级公路",2,2,15,15));
				et.add(new Excel_tilte("大桥",2,2,16,16));
				et.add(new Excel_tilte("隧道",2,2,17,17));
				et.add(new Excel_tilte("合计",2,2,23,23));
				et.add(new Excel_tilte("内：中央车购税",2,2,24,24));
				et.add(new Excel_tilte("合计",2,2,25,25));
				et.add(new Excel_tilte("车购税合计",2,2,26,26));
				et.add(new Excel_tilte("工可批复文号",2,2,27,27));
				et.add(new Excel_tilte("设计批复文号",2,2,28,28));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}
			else{
				JsonUtils.write(list, getresponse().getWriter());
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		public void exportExcel_gljsxd(){
				//先得到导出的数据集
				List <Excel_list> list=dbServer.gljsxdList(jckwqgz);
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("公路建设下达计划（国省道改造项目）");//设置第一行
				eldata.setSheetName("公路建设下达计划表");//设置sheeet名
				eldata.setFileName("公路建设下达计划表");//设置文件名
				eldata.setEl(list);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("备注",1,2,0,0));
				et.add(new Excel_tilte("项目名称",1,2,1,1));
				et.add(new Excel_tilte("行政等级",1,2,2,2));
				et.add(new Excel_tilte("起点桩号",1,2,3,3));
				et.add(new Excel_tilte("终点桩号",1,2,4,4));
				et.add(new Excel_tilte("路线编码",1,2,5,5));
				et.add(new Excel_tilte("",1,1,6,8));
				et.add(new Excel_tilte("建设性质",1,2,9,9));
				et.add(new Excel_tilte("建 设 规 模（ 公 里 ） / （ 延 米 ）",1,1,10,16));
				et.add(new Excel_tilte("路面宽度",1,2,17,17));
				et.add(new Excel_tilte("技术方案",1,2,18,18));
				et.add(new Excel_tilte("总投资（万元）",1,2,19,19));
				et.add(new Excel_tilte("中央投资（万元）",1,2,20,20));
				//第二行
				et.add(new Excel_tilte("特殊地区",2,2,6,6));
				et.add(new Excel_tilte("市",2,2,7,7));
				et.add(new Excel_tilte("县",2,2,8,8));
				et.add(new Excel_tilte("合计",2,2,10,10));
				et.add(new Excel_tilte("一级公路",2,2,11,11));
				et.add(new Excel_tilte("二级公路",2,2,12,12));
				et.add(new Excel_tilte("三级公路",2,2,13,13));
				et.add(new Excel_tilte("四级公路",2,2,14,14));
				et.add(new Excel_tilte("大桥",2,2,15,15));
				et.add(new Excel_tilte("隧道",2,2,16,16));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				try {
					Excel_export.excel_export(eldata,response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//将类和参数HttpServletResponse传入即可实现导出excel		
		}
		
	
	
	public Jckwqgz getJckwqgz() {
		return jckwqgz;
	}
	public void setJckwqgz(Jckwqgz jckwqgz) {
		this.jckwqgz = jckwqgz;
	}
	@Override
	public Jckwqgz getModel() {
		return jckwqgz;
	}
	private String xzqh;
	private String gydw;
	private String xdnf;
	private String xmlx;
	private Xmbb xmbb=new Xmbb();
	public String getXzqh() {
		return xzqh;
	}
	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}
	public String getGydw() {
		return gydw;
	}
	public void setGydw(String gydw) {
		this.gydw = gydw;
	}
	public String getXdnf() {
		return xdnf;
	}
	public void setXdnf(String xdnf) {
		this.xdnf = xdnf;
	}
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}
	public Xmbb getXmbb() {
		return xmbb;
	}
	public void setXmbb(Xmbb xmbb) {
		this.xmbb = xmbb;
	}
	private String flag;
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}
