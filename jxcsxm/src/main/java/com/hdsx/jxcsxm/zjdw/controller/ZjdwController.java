package com.hdsx.jxcsxm.zjdw.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
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
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;
import com.hdsx.jxcsxm.zjdw.server.ZjdwServer;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;



/**
 * 系统管理Controller层
 * @author qinwh
 *
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller
public class ZjdwController extends BaseActionSupport implements ModelDriven<XmZjdw>{
	
	//定义变量
	private int page = 1;
	private int rows = 10;
	@Resource(name = "zjdwServerImpl")
	private ZjdwServer zjdwServer;
	private Xmjbxx xmjbxx=new Xmjbxx();
	private XmZjdw xmZjdw=new XmZjdw();
	private File fileupload;
	private String fileuploadFileName;
	
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
	@Override
	public XmZjdw getModel() {
		return xmZjdw;
	}
	//方法
	public void queryXmlist(){
		try {
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		
		xmjbxx.setJhxdwh(MyUtil.getQueryTJIN(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfqbdw(MyUtil.getQueryTJ(xmjbxx.getSfqbdw(), "sfqbdw"));
		if(xmZjdw.getPage()>0){
			xmjbxx.setPage(xmZjdw.getPage());
			xmjbxx.setRows(xmZjdw.getRows());
		}else{
			xmjbxx.setPage(page);
			xmjbxx.setRows(rows);
		}
		List<Xmjbxx> list=zjdwServer.queryXmlist(xmjbxx);
		int count=zjdwServer.queryXmlistCount(xmjbxx);
		EasyUIPage<Xmjbxx> e=new EasyUIPage<Xmjbxx>();
		e.setRows(list);
		e.setTotal(count);
		
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	//getdwTjAll  统计
	public void getdwTjAll(){
		try {
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		
		xmjbxx.setJhxdwh(MyUtil.getQueryTJIN(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfqbdw(MyUtil.getQueryTJ(xmjbxx.getSfqbdw(), "sfqbdw"));
			JsonUtils.write(zjdwServer.getdwTjAll(xmjbxx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void queryXmlistshqx(){
		
		xmZjdw.setGydw(MyUtil.getQueryTJ(xmZjdw.getGydw(), "gydwdm"));
		xmZjdw.setNf(MyUtil.getQueryTJ(xmZjdw.getNf(), "substr(dwyf,1,4)"));
		List<XmZjdw> list=zjdwServer.queryXmlistshqx(xmZjdw);
		int count=zjdwServer.queryXmlistshqxCount(xmZjdw);
		EasyUIPage<XmZjdw> e=new EasyUIPage<XmZjdw>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	public void insertZjdw(){
		ResponseUtils.write(getresponse(), ""+zjdwServer.insertZjdw(xmZjdw));
	}
	
	public void queryzjdwlist(){
		if("0".equals(xmZjdw.getSffy())){
			xmZjdw.setPage(1);
			xmZjdw.setRows(500);
		}
		List<XmZjdw> list=zjdwServer.queryzjdwlist(xmZjdw);
		int count=zjdwServer.queryzjdwlistCount(xmZjdw);
		EasyUIPage<XmZjdw> e=new EasyUIPage<XmZjdw>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void queryzjxdlist(){
		if("0".equals(xmZjdw.getSffy())){
			xmZjdw.setPage(1);
			xmZjdw.setRows(500);
		}else{
			xmZjdw.setPage(page);
			xmZjdw.setRows(rows);
		}
		List<XmZjdw> list=zjdwServer.queryzjxdlist(xmZjdw);
		int count=zjdwServer.queryzjxdlistCount(xmZjdw);
		EasyUIPage<XmZjdw> e=new EasyUIPage<XmZjdw>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	//根据资金到位id查询详细
	public void queryDwByid(){
		try {
			JsonUtils.write(zjdwServer.queryDwByid(xmZjdw), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//到位资金统计
	public void getdwTj(){
		try {
			JsonUtils.write(zjdwServer.getdwTj(xmZjdw), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//编辑到位资金
	public void updateZjdw(){
		xmZjdw.setId(MyUtil.getQueryTJ(xmZjdw.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjdwServer.updateZjdw(xmZjdw));
	}
	//编辑到位资金状态
	public void updateZjdwType(){
		xmZjdw.setId(MyUtil.getQueryTJ(xmZjdw.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjdwServer.updateZjdwType(xmZjdw));
	}
	//删除资金到位
	public void deldw(){
		xmZjdw.setId(MyUtil.getQueryTJ(xmZjdw.getId(), "id").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjdwServer.deldw(xmZjdw));
	}
	//查询管养单位
	public void queryChildGydw(){
		try {
			List<XmZjdw> list =zjdwServer.queryChildGydw(xmZjdw);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//添加修改水毁抢修
	public void insertOrUpdateShqx(){
		try {
			String[] gydwdm = xmZjdw.getGydwdm().split(",");
			String[] parent = xmZjdw.getParent().split(",");
			String[] dwyf = xmZjdw.getDwyf().split(",");
			String[] cgs = xmZjdw.getCgs1().split(",");
			String[] rys = xmZjdw.getRys1().split(",");
			String[] ttc = xmZjdw.getTtc1().split(",");
			String[] dfzc = xmZjdw.getDfzc1().split(",");
			String[] ztz = xmZjdw.getZtz1().split(",");
			String[] bd = xmZjdw.getBd().split(",");
			String[] jhxdwh = xmZjdw.getJhxdwh().split(",");
			
			String[] nf = xmZjdw.getNf().split(",");
			String[] tbr = xmZjdw.getTbr().split(",");
			String[] tbsj = xmZjdw.getTbsj().split(",");
			
			
			
			List<XmZjdw> save = new ArrayList<XmZjdw>();
			List<XmZjdw> update = new ArrayList<XmZjdw>();
			for (int i = 0; i < gydwdm.length; i++) {
				XmZjdw xm = new XmZjdw();
				xm.setGydwdm(gydwdm[i]);
				xm.setParent(parent[i]);
				xm.setDwyf(dwyf[i]);
				xm.setCgs(Double.parseDouble("".equals(cgs[i]) ? "0" : cgs[i]));
				xm.setRys(Double.parseDouble("".equals(rys[i]) ? "0" : rys[i]));
				xm.setTtc(Double.parseDouble("".equals(ttc[i]) ? "0" : ttc[i]));
				xm.setDfzc(Double.parseDouble("".equals(dfzc[i]) ? "0" : dfzc[i]));
				xm.setZtz(Double.parseDouble("".equals(ztz[i]) ? "0" : ztz[i]));
				xm.setBd(bd[i]);
				xm.setJhxdwh(jhxdwh[i]);
				xm.setXmbm(nf[i]+gydwdm[i]+jhxdwh[i]);
				xm.setNf(nf[i]);
				xm.setTbr(tbr[i]);
				xm.setTbsj(tbsj[i]);
				
				if (zjdwServer.queryShqxByOne(xm) == null) {
					save.add(xm);
				} else {
					update.add(xm);
				}
			}
			System.out.println("保存个数：" + save.size());
			System.out.println("修改个数：" + update.size());
			int a = 0;
			if (save.size() > 0) {
				a = zjdwServer.insertShqx(save);
			}
			if (update.size() > 0) {
				a = zjdwServer.updateShqx(update);
			}
			ResponseUtils.write(getresponse(), (a>0)+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	//根据单位查询资金
	public void queryZjByGydwdm(){
		try {
			List<XmZjdw> list =zjdwServer.queryZjByGydwdm(xmZjdw);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//根据单位查询资金
		public void queryZjxddwByGydwdm(){
			try {
				List<XmZjdw> list =zjdwServer.queryZjxddwByGydwdm(xmZjdw);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	//批量审核
	public void plshdw(){
		xmZjdw.setXmbm(MyUtil.getQueryTJ(xmZjdw.getXmbm(), "xmbm").replaceAll("and", ""));
		ResponseUtils.write(getresponse(), ""+zjdwServer.plshdw(xmZjdw));
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

	public XmZjdw getXmZjdw() {
		return xmZjdw;
	}

	public void setXmZjdw(XmZjdw xmZjdw) {
		this.xmZjdw = xmZjdw;
	}
	
	
	public void dcmb() {
		try {
			//System.out.println("进入方法");
			//设置表头
			ExcelTitleCell[] title = null;
			title = new ExcelTitleCell[22];
			title[0] = new ExcelTitleCell("项目编码", false,
					new ExcelCoordinate(0, (short) 0), null, 10,false);
			title[1] = new ExcelTitleCell("项目年份", false,
					new ExcelCoordinate(0, (short) 1), null, 20,false);
			title[2] = new ExcelTitleCell("项目名称", false,
					new ExcelCoordinate(0, (short) 2), null, 20,false);
			title[3] = new ExcelTitleCell("管养单位", false,
					new ExcelCoordinate(0, (short) 3), null, 20,false);
			title[4] = new ExcelTitleCell("行政区划", false,
					new ExcelCoordinate(0, (short) 4), null, 20,false);
			title[5] = new ExcelTitleCell("计划总投资", false,
					new ExcelCoordinate(0, (short) 5), null, 15,false);
			title[6] = new ExcelTitleCell("计划下达车购税", false,
					new ExcelCoordinate(0, (short) 6), null, 15,false);
			title[7] = new ExcelTitleCell("计划下达燃油税", false,
					new ExcelCoordinate(0, (short) 7), null, 15,false);
			title[8] = new ExcelTitleCell("计划下达地方自筹", false,
					new ExcelCoordinate(0, (short) 8), null, 15,false);
			title[9] = new ExcelTitleCell("计划下达厅统筹", false,
					new ExcelCoordinate(0, (short) 9), null, 15,false);
			title[10] = new ExcelTitleCell("计划下达文号", false,
					new ExcelCoordinate(0, (short) 10), null, 20,false);
			title[11] = new ExcelTitleCell("到位车购税", false,
					new ExcelCoordinate(0, (short) 11), null, 15,false);
			title[12] = new ExcelTitleCell("到位燃油税", false,
					new ExcelCoordinate(0, (short) 12), null, 15,false);
			title[13] = new ExcelTitleCell("到位地方自筹", false,
					new ExcelCoordinate(0, (short) 13), null, 15,false);
			title[14] = new ExcelTitleCell("到位厅统筹", false,
					new ExcelCoordinate(0, (short) 14), null, 15,false);
			title[15] = new ExcelTitleCell("到位月份", false,
					new ExcelCoordinate(0, (short) 15), null, 15,false);
			title[16] = new ExcelTitleCell("填报人", false,
					new ExcelCoordinate(0, (short) 16), null, 20,false);
			title[17] = new ExcelTitleCell("填报时间", false,
					new ExcelCoordinate(0, (short) 17), null, 20,false);

			title[18] = new ExcelTitleCell("已到位总投资", false,
					new ExcelCoordinate(0, (short) 18), null, 20,false);
			title[19] = new ExcelTitleCell("已到位部补", false,
					new ExcelCoordinate(0, (short) 19), null, 20,false);
			title[20] = new ExcelTitleCell("已到位省补", false,
					new ExcelCoordinate(0, (short) 20), null, 20,false);
			title[21] = new ExcelTitleCell("已到位地方", false,
					new ExcelCoordinate(0, (short) 21), null, 20,false);
			//设置列与字段对应
			Map<String, String> attribute = new HashMap<String, String>();
			attribute.put("0", "xmbm");//项目编码
			attribute.put("1", "xmnf");//项目年份
			attribute.put("2", "xmmc");//项目名称
			attribute.put("3", "gydw");//管养单位
			attribute.put("4", "xzqh");//行政区划
			attribute.put("5", "jhztz");//计划总投资
			attribute.put("6", "xdcgs");//计划下达车购税
			attribute.put("7", "xdrys");//计划下达燃油税
			attribute.put("8", "xddfzc");//计划下达地方自筹
			attribute.put("9", "xdttc");//计划下达厅统筹
			attribute.put("10", "jhxdwh");//计划下达文号
			attribute.put("11", "cgs");//车购税
			attribute.put("12", "rys");//燃油税
			attribute.put("13", "dfzc");//地方自筹
			attribute.put("14", "ttc");//厅统筹
			attribute.put("15", "dwyf");//到位月份
			attribute.put("16", "tbr");//填报人
			attribute.put("17", "tbsj");//填报时间

			attribute.put("18", "dwzj");
			attribute.put("19", "dwbb");
			attribute.put("20", "dwsb");
			attribute.put("21", "dwdf");

			List<Object> excelData = new ArrayList<Object>();
			String titleName = "通自然村资金到位模版";
			String fileName = "通自然村资金到位模版";
			xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
			xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
			
			xmjbxx.setJhxdwh(MyUtil.getQueryTJIN(xmjbxx.getJhxdwh(), "jhxdwh"));
			xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
			xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
			xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
			xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
			xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
			xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
			xmjbxx.setSfqbdw(MyUtil.getQueryTJ(xmjbxx.getSfqbdw(), "decode(zj.dwbb+zj.dwsb,null,'否',(zj.jhxdcgs+zj.jhxdttc),'是','否')"));
			List<XmZjdw> ql = zjdwServer.queryzjdwmb(xmjbxx);
			excelData.addAll(ql);
			ExcelEntity excel = new ExcelEntity(titleName, title, attribute,excelData);
			ExcelExportUtil.excelWritelock(excel, fileName, getresponse());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void dcmbjyzj() {
		try {
			//System.out.println("进入方法");
			//设置表头
			ExcelTitleCell[] title = null;
			title = new ExcelTitleCell[11];
			title[0] = new ExcelTitleCell("项目编码", false,
					new ExcelCoordinate(0, (short) 0), null, 10,false);
			title[1] = new ExcelTitleCell("项目年份", false,
					new ExcelCoordinate(0, (short) 1), null, 20,false);
			title[2] = new ExcelTitleCell("项目名称", false,
					new ExcelCoordinate(0, (short) 2), null, 20,false);
			title[3] = new ExcelTitleCell("管养单位", false,
					new ExcelCoordinate(0, (short) 3), null, 20,false);
			title[4] = new ExcelTitleCell("行政区划", false,
					new ExcelCoordinate(0, (short) 4), null, 20,false);
			title[5] = new ExcelTitleCell("计划总投资", false,
					new ExcelCoordinate(0, (short) 5), null, 15,false);
			title[6] = new ExcelTitleCell("计划下达车购税", false,
					new ExcelCoordinate(0, (short) 6), null, 15,false);
			title[7] = new ExcelTitleCell("计划下达燃油税", false,
					new ExcelCoordinate(0, (short) 7), null, 15,false);
			title[8] = new ExcelTitleCell("计划下达地方自筹", false,
					new ExcelCoordinate(0, (short) 8), null, 15,false);
			title[9] = new ExcelTitleCell("计划下达厅统筹", false,
					new ExcelCoordinate(0, (short) 9), null, 15,false);
			title[10] = new ExcelTitleCell("结余资金", false,
					new ExcelCoordinate(0, (short) 10), null, 15,false);
			
			//设置列与字段对应
			Map<String, String> attribute = new HashMap<String, String>();
			attribute.put("0", "xmbm");//项目编码
			attribute.put("1", "xmnf");//项目年份
			attribute.put("2", "xmmc");//项目名称
			attribute.put("3", "gydw");//管养单位
			attribute.put("4", "xzqh");//行政区划
			attribute.put("5", "jhztz");//计划总投资
			attribute.put("6", "xdcgs");//计划下达车购税
			attribute.put("7", "xdrys");//计划下达燃油税
			attribute.put("8", "xddfzc");//计划下达地方自筹
			attribute.put("9", "xdttc");//计划下达厅统筹
			attribute.put("10", "jyzj");//结余资金
			
			List<Object> excelData = new ArrayList<Object>();
			String titleName = xmjbxx.getJsxz()+"结余资金模版";
			String fileName = xmjbxx.getJsxz()+"结余资金模版";
			xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
			xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
			
			xmjbxx.setJhxdwh(MyUtil.getQueryTJIN(xmjbxx.getJhxdwh(), "jhxdwh"));
			xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
			xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
			xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
			xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
			xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
			xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
			List<XmZjdw> ql = zjdwServer.queryzjdwmbjyzj(xmjbxx);
			excelData.addAll(ql);
			ExcelEntity excel = new ExcelEntity(titleName, title, attribute,excelData);
			ExcelExportUtil.excelWritelock(excel, fileName, getresponse());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public void importZjdw() {
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
				dataMapArray = ExcelReader.readExcelContent(0,18,fs,Object.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			//System.out.println(dataMapArray[0]);
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			
			if(data.size()>=1) {
				if(data.get(0).get("0").equals("项目编码")&&data.get(0).get("10").equals("计划下达文号")&&data.get(0).get("11").equals("到位车购税")&&data.get(0).get("12").equals("到位燃油税")&&data.get(0).get("13").equals("到位地方自筹")&&data.get(0).get("14").equals("到位厅统筹")&&data.get(0).get("15").equals("到位月份")&&data.get(0).get("16").equals("填报人")&&data.get(0).get("17").equals("填报时间"))
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
				map.put("SBTHCD", xmZjdw.getSbthcd());
			}
			//将数据插入到数据库
			boolean b=zjdwServer.importZjdw(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	//批量导入结余资金
	public void importZjdwjyzj() {
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
				dataMapArray = ExcelReader.readExcelContent(0,18,fs,Object.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			//System.out.println(dataMapArray[0]);
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			
			if(data.size()>=1) {
				if(data.get(0).get("0").equals("项目编码")&&data.get(0).get("10").equals("结余资金"))
				data.remove(0);
				else {
					response.getWriter().print(fileuploadFileName+"数据有误");
					return;
				}
			}else {
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			//查询是否已存在
			String xmbm="";
			for (Map map : data) {
				xmbm+=",'"+map.get("0")+"'";
			}
			
			
			xmbm=xmbm.substring(1);
			List<XmZjdw> list = zjdwServer.queryZjjyByXmbm(xmbm);
			
			List<Map<String,String>> l1=new ArrayList<Map<String,String>>();
			List<Map<String,String>> l2=new ArrayList<Map<String,String>>();
			for (Map m : data) {
				m.put("XMBM", m.get("0"));
				m.put("JYZJ", m.get("10"));
				if(list.size()>0)
				for (XmZjdw x : list) {
					if(x.getXmbm().equals(m.get("0"))) {
						l2.add(m);
					}else {
						l1.add(m);
					}
				}
				else
					l1.add(m);
			}
			if(l1.size()>0)
				zjdwServer.importZjdwjyzjtj(l1);
			if(l2.size()>0)
				zjdwServer.importZjdwjyzjxg(l2);
			//将数据插入到数据库
			//boolean b=zjdwServer.importZjdwjyzj(data);
			//if(b)
			
			
			
			
				response.getWriter().print(fileuploadFileName+"导入成功");
			//else 
			//	response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){
			try {
				response.getWriter().print(fileuploadFileName+"有重复数据导入失败");
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		
	}
	
	
	//批量上报县级
	public void plsbdwxj() {
		xmZjdw.setXmbm(MyUtil.getQueryTJ(xmZjdw.getId(), "xmbm"));
		ResponseUtils.write(getresponse(), ""+zjdwServer.plsbdwxj(xmZjdw));
		
	}
	//批量上报市级
	public void plsbdwsj() {
		xmZjdw.setXmbm(MyUtil.getQueryTJ(xmZjdw.getId(), "xmbm"));
		ResponseUtils.write(getresponse(), ""+zjdwServer.plsbdwsj(xmZjdw));
		
	}
	
	
	public void queryzjdwtbsj(){
		try {
			xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
			xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
			JsonUtils.write(zjdwServer.queryzjdwtbsj(xmjbxx), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	//自然村全部审核
	public void qbshdw() {
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJIN(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfqbdw(MyUtil.getQueryTJ(xmjbxx.getSfqbdw(), "sfqbdw"));
		
		ResponseUtils.write(getresponse(), ""+zjdwServer.qbshdw(xmjbxx));
		
	}
	
	//全部删除的方法
	public void delzjdwqb() {
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz"));
		xmjbxx.setTbsj(MyUtil.getQueryTJ(xmjbxx.getTbsj(), "tbsj"));
		ResponseUtils.write(getresponse(), ""+zjdwServer.delzjdwqb(xmjbxx));
	}
	
	
	//自然村全部退回
	public void qbthsj() {
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJIN(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfqbdw(MyUtil.getQueryTJ(xmjbxx.getSfqbdw(), "sfqbdw"));
		xmjbxx.setZgx(MyUtil.getQueryTJ(xmjbxx.getZgx(), "gydwdm"));
		xmjbxx.setZgx1(MyUtil.getQueryTJNO(xmjbxx.getZgx(), "gydwdm"));
		
		ResponseUtils.write(getresponse(), ""+zjdwServer.qbthsj(xmjbxx));
		
	}
	//自然村全部退回县级
	public void qbthxj() {
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJIN(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setKnw(MyUtil.getQueryTJ(xmjbxx.getKnw(), "knw"));
		xmjbxx.setGydwdm(MyUtil.getQueryTJDW(xmjbxx.getGydwdm(), "gydwdm"));
		xmjbxx.setSfqbdw(MyUtil.getQueryTJ(xmjbxx.getSfqbdw(), "sfqbdw"));
		
		ResponseUtils.write(getresponse(), ""+zjdwServer.qbthxj(xmjbxx));
		
	}
	
}
