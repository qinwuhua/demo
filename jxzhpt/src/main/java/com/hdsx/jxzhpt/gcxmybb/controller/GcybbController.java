package com.hdsx.jxzhpt.gcxmybb.controller;

import java.io.IOException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.net.aso.f;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.components.If;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;
import com.hdsx.jxzhpt.gcxmybb.server.GcybbServer;
import com.hdsx.jxzhpt.utile.JsonUtils;
import com.hdsx.jxzhpt.wjxt.controller.ExcelData;
import com.hdsx.jxzhpt.wjxt.controller.Excel_export;
import com.hdsx.jxzhpt.wjxt.controller.Excel_list;
import com.hdsx.jxzhpt.wjxt.controller.Excel_tilte;
import com.hdsx.webutil.struts.BaseActionSupport;


/**
 * 系统管理Controller层
 * @author qwh
 *
 */
@Scope("prototype")
@Controller
public class GcybbController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	private int page = 1;
	private int rows = 10;
	@Resource(name = "gcybbServerImpl")
	private GcybbServer gcybbServer;
	private String nf;
	private String yf;
	private String xzqh;
	private String xzdj;
	private String lxmc;
	private String gydw;
	private String tiaojian;
	private String xmmc;
	private String xmnf;
	private Gcglwqgz gcglwqgz=new Gcglwqgz();
	private Gcglabgc gcglabgc=new Gcglabgc();
	private Gcglzhfz gcglzhfz=new Gcglzhfz();
	private Gcglsh gcglsh=new Gcglsh();
	private String flag;
	private String sfylrbwqk;
	
	public String getSfylrbwqk() {
		return sfylrbwqk;
	}

	public void setSfylrbwqk(String sfylrbwqk) {
		this.sfylrbwqk = sfylrbwqk;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getXmnf() {
		return xmnf;
	}

	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}

	public String getXmmc() {
		return xmmc;
	}

	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}

	public Gcglsh getGcglsh() {
		return gcglsh;
	}

	public void setGcglsh(Gcglsh gcglsh) {
		this.gcglsh = gcglsh;
	}

	public Gcglzhfz getGcglzhfz() {
		return gcglzhfz;
	}

	public void setGcglzhfz(Gcglzhfz gcglzhfz) {
		this.gcglzhfz = gcglzhfz;
	}

	public Gcglabgc getGcglabgc() {
		return gcglabgc;
	}

	public void setGcglabgc(Gcglabgc gcglabgc) {
		this.gcglabgc = gcglabgc;
	}

	public Gcglwqgz getGcglwqgz() {
		return gcglwqgz;
	}

	public void setGcglwqgz(Gcglwqgz gcglwqgz) {
		this.gcglwqgz = gcglwqgz;
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

	public String getNf() {
		return nf;
	}

	public void setNf(String nf) {
		this.nf = nf;
	}

	public String getYf() {
		return yf;
	}

	public void setYf(String yf) {
		this.yf = yf;
	}

	public String getXzqh() {
		return xzqh;
	}

	public void setXzqh(String xzqh) {
		this.xzqh = xzqh;
	}

	public String getXzdj() {
		return xzdj;
	}

	public void setXzdj(String xzdj) {
		this.xzdj = xzdj;
	}

	public String getLxmc() {
		return lxmc;
	}

	public void setLxmc(String lxmc) {
		this.lxmc = lxmc;
	}

	public String getGydw() {
		return gydw;
	}

	public void setGydw(String gydw) {
		this.gydw = gydw;
	}

	public String getTiaojian() {
		return tiaojian;
	}

	public void setTiaojian(String tiaojian) {
		this.tiaojian = tiaojian;
	}

	public void getWqgzybb(){		
		String shijian=nf+"-"+yf;
		String tiaojian1="";
		String tiaojian2="";
		String xzqhdm = "";
		String gydwdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = gydw;
		xzqhdm	= xzqh;
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		gcglwqgz.setSbyf(shijian);
		gcglwqgz.setGydw(tiaojian1);
		gcglwqgz.setLxmc(lxmc);
		gcglwqgz.setTiaojian(xzdj);
		gcglwqgz.setXzqhdm(tiaojian2);
		gcglwqgz.setXmnf(xmnf);
		gcglwqgz.setQlmc(xmmc);
		//查总合list
		try {
		List<Map<String,Object>> list1=gcybbServer.getwqgzbblist1(gcglwqgz);
		//按行政区划查询每个行政区划的合list
		List<Map<String,Object>> list2=gcybbServer.getwqgzbblist2(gcglwqgz);
		//按行政区划和年份查每个行政区划下每个年份的合
		List<Map<String,Object>> list3=gcybbServer.getwqgzbblist3(gcglwqgz);
		//查询所有列表
		List<Map<String,Object>> list4=gcybbServer.getwqgzbblist4(gcglwqgz);
		if(list2.size()>0)
		for (Map<String, Object> map : list2) {
			list1.add(map);
			if(list3.size()>0)
			for (Map<String, Object> map1 : list3) {
				if(map.get("XZQH").toString().equals(map1.get("XZQH").toString())){
					list1.add(map1);
					if(list4.size()>0)
					for (Map<String, Object> map2 : list4) {
						if(map.get("XZQH").toString().equals(map2.get("XZQH").toString())&&map1.get("XDNF").toString().equals(map2.get("XDNF").toString())){
							list1.add(map2);
						}
					}
				}
			}
		}
		
		if("flag".equals(flag)){
			List<Excel_list> elist=new ArrayList<Excel_list>();
			for (Map<String, Object> map : list1) {
				Excel_list l=new Excel_list();
				try {l.setV_0(map.get("QLMC").toString());} catch (Exception e) {l.setV_0("");}
				try {l.setV_1(map.get("QLDM").toString());} catch (Exception e) {l.setV_1("");}
				try {l.setV_2(map.get("QLZXZH").toString());} catch (Exception e) {l.setV_2("");}
				try {l.setV_3(map.get("LXBM").toString());} catch (Exception e) {l.setV_3("");}
				try {l.setV_4(map.get("LXMC").toString());} catch (Exception e) {l.setV_4("");}
				try {l.setV_5(map.get("JSDJ").toString());} catch (Exception e) {l.setV_5("");}
				try {l.setV_6(map.get("QLQC").toString());} catch (Exception e) {l.setV_6("");}
				try {l.setV_7(map.get("KJZC").toString());} catch (Exception e) {l.setV_7("");}
				try {l.setV_8(map.get("DKZDKJ").toString());} catch (Exception e) {l.setV_8("");}
				try {l.setV_9(map.get("QLQK").toString());} catch (Exception e) {l.setV_9("");}
				try {l.setV_10(map.get("SBJGXS").toString());} catch (Exception e) {l.setV_10("");}
				try {l.setV_11(map.get("DQ").toString());} catch (Exception e) {l.setV_11("");}
				try {l.setV_12(map.get("ZQ").toString());} catch (Exception e) {l.setV_12("");}
				try {l.setV_13(map.get("XJGJND").toString());} catch (Exception e) {l.setV_13("");}
				try {l.setV_14(map.get("SL").toString());} catch (Exception e) {l.setV_14("");}
				try {l.setV_15(map.get("WL").toString());} catch (Exception e) {l.setV_15("");}
				try {l.setV_16(map.get("BNHJ").toString());} catch (Exception e) {l.setV_16("");}
				try {l.setV_17(map.get("BNBTZ").toString());} catch (Exception e) {l.setV_17("");}
				try {l.setV_18(map.get("BNSTZ").toString());} catch (Exception e) {l.setV_18("");}
				try {l.setV_19(map.get("BYHJ").toString());} catch (Exception e) {l.setV_19("");}
				try {l.setV_20(map.get("BYBTZ").toString());} catch (Exception e) {l.setV_20("");}
				try {l.setV_21(map.get("BYSTZ").toString());} catch (Exception e) {l.setV_21("");}
				try {l.setV_22(map.get("YYHJ").toString());} catch (Exception e) {l.setV_22("");}
				try {l.setV_23(map.get("YYBTZ").toString());} catch (Exception e) {l.setV_23("");}
				try {l.setV_24(map.get("YYSTZ").toString());} catch (Exception e) {l.setV_24("");}
				try {l.setV_25(map.get("KGHJ").toString());} catch (Exception e) {l.setV_25("");}
				try {l.setV_26(map.get("KGBTZ").toString());} catch (Exception e) {l.setV_26("");}
				try {l.setV_27(map.get("KGSTZ").toString());} catch (Exception e) {l.setV_27("");}
				try {l.setV_28(map.get("YYJGQK").toString());} catch (Exception e) {l.setV_28("");}
				try {l.setV_29(map.get("YYGJQK").toString());} catch (Exception e) {l.setV_29("");}
				try {l.setV_30(map.get("YYCJQK").toString());} catch (Exception e) {l.setV_30("");}
				try {l.setV_31(map.get("ZJGQK").toString());} catch (Exception e) {l.setV_31("");}
				try {l.setV_32(map.get("ZGJQK").toString());} catch (Exception e) {l.setV_32("");}
				try {l.setV_33(map.get("ZCJQK").toString());} catch (Exception e) {l.setV_33("");}
				try {l.setV_34(map.get("JSXZ").toString());} catch (Exception e) {l.setV_34("");}
				try {l.setV_35(map.get("JHKGN").toString());} catch (Exception e) {l.setV_35("");}
				try {l.setV_36(map.get("JHWGN").toString());} catch (Exception e) {l.setV_36("");}
				try {l.setV_37(map.get("JSNR").toString());} catch (Exception e) {l.setV_37("");}
				elist.add(l);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("江西省公路路网结构改造工程统计月报表（一） 危桥工程");//设置第一行
			eldata.setSheetName("危桥改造月报表");//设置sheeet名
			eldata.setFileName("危桥改造月报表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("桥梁名称",1,3,0,0));
			et.add(new Excel_tilte("桥梁代码",1,3,1,1));
			et.add(new Excel_tilte("桥梁中心桩号",1,3,2,2));	
			et.add(new Excel_tilte("所属路线情况", 1, 1, 3, 5));
			et.add(new Excel_tilte("老桥梁基本状况", 1, 1, 6, 13));
			et.add(new Excel_tilte("评定等级", 1, 2, 14, 15));
			et.add(new Excel_tilte("本年计划投资(万元)", 1, 2, 16, 18));
			et.add(new Excel_tilte("本月完成投资（万元）", 1, 2, 19, 21));
			et.add(new Excel_tilte("自元月至本月完成投资（万元）", 1, 2, 22, 24));
			et.add(new Excel_tilte("开工至本月完成投资（万元）", 1, 2, 25, 27));
			et.add(new Excel_tilte("本年自元月至本月底形象进度完成情况", 1, 1, 28, 30));
			et.add(new Excel_tilte("开工至本月底形象进度完成情况", 1, 1, 31, 33));
			et.add(new Excel_tilte("建设性质", 1, 3, 34, 34));
			et.add(new Excel_tilte("建设年限", 1, 1, 35, 36));
			et.add(new Excel_tilte("主要建设内容", 1, 3, 37, 37));
			et.add(new Excel_tilte("路线编码", 2, 3, 3, 3));
			et.add(new Excel_tilte("路线名称", 2, 3, 4, 4));
			et.add(new Excel_tilte("技术等级", 2, 3, 5, 5));
			et.add(new Excel_tilte("桥梁全长(米)", 2, 3, 6, 6));
			et.add(new Excel_tilte("跨径总长(米)", 2, 3, 7, 7));
			et.add(new Excel_tilte("单跨最大跨径 (米)", 2, 3, 8, 8));
			et.add(new Excel_tilte("桥梁全宽", 2, 3, 9, 9));
			et.add(new Excel_tilte("主桥上部构造结构形式", 2, 3, 10, 10));
			et.add(new Excel_tilte("按跨径分类", 2, 2, 11, 12));
			et.add(new Excel_tilte("修建/改建年度", 2, 3, 13, 13));
			et.add(new Excel_tilte("危桥加固", 2, 2, 28, 28));
			et.add(new Excel_tilte("危桥改建", 2, 2, 29, 29));
			et.add(new Excel_tilte("危桥重建", 2, 2, 30, 30));
			et.add(new Excel_tilte("危桥加固", 2, 2, 31, 31));
			et.add(new Excel_tilte("危桥改建", 2, 2, 32, 32));
			et.add(new Excel_tilte("危桥重建", 2, 2, 33, 33));
			et.add(new Excel_tilte("计划开工年", 2, 3, 35, 35));
			et.add(new Excel_tilte("计划完工年", 2, 3, 36, 36));
			et.add(new Excel_tilte("大桥", 3, 3, 11, 11));
			et.add(new Excel_tilte("中桥", 3, 3, 12, 12));
			et.add(new Excel_tilte("四类", 3, 3, 14, 14));
			et.add(new Excel_tilte("五类", 3, 3, 15, 15));
			et.add(new Excel_tilte("合计", 3, 3, 16, 16));
			et.add(new Excel_tilte("部投资", 3, 3, 17, 17));
			et.add(new Excel_tilte("省投资", 3, 3, 18, 18));
			et.add(new Excel_tilte("合计", 3, 3, 19, 19));
			et.add(new Excel_tilte("部投资", 3, 3, 20, 20));
			et.add(new Excel_tilte("省投资", 3, 3, 21, 21));
			et.add(new Excel_tilte("合计", 3, 3, 22, 22));
			et.add(new Excel_tilte("部投资", 3, 3, 23, 23));
			et.add(new Excel_tilte("省投资", 3, 3, 24, 24));
			et.add(new Excel_tilte("合计", 3, 3, 25, 25));
			et.add(new Excel_tilte("部投资", 3, 3, 26, 26));
			et.add(new Excel_tilte("省投资", 3, 3, 27, 27));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 28, 28));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 29, 29));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 30, 30));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 31, 31));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 32, 32));
			et.add(new Excel_tilte("百分比（%）", 3, 3, 33, 33));
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export1(eldata,response);
		}else{
			if(list1.size()==1){
				JsonUtils.write(null, getresponse().getWriter());
			}
				JsonUtils.write(list1, getresponse().getWriter());
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 安保工程
	 */
	public void getAbgcybb(){
		String shijian=nf+"-"+yf;
		gcglabgc.setSbyf(shijian);
		String tiaojian1="";
		String tiaojian2="";
		String xzqhdm = "";
		String gydwdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = gydw;
		xzqhdm	= xzqh;
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		gcglabgc.setGydw(tiaojian1);
		gcglabgc.setLxmc(lxmc);
		gcglabgc.setTiaojian(xzdj);
		gcglabgc.setXzqhdm(tiaojian2);
		gcglabgc.setXmnf(xmnf);
		gcglabgc.setXmmc(xmmc);
		//查总合list
		try {
		List<Map<String,Object>> list1=gcybbServer.getabgcbblist1(gcglabgc);
		//按行政区划查询每个行政区划的合list
		List<Map<String,Object>> list2=gcybbServer.getabgcbblist2(gcglabgc);
		//按行政区划和年份查每个行政区划下每个年份的合
		List<Map<String,Object>> list3=gcybbServer.getabgcbblist3(gcglabgc);
		//查询所有列表
		List<Map<String,Object>> list4=gcybbServer.getabgcbblist4(gcglabgc);
		if(list2.size()>0)
		for (Map<String, Object> map : list2) {
			list1.add(map);
			if(list3.size()>0)
			for (Map<String, Object> map1 : list3) {
				if(map.get("XZQH").toString().equals(map1.get("XZQH").toString())){
					list1.add(map1);
					if(list4.size()>0)
					for (Map<String, Object> map2 : list4) {
						if(map.get("XZQH").toString().equals(map2.get("XZQH").toString())&&map1.get("XDNF").toString().equals(map2.get("XDNF").toString())){
							list1.add(map2);
						}
					}
				}
			}
		}
		if("flag".equals(flag)){
			List<Excel_list> elist=new ArrayList<Excel_list>();
			for (Map<String, Object> map : list1) {
				Excel_list l=new Excel_list();
				try {l.setV_0(map.get("LXBM").toString());} catch (Exception e) {l.setV_0("");}
				try {l.setV_1(map.get("LXMC").toString());} catch (Exception e) {l.setV_1("");}
				try {l.setV_2(map.get("QDZH").toString());} catch (Exception e) {l.setV_2("");}
				try {l.setV_3(map.get("ZDZH").toString());} catch (Exception e) {l.setV_3("");}
				try {l.setV_4(map.get("JSDJ").toString());} catch (Exception e) {l.setV_4("");}
				try {l.setV_5(map.get("XJGJND").toString());} catch (Exception e) {l.setV_5("");}
				try {l.setV_6(map.get("BNHJ").toString());} catch (Exception e) {l.setV_6("");}
				try {l.setV_7(map.get("BNBTZ").toString());} catch (Exception e) {l.setV_7("");}
				try {l.setV_8(map.get("BNSTZ").toString());} catch (Exception e) {l.setV_8("");}
				try {l.setV_9(map.get("YHLX").toString());} catch (Exception e) {l.setV_9("");}
				try {l.setV_10(map.get("JSXZ").toString());} catch (Exception e) {l.setV_10("");}
				try {l.setV_11(map.get("JHC").toString());} catch (Exception e) {l.setV_11("");}
				try {l.setV_12(map.get("JHGL").toString());} catch (Exception e) {l.setV_12("");}
				try {l.setV_13(map.get("JHKGN").toString());} catch (Exception e) {l.setV_13("");}
				try {l.setV_14(map.get("JHWGN").toString());} catch (Exception e) {l.setV_14("");}
				try {l.setV_15(map.get("BYWCC").toString());} catch (Exception e) {l.setV_15("");}
				try {l.setV_16(map.get("BYWCGL").toString());} catch (Exception e) {l.setV_16("");}
				try {l.setV_17(map.get("YYWCC").toString());} catch (Exception e) {l.setV_17("");}
				try {l.setV_18(map.get("YYWCGL").toString());} catch (Exception e) {l.setV_18("");}
				try {l.setV_19(map.get("KGWCC").toString());} catch (Exception e) {l.setV_19("");}
				try {l.setV_20(map.get("KGWCGL").toString());} catch (Exception e) {l.setV_20("");}
				try {l.setV_21(map.get("BYHJ").toString());} catch (Exception e) {l.setV_21("");}
				try {l.setV_22(map.get("BYBTZ").toString());} catch (Exception e) {l.setV_22("");}
				try {l.setV_23(map.get("BYSTZ").toString());} catch (Exception e) {l.setV_23("");}
				try {l.setV_24(map.get("YYHJ").toString());} catch (Exception e) {l.setV_24("");}
				try {l.setV_25(map.get("YYBTZ").toString());} catch (Exception e) {l.setV_25("");}
				try {l.setV_26(map.get("YYSTZ").toString());} catch (Exception e) {l.setV_26("");}
				try {l.setV_27(map.get("KGHJ").toString());} catch (Exception e) {l.setV_27("");}
				try {l.setV_28(map.get("KGBTZ").toString());} catch (Exception e) {l.setV_28("");}
				try {l.setV_29(map.get("KGSTZ").toString());} catch (Exception e) {l.setV_29("");}
				try {l.setV_30(map.get("JSNR").toString());} catch (Exception e) {l.setV_30("");}
				
				elist.add(l);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("江西省公路路网结构改造工程统计月报表（二）安保工程");//设置第一行
			eldata.setSheetName("安保工程月报表");//设置sheeet名
			eldata.setFileName("安保工程月报表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("路线编码",1,2,0,0));
			et.add(new Excel_tilte("路线名称",1,2,1,1));
			et.add(new Excel_tilte("基本情况",1,1,2,5));	
			et.add(new Excel_tilte("本年计划投资(万元)", 1, 1, 6, 8));
			et.add(new Excel_tilte("隐患类型", 1, 2, 9, 9));
			et.add(new Excel_tilte("建设类型", 1, 2, 10, 10));
			et.add(new Excel_tilte("计划处治隐患", 1, 1, 11, 12));
			et.add(new Excel_tilte("建设年限", 1, 1, 13, 14));
			et.add(new Excel_tilte("本月完成工程量", 1, 1, 15, 16));
			et.add(new Excel_tilte("自元月至本月底完成工程量", 1, 1, 17, 18));
			et.add(new Excel_tilte("开工至本月底累计完成工程量", 1, 1, 19, 20));
			et.add(new Excel_tilte("本月完成投资(万元)", 1, 1, 21, 23));
			et.add(new Excel_tilte("自元月至本月底完成投资（万元）", 1, 1, 24, 26));
			et.add(new Excel_tilte("开工至本月底累计完成投资(万元)", 1, 1, 27, 29));
			et.add(new Excel_tilte("主要建设内容", 1, 2, 30, 30));
			et.add(new Excel_tilte("起点桩号", 2, 2, 2, 2));
			et.add(new Excel_tilte("止点桩号", 2, 2, 3, 3));
			et.add(new Excel_tilte("技术等级", 2, 2, 4, 4));
			et.add(new Excel_tilte("公路修建/改建年度", 2, 2, 5, 5));
			et.add(new Excel_tilte("合计", 2, 2, 6, 6));
			et.add(new Excel_tilte("部投资", 2, 2, 7, 7));
			et.add(new Excel_tilte("省投资", 2, 2, 8, 8));
			et.add(new Excel_tilte("处", 2, 2, 11, 11));
			et.add(new Excel_tilte("公里", 2, 2, 12, 12));
			et.add(new Excel_tilte("计划开工年", 2, 2, 13, 13));
			et.add(new Excel_tilte("计划完工年", 2, 2, 14, 14));
			et.add(new Excel_tilte("处", 2, 2, 15, 15));
			et.add(new Excel_tilte("公里", 2, 2, 16, 16));
			et.add(new Excel_tilte("处", 2, 2, 17, 17));
			et.add(new Excel_tilte("公里", 2, 2, 18, 18));
			et.add(new Excel_tilte("处", 2, 2, 19, 19));
			et.add(new Excel_tilte("公里", 2, 2, 20, 20));
			et.add(new Excel_tilte("总投资", 2, 2, 21, 21));
			et.add(new Excel_tilte("部投资", 2, 2, 22, 22));
			et.add(new Excel_tilte("省投资", 2, 2, 23, 23));
			et.add(new Excel_tilte("总投资", 2, 2, 24, 24));
			et.add(new Excel_tilte("部投资", 2, 2, 25, 25));
			et.add(new Excel_tilte("省投资", 2, 2, 26, 26));
			et.add(new Excel_tilte("总投资", 2, 2, 27, 27));
			et.add(new Excel_tilte("部投资", 2, 2, 28, 28));
			et.add(new Excel_tilte("省投资", 2, 2, 29, 29));
			
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export1(eldata,response);
			
		}else{
			if(list1.size()==1){
				JsonUtils.write(null, getresponse().getWriter());
			}else
			JsonUtils.write(list1, getresponse().getWriter());
		}                                                                          
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 灾害
	 */
	public void getZhfzybb(){
		String shijian=nf+"-"+yf;
		gcglzhfz.setSbyf(shijian);
		String tiaojian1="";
		String tiaojian2="";
		String xzqhdm = "";
		String gydwdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = gydw;
		xzqhdm	= xzqh;
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		gcglzhfz.setGydw(tiaojian1);
		gcglzhfz.setLxmc(lxmc);
		gcglzhfz.setTiaojian(xzdj);
		gcglzhfz.setXzqhdm(tiaojian2);
		gcglzhfz.setXmnf(xmnf);
		gcglzhfz.setXmmc(xmmc);
		//查总合list
		try {
		List<Map<String,Object>> list1=gcybbServer.getzhfzbblist1(gcglzhfz);
		//按行政区划查询每个行政区划的合list
		List<Map<String,Object>> list2=gcybbServer.getzhfzbblist2(gcglzhfz);
		//按行政区划和年份查每个行政区划下每个年份的合
		List<Map<String,Object>> list3=gcybbServer.getzhfzbblist3(gcglzhfz);
		//查询所有列表
		List<Map<String,Object>> list4=gcybbServer.getzhfzbblist4(gcglzhfz);
		if(list2.size()>0)
		for (Map<String, Object> map : list2) {
			list1.add(map);
			if(list3.size()>0)
			for (Map<String, Object> map1 : list3) {
				if(map.get("XZQH").toString().equals(map1.get("XZQH").toString())){
					list1.add(map1);
					if(list4.size()>0)
					for (Map<String, Object> map2 : list4) {
						if(map.get("XZQH").toString().equals(map2.get("XZQH").toString())&&map1.get("XDNF").toString().equals(map2.get("XDNF").toString())){
							list1.add(map2);
						}
					}
				}
			}
		}
		if("flag".equals(flag)){
			List<Excel_list> elist=new ArrayList<Excel_list>();
			for (Map<String, Object> map : list1) {
				Excel_list l=new Excel_list();
				try {l.setV_0(map.get("LXBM").toString());} catch (Exception e) {l.setV_0("");}
				try {l.setV_1(map.get("LXMC").toString());} catch (Exception e) {l.setV_1("");}
				try {l.setV_2(map.get("QDZH").toString());} catch (Exception e) {l.setV_2("");}
				try {l.setV_3(map.get("ZDZH").toString());} catch (Exception e) {l.setV_3("");}
				try {l.setV_4(map.get("JSDJ").toString());} catch (Exception e) {l.setV_4("");}
				try {l.setV_5(map.get("XJGJND").toString());} catch (Exception e) {l.setV_5("");}
				try {l.setV_6(map.get("BNHJ").toString());} catch (Exception e) {l.setV_6("");}
				try {l.setV_7(map.get("BNBTZ").toString());} catch (Exception e) {l.setV_7("");}
				try {l.setV_8(map.get("BNSTZ").toString());} catch (Exception e) {l.setV_8("");}
				try {l.setV_9(map.get("BYWCGL").toString());} catch (Exception e) {l.setV_9("");}
				try {l.setV_10(map.get("YYWCGL").toString());} catch (Exception e) {l.setV_10("");}
				try {l.setV_11(map.get("KGWCGL").toString());} catch (Exception e) {l.setV_11("");}
				try {l.setV_12(map.get("BYHJ").toString());} catch (Exception e) {l.setV_12("");}
				try {l.setV_13(map.get("BYBTZ").toString());} catch (Exception e) {l.setV_13("");}
				try {l.setV_14(map.get("BYSTZ").toString());} catch (Exception e) {l.setV_14("");}
				try {l.setV_15(map.get("YYHJ").toString());} catch (Exception e) {l.setV_15("");}
				try {l.setV_16(map.get("YYBTZ").toString());} catch (Exception e) {l.setV_16("");}
				try {l.setV_17(map.get("YYSTZ").toString());} catch (Exception e) {l.setV_17("");}
				try {l.setV_18(map.get("KGHJ").toString());} catch (Exception e) {l.setV_18("");}
				try {l.setV_19(map.get("KGBTZ").toString());} catch (Exception e) {l.setV_19("");}
				try {l.setV_20(map.get("KGSTZ").toString());} catch (Exception e) {l.setV_20("");}
				try {l.setV_21(map.get("JSNR").toString());} catch (Exception e) {l.setV_21("");}
				elist.add(l);
			}
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("江西省公路路网结构改造工程统计月报表（三） 灾害防治");//设置第一行
			eldata.setSheetName("灾害防治月报表");//设置sheeet名
			eldata.setFileName("灾害防治月报表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("路线编码",1,2,0,0));
			et.add(new Excel_tilte("路线名称",1,2,1,1));
			et.add(new Excel_tilte("基本情况",1,1,2,5));	
			et.add(new Excel_tilte("计划投资(万元)", 1, 1, 6, 8));
			et.add(new Excel_tilte("本月完成工程量（公里）", 1, 2, 9, 9));
			et.add(new Excel_tilte("自元月至本月底完成工程量（公里）", 1, 2, 10, 10));
			et.add(new Excel_tilte("开工至本月底完成工程量（公里）", 1, 2, 11, 11));
			et.add(new Excel_tilte("本月完成投资(万元)", 1, 1, 12, 14));
			et.add(new Excel_tilte("自元月至本月底完成投资（万元）", 1, 1, 15, 17));
			et.add(new Excel_tilte("开工至本月底累计完成投资(万元)", 1, 1, 18, 20));
			et.add(new Excel_tilte("主要建设内容", 1, 2, 21, 21));
			et.add(new Excel_tilte("起点桩号", 2, 2, 2, 2));
			et.add(new Excel_tilte("止点桩号", 2, 2, 3, 3));
			et.add(new Excel_tilte("技术等级", 2, 2, 4, 4));
			et.add(new Excel_tilte("公路修建/改建年度", 2, 2, 5, 5));
			et.add(new Excel_tilte("总投资", 2, 2, 6, 6));
			et.add(new Excel_tilte("部投资", 2, 2, 7, 7));
			et.add(new Excel_tilte("省投资", 2, 2, 8, 8));
			et.add(new Excel_tilte("总投资", 2, 2, 12, 12));
			et.add(new Excel_tilte("部投资", 2, 2, 13, 13));
			et.add(new Excel_tilte("省投资", 2, 2, 14, 14));
			et.add(new Excel_tilte("总投资", 2, 2, 15, 15));
			et.add(new Excel_tilte("部投资", 2, 2, 16, 16));
			et.add(new Excel_tilte("省投资", 2, 2, 17, 17));
			et.add(new Excel_tilte("总投资", 2, 2, 18, 18));
			et.add(new Excel_tilte("部投资", 2, 2, 19, 19));
			et.add(new Excel_tilte("省投资", 2, 2, 20, 20));			
			
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export1(eldata,response);
			
		}else{
			if(list1.size()==1){
				JsonUtils.write(null, getresponse().getWriter());
			}else
				JsonUtils.write(list1, getresponse().getWriter());
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void exportZhfzyb(){
		List<Excel_list> exl = new ArrayList<Excel_list>();
		List<Excel_list> exl1 = new ArrayList<Excel_list>();
		String shijian=nf+"-"+yf;
		gcglzhfz.setSbyf(shijian);
		if("36".equals(gydw)){
			gcglzhfz.setGydw("");
		}
		else gcglzhfz.setGydw(gydw.replaceAll("0*$",""));
		gcglzhfz.setLxmc(lxmc);
		gcglzhfz.setTiaojian(xzdj);
		gcglzhfz.setXzqhdm(xzqh.replaceAll("0*$",""));
		//List<Map<String, Object>> lsit=gcybbServer.getzhfzybb(gcglzhfz);
		Excel_list e1=gcybbServer.getzhfzlist1(gcglzhfz);
		if(e1!=null){
			e1.setV_0("总计");
			exl.add(e1);
		}
		int maxnian=0;
		int minnian=Integer.parseInt(nf);
		List<Map<String, Object>> lsit1=gcybbServer.getZhfzxzqh(gcglzhfz);//查行政区划
		if(lsit1.size()!=0)
		for (Map<String, Object> map : lsit1) {
			gcglzhfz.setXzqhmc(map.get("XZQHDM").toString());
			Excel_list e3=gcybbServer.getzhfzlist1(gcglzhfz);
			if(e3!=null){
				if("景德镇".equals(map.get("XZQHMC").toString())){
					e3.setV_0(map.get("XZQHMC").toString()+"市");
				}
				else e3.setV_0(map.get("XZQHMC").toString());
				exl1.add(e3);
			}
			List<Map<String, Object>> lsit2=gcybbServer.getZhfznf(gcglzhfz);//查年份
			if(lsit2.size()!=0)
			for (Map<String, Object> map2 : lsit2) {
				if(maxnian<Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					maxnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				if(minnian>Integer.parseInt(map2.get("XMNF").toString().substring(0,4))){
					minnian=Integer.parseInt(map2.get("XMNF").toString().substring(0,4));
				}
				gcglzhfz.setXmnf(map2.get("XMNF").toString());
				Excel_list e2=gcybbServer.getzhfzlist1(gcglzhfz);
				e2.setV_0(map2.get("XMNF").toString()+"项目");
				if(e2!=null)
				exl1.add(e2);
				List<Excel_list> exl2=gcybbServer.getzhfzlist2(gcglzhfz);
				if(exl2.size()!=0)
				exl1.addAll(exl2);
			}
		}
		for (int i = minnian; i <= maxnian; i++) {
			gcglzhfz.setXzqhmc("");
			gcglzhfz.setXmnf(i+"年");
			Excel_list e2=gcybbServer.getzhfzlist1(gcglzhfz);
			if(e2!=null){
				e2.setV_0(i+"年项目");
				exl.add(e2);
			}
		}
		exl.addAll(exl1);
		ExcelData eldata=new ExcelData();//创建一个类
		eldata.setTitleName("江西省"+nf+"年公路路网结构改造工程统计月报表（三） 灾害防治（"+yf+"月）");//设置第一行
		eldata.setSheetName("统计月报表");//设置sheeet名
		eldata.setFileName("江西省"+nf+"年"+yf+"月公路路网结构改造工程统计月报表（三）");//设置文件名
		eldata.setEl(exl);//将实体list放入类中
		List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
		et.add(new Excel_tilte("路线编码",1,2,0,0));
		et.add(new Excel_tilte("路线名称",1,2,1,1));
		et.add(new Excel_tilte("基本情况",1,1,2,5));	
		et.add(new Excel_tilte("计划投资(万元)", 1, 1, 6, 8));
		et.add(new Excel_tilte("本月完成工程量（公里）", 1, 2, 9, 9));
		et.add(new Excel_tilte("自元月至本月底完成工程量（公里）", 1, 2, 10, 10));
		et.add(new Excel_tilte("开工至本月底完成工程量（公里）", 1, 2, 11, 11));
		et.add(new Excel_tilte("本月完成投资(万元)", 1, 1, 12, 14));
		et.add(new Excel_tilte("自元月至本月底完成投资（万元）", 1, 1, 15, 17));
		et.add(new Excel_tilte("开工至本月底累计完成投资(万元)", 1, 1, 18, 20));
		et.add(new Excel_tilte("主要建设内容", 1, 2, 21, 21));
		et.add(new Excel_tilte("起点桩号", 2, 2, 2, 2));
		et.add(new Excel_tilte("止点桩号", 2, 2, 3, 3));
		et.add(new Excel_tilte("技术等级", 2, 2, 4, 4));
		et.add(new Excel_tilte("公路修建/改建年度", 2, 2, 5, 5));
		et.add(new Excel_tilte("总投资", 2, 2, 6, 6));
		et.add(new Excel_tilte("部投资", 2, 2, 7, 7));
		et.add(new Excel_tilte("省投资", 2, 2, 8, 8));
		et.add(new Excel_tilte("总投资", 2, 2, 12, 12));
		et.add(new Excel_tilte("部投资", 2, 2, 13, 13));
		et.add(new Excel_tilte("省投资", 2, 2, 14, 14));
		et.add(new Excel_tilte("总投资", 2, 2, 15, 15));
		et.add(new Excel_tilte("部投资", 2, 2, 16, 16));
		et.add(new Excel_tilte("省投资", 2, 2, 17, 17));
		et.add(new Excel_tilte("总投资", 2, 2, 18, 18));
		et.add(new Excel_tilte("部投资", 2, 2, 19, 19));
		et.add(new Excel_tilte("省投资", 2, 2, 20, 20));		
		
		eldata.setEt(et);//将表头内容设置到类里面
		HttpServletResponse response= getresponse();//获得一个HttpServletResponse
		try {
			Excel_export.excel_export1(eldata,response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//将类和参数HttpServletResponse传入即可实现导出excel
	}
	
	public void getWqlntjb(){
		try{
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		String tableName="wq_lntjb";
		String[] arr=gcglwqgz.getXmnf().split(",");
		String sql="select xzqhmc";
		String in="";
		for(int j=0;j<arr.length;j++){
			if(j==0)
			    in=in+"'"+arr[j]+"'";
			else
				in=in+",'"+arr[j]+"'";
			sql=sql+",decode(sum(decode(jhnf,'"+arr[j]+"',xmsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',xmsl)) )xmsl"+arr[j]+
					",decode(sum(decode(jhnf,'"+arr[j]+"',ym)),null,0,sum(decode(jhnf,'"+arr[j]+"',ym))) ym"+arr[j]+
		        ",decode(sum(decode(jhnf,'"+arr[j]+"',dw)),null,0,sum(decode(jhnf,'"+arr[j]+"',dw))) dw"+arr[j]+
		        ",decode(sum(decode(jhnf,'"+arr[j]+"',wc)),null,0,sum(decode(jhnf,'"+arr[j]+"',wc))) wc"+arr[j]+"";
		}
		sql=sql+" from "+tableName+"  where jhnf in("+in+")group by xzqhmc,xzqh order by xzqh";		
		System.out.println(sql);
		list=gcybbServer.getGjxjmxbsj(sql);
		for(int i=0;i<list.size();i++){
			HashMap<String,Object> hm=(HashMap<String, Object>) list.get(i);
			double xmsl=0;
			double ym=0;
			double dw=0;
			double wc=0;
			for(int j=arr.length-1;j>=0;j--){
				xmsl=xmsl+Double.valueOf(hm.get("XMSL"+arr[j]).toString());
				ym=ym+Double.valueOf(hm.get("YM"+arr[j]).toString());
				dw=dw+Double.valueOf(hm.get("DW"+arr[j]).toString());
				wc=wc+Double.valueOf(hm.get("WC"+arr[j]).toString());
			}
		   hm.put("XMSL",xmsl);
		   hm.put("YM",ym);
		   hm.put("DW",dw);
		   hm.put("WC",wc);
		   hm.put("XH", i);
		}
		if("flag".equals(flag)){
			String[] nf = gcglwqgz.getXmnf().split(",");
			Arrays.sort(nf);
			List<Excel_list> elist=new ArrayList<Excel_list>();
			int cd=(nf.length+1)*6+3;
			NumberFormat nfs = NumberFormat.getInstance(); 
	        nfs.setRoundingMode(RoundingMode.HALF_UP);//设置四舍五入 
	        nfs.setMinimumFractionDigits(2);//设置最小保留几位小数 
	        nfs.setMaximumFractionDigits(2);//设置最大保留几位小数
			for(int i=0;i<list.size();i++){
				Excel_list l = new Excel_list();
				Class cl = l.getClass();
				if("0".equals(list.get(i).get("XH").toString())){
					Method method = cl.getMethod("setV_"+0, new Class[]{String.class});
					method.invoke(l, new Object[]{list.get(i).get("XZQHMC").toString()});
				}else{
					Method method = cl.getMethod("setV_"+0, new Class[]{String.class});
					method.invoke(l, new Object[]{list.get(i).get("XH").toString()});
				}
				
				Method method1 = cl.getMethod("setV_"+1, new Class[]{String.class});
				method1.invoke(l, new Object[]{list.get(i).get("XZQHMC").toString()});
				Method method3 = cl.getMethod("setV_"+2, new Class[]{String.class});
				method3.invoke(l, new Object[]{list.get(i).get("XMSL").toString().substring(0, list.get(i).get("XMSL").toString().length()-2)});
				Method method4 = cl.getMethod("setV_"+3, new Class[]{String.class});
				method4.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("YM").toString()))});
				Method method5 = cl.getMethod("setV_"+4, new Class[]{String.class});
				method5.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("DW").toString()))});
				Method method6 = cl.getMethod("setV_"+5, new Class[]{String.class});
				method6.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WC").toString()))});
				int k=6;
				for (int j = 0; j < nf.length; j++) {
					Method method9 = cl.getMethod("setV_"+k, new Class[]{String.class});
					method9.invoke(l, new Object[]{list.get(i).get("XMSL"+nf[j]).toString()});
					Method method10 = cl.getMethod("setV_"+(k+1), new Class[]{String.class});
					method10.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("YM"+nf[j]).toString()))});
					Method method11 = cl.getMethod("setV_"+(k+2), new Class[]{String.class});
					method11.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("DW"+nf[j]).toString()))});
					Method method12 = cl.getMethod("setV_"+(k+3), new Class[]{String.class});
					method12.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WC"+nf[j]).toString()))});
					k+=4;
				}
				Method method15 = cl.getMethod("setV_"+cd, new Class[]{String.class});
				method15.invoke(l, new Object[]{""});
				elist.add(l);
			}
			elist=qddh(elist);
			//把数据放入elist
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("危桥改造项目(交通局)历年统计报表");//设置第一行 
			eldata.setSheetName("历年统计报表");//设置sheeet名
			eldata.setFileName("危桥改造项目(交通局)历年统计报表");//设置文件名
			eldata.setEl(elist);//将实体list放入类中
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			et.add(new Excel_tilte("序号",1,3,0,0));
			et.add(new Excel_tilte("设区市",1,3,1,1));
			et.add(new Excel_tilte("计划下达及完成情况",1,1,2,5));
			int sj1=6;
			for (int i = 0; i < nf.length; i++) {
				et.add(new Excel_tilte("计划下达及完成情况",1,1,sj1,sj1+3));
				sj1=sj1+4;
			}
			et.add(new Excel_tilte("备注",1,3,sj1,sj1));
			et.add(new Excel_tilte(nf[0]+"-"+nf[nf.length-1]+"年度",2,2,2,3));
			et.add(new Excel_tilte("到位资金(万元)",2,3,4,4));
			et.add(new Excel_tilte("完成资金(万元)",2,3,5,5));
			int sj2=6;
			for (int i = 0; i < nf.length; i++) {
				et.add(new Excel_tilte(nf[i]+"年度",2,2,sj2,sj2+1));
				et.add(new Excel_tilte("到位资金(万元)",2,3,sj2+2,sj2+2));
				et.add(new Excel_tilte("完成资金(万元)",2,3,sj2+3,sj2+3));
				sj2=sj2+4;
			}
			et.add(new Excel_tilte("桥梁数量(座)",3,3,2,2));
			et.add(new Excel_tilte("延米(米)",3,3,3,3));
			
			int sj3=6;
			for (int i = 0; i < nf.length; i++) {
				et.add(new Excel_tilte("桥梁数量(座)",3,3,sj3,sj3));
				et.add(new Excel_tilte("延米(米)",3,3,sj3+1,sj3+1));
				sj3=sj3+4;
			}
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_exportmxb(eldata,response);
			
		}else{
			JsonUtils.write(list, getresponse().getWriter());
		}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//
	public void getWqgzhzb(){
		try{
			List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
			String tableName="wqgzhzb";
			String[] arr=gcglwqgz.getXmnf().split(",");
			String viewsql="create or replace view wqgzhzb as "
					+"select tb1.xzqh,tb1.xzqhmc,tb1.jhnf,tb1.xmsl,tb1.ym,nvl(tb2.wcxmsl,0) wcxmsl,nvl(tb2.wcym,0) wcym,nvl(tb1.wc,0) wc,nvl(tb1.wc,0) bnwc,nvl(decode(tb1.xmsl,0,0,round(to_number(tb2.wcxmsl)/to_number(tb1.xmsl)*100,0)),0) wcl,nvl(tb3.zjxmsl,0) zjxmsl,nvl(tb4.wkxmsl,0) wkxmsl, nvl(tb3.zjym,0) zjym,nvl(tb4.wkym,0) wkym from (select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) xmsl,sum(ym) ym,sum(dw) dw,sum(wc) wc from (select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from (select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,substr(xm.xzqhdm,1,4) xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where (xm.tsdq != '省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb1,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) wcxmsl,sum(ym) wcym from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,substr(xm.xzqhdm,1,4) xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where pl.jgzt='1'and pl.kgzt='1' and (xm.tsdq != '省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb2,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) zjxmsl,sum(ym) zjym from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,substr(xm.xzqhdm,1,4) xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where pl.jgzt='0' and pl.kgzt='1' and (xm.tsdq != '省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb3,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) wkxmsl,sum(ym) wkym from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,substr(xm.xzqhdm,1,4) xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where pl.kgzt='0' and (xm.tsdq != '省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb4 where tb1.xzqh=tb2.xzqh(+) and tb1.jhnf=tb2.jhnf(+) and tb1.xzqh=tb3.xzqh(+) and tb1.jhnf=tb3.jhnf(+) and tb1.xzqh=tb4.xzqh(+) and tb1.jhnf=tb4.jhnf(+) union all select '9'||tb1.xzqh xzqh,tb1.xzqhmc,tb1.jhnf,tb1.xmsl,tb1.ym,nvl(tb2.wcxmsl,0) wcxmsl,nvl(tb2.wcym,0) wcym,nvl(tb1.wc,0) wc,nvl(tb1.wc,0) bnwc,nvl(decode(tb1.xmsl,0,0,round(to_number(tb2.wcxmsl)/to_number(tb1.xmsl)*100,0)),0) wcl,nvl(tb3.zjxmsl,0) zjxmsl,nvl(tb4.wkxmsl,0) wkxmsl, nvl(tb3.zjym,0) zjym,nvl(tb4.wkym,0) wkym from (select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) xmsl,sum(ym) ym,sum(dw) dw,sum(wc) wc from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,xm.xzqhdm xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where xm.tsdq = '省直管试点县' and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb1,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) wcxmsl,sum(ym) wcym from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,xm.xzqhdm xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where pl.jgzt='1'and pl.kgzt='1' and xm.tsdq = '省直管试点县' and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb2,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) zjxmsl,sum(ym) zjym from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,xm.xzqhdm xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where pl.jgzt='0' and pl.kgzt='1' and xm.tsdq = '省直管试点县' and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb3,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) wkxmsl,sum(ym) wkym from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,xm.xzqhdm xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where pl.kgzt='0' and xm.tsdq = '省直管试点县' and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb4 where tb1.xzqh=tb2.xzqh(+) and tb1.jhnf=tb2.jhnf(+) and tb1.xzqh=tb3.xzqh(+) and tb1.jhnf=tb3.jhnf(+) and tb1.xzqh=tb4.xzqh(+) and tb1.jhnf=tb4.jhnf(+) union all select '36' xzqh,'全省汇总' xzqhmc,tb.jhnf,sum(tb.xmsl) xmsl,sum(tb.ym) ym,sum(tb.wcxmsl) wcxmsl,sum(tb.wcym) ym,sum(tb.wc) wc,sum(tb.bnwc) bnwc,decode(sum(tb.xmsl),0,0,round(to_number(sum(tb.wcxmsl))/to_number(sum(tb.xmsl))*100,0)) wcl,sum(zjxmsl),sum(wkxmsl),sum(zjym),sum(wkym) from(select tb1.xzqh,tb1.xzqhmc,tb1.jhnf,tb1.xmsl,tb1.ym,nvl(tb2.wcxmsl,0) wcxmsl,nvl(tb2.wcym,0) wcym,nvl(tb1.wc,0) wc,nvl(tb1.wc,0) bnwc,nvl(decode(tb1.xmsl,0,0,round(to_number(tb2.wcxmsl)/to_number(tb1.xmsl)*100,0)),0) wcl,nvl(tb3.zjxmsl,0) zjxmsl,nvl(tb4.wkxmsl,0) wkxmsl, nvl(tb3.zjym,0) zjym,nvl(tb4.wkym,0) wkym from (select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) xmsl,sum(ym) ym,sum(dw) dw,sum(wc) wc from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,substr(xm.xzqhdm,1,4) xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm  on sc.xmkid=xm.id where xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb1,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) wcxmsl,sum(ym) wcym from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,substr(xm.xzqhdm,1,4) xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where pl.jgzt='1'and pl.kgzt='1' and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb2,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) zjxmsl,sum(ym) zjym from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,substr(xm.xzqhdm,1,4) xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where pl.jgzt='0' and pl.kgzt='1' and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb3,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,count(*) wkxmsl,sum(ym) wkym from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.sbnf jhnf,sc.scqlqc ym,substr(xm.xzqhdm,1,4) xzqh from plan_wqgz pl left join sck_wqgz sc on pl.sckid=sc.sckid left join xmk_wqgz xm on sc.xmkid=xm.id where pl.kgzt='0' and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_wqgz gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm(+) and t1.xmbm=t3.xmbm(+)) t group by t.xzqh,xzqhmc,t.jhnf) tb4 where tb1.xzqh=tb2.xzqh(+) and tb1.jhnf=tb2.jhnf(+) and tb1.xzqh=tb3.xzqh(+) and tb1.jhnf=tb3.jhnf(+) and tb1.xzqh=tb4.xzqh(+) and tb1.jhnf=tb4.jhnf(+)) tb group by jhnf order by xzqh,jhnf";
			gcybbServer.createybView(viewsql);
			String sql="select xzqhmc";
			String in="";
			for(int j=0;j<arr.length;j++){
				if(j==0)
				    in=in+"'"+arr[j]+"'";
				else
					in=in+",'"+arr[j]+"'";
				sql=sql+",decode(sum(decode(jhnf,'"+arr[j]+"',xmsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',xmsl))) xmsl"+arr[j]+
						",decode(sum(decode(jhnf,'"+arr[j]+"',ym)),null,0,sum(decode(jhnf,'"+arr[j]+"',ym))) ym"+arr[j]+
						",decode(sum(decode(jhnf,'"+arr[j]+"',wcxmsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',wcxmsl))) wcxmsl"+arr[j]+
						",decode(sum(decode(jhnf,'"+arr[j]+"',zjxmsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',zjxmsl))) zjxmsl"+arr[j]+
						",decode(sum(decode(jhnf,'"+arr[j]+"',wkxmsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',wkxmsl))) wkxmsl"+arr[j]+
						",decode(sum(decode(jhnf,'"+arr[j]+"',wcym)),null,0,sum(decode(jhnf,'"+arr[j]+"',wcym))) wcym"+arr[j]+
						",decode(sum(decode(jhnf,'"+arr[j]+"',zjym)),null,0,sum(decode(jhnf,'"+arr[j]+"',zjym))) zjym"+arr[j]+
						",decode(sum(decode(jhnf,'"+arr[j]+"',wkym)),null,0,sum(decode(jhnf,'"+arr[j]+"',wkym))) wkym"+arr[j]+
						",decode(sum(decode(jhnf,'"+arr[j]+"',wc)),null,0,sum(decode(jhnf,'"+arr[j]+"',wc))) wc"+arr[j]+
			        ",decode(sum(decode(jhnf,'"+arr[j]+"',bnwc)),null,0,sum(decode(jhnf,'"+arr[j]+"',bnwc))) bnwc"+arr[j]+""+
			        ",decode(sum(decode(jhnf,'"+arr[j]+"',wcl)),null,0,sum(decode(jhnf,'"+arr[j]+"',wcl))) wcl"+arr[j]+"";
			}
			sql=sql+" from "+tableName+"  where jhnf in("+in+")group by xzqhmc,xzqh order by xzqh";		
			System.out.println(sql);
			list=gcybbServer.getGjxjmxbsj(sql);
			
			for(int i=0;i<list.size();i++){
				HashMap<String,Object> hm=(HashMap<String, Object>) list.get(i);
				double xmsl=0;
				double ym=0;
				double wcxmsl=0;
				double zjxmsl=0;
				double wkxmsl=0;
				double wcym=0;
				double zjym=0;
				double wkym=0;
				double wc=0;
				double bnwc=0;
				String wcl="";
				for(int j=arr.length-1;j>=0;j--){
					xmsl=xmsl+Double.valueOf(hm.get("XMSL"+arr[j]).toString());
					ym=ym+Double.valueOf(hm.get("YM"+arr[j]).toString());
					wcxmsl=wcxmsl+Double.valueOf(hm.get("WCXMSL"+arr[j]).toString());
					zjxmsl=wcxmsl+Double.valueOf(hm.get("ZJXMSL"+arr[j]).toString());
					wkxmsl=wcxmsl+Double.valueOf(hm.get("WKXMSL"+arr[j]).toString());
					wcym=wcym+Double.valueOf(hm.get("WCYM"+arr[j]).toString());
					zjym=wcym+Double.valueOf(hm.get("ZJYM"+arr[j]).toString());
					wkym=wcym+Double.valueOf(hm.get("WKYM"+arr[j]).toString());
					wc=wc+Double.valueOf(hm.get("WC"+arr[j]).toString());
					bnwc=bnwc+Double.valueOf(hm.get("BNWC"+arr[j]).toString());
					if((Double.valueOf(hm.get("XMSL"+arr[j]).toString()))!=0.0||(Double.valueOf(hm.get("XMSL"+arr[j]).toString()))!=0)
						 hm.put("WCL"+arr[j],(int)((Double.valueOf(hm.get("WCXMSL"+arr[j]).toString())/Double.valueOf(hm.get("XMSL"+arr[j]).toString()))*100)+"");
				}
				System.out.println("项目数量"+xmsl+"完成个数"+wcxmsl);
				if(((int)xmsl)!=0){
					wcl=(int)((wcxmsl/xmsl)*100)+""; 
				}else{
					wcl="0";
				}
			   hm.put("WCL",wcl);
			   hm.put("XMSL",xmsl);
			   hm.put("YM",ym);
			   hm.put("WCXMSL",wcxmsl);
			   hm.put("ZJXMSL",zjxmsl);
			   hm.put("WKXMSL",wkxmsl);
			   hm.put("WCYM",wcym);
			   hm.put("ZJYM",zjym);
			   hm.put("WKYM",wkym);
			   hm.put("WC",wc);
			   hm.put("BNWC",wc);
			}
			if("flag".equals(flag)){
				String[] nf = gcglwqgz.getXmnf().split(",");
				Arrays.sort(nf);
				List<Excel_list> elist=new ArrayList<Excel_list>();
				int cd=(nf.length+1)*6+3;
				NumberFormat nfs = NumberFormat.getInstance(); 
		        nfs.setRoundingMode(RoundingMode.HALF_UP);//设置四舍五入 
		        nfs.setMinimumFractionDigits(2);//设置最小保留几位小数 
		        nfs.setMaximumFractionDigits(2);//设置最大保留几位小数
				for(int i=0;i<list.size();i++){
					Excel_list l = new Excel_list();
					Class cl = l.getClass();
					Method method = cl.getMethod("setV_"+0, new Class[]{String.class});
					method.invoke(l, new Object[]{list.get(i).get("XZQHMC").toString()});
					Method method1 = cl.getMethod("setV_"+1, new Class[]{String.class});
					method1.invoke(l, new Object[]{list.get(i).get("XMSL").toString()});
					Method method2 = cl.getMethod("setV_"+2, new Class[]{String.class});
					method2.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("YM").toString()))});
					Method method3 = cl.getMethod("setV_"+3, new Class[]{String.class});
					method3.invoke(l, new Object[]{list.get(i).get("WCXMSL").toString()});
					Method method4 = cl.getMethod("setV_"+4, new Class[]{String.class});
					method4.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCYM").toString()))});
					Method method5 = cl.getMethod("setV_"+5, new Class[]{String.class});
					method5.invoke(l, new Object[]{list.get(i).get("ZJXMSL").toString()});
					Method method6 = cl.getMethod("setV_"+6, new Class[]{String.class});
					method6.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("ZJYM").toString()))});
					Method method7 = cl.getMethod("setV_"+7, new Class[]{String.class});
					method7.invoke(l, new Object[]{list.get(i).get("WKXMSL").toString()});
					Method method8 = cl.getMethod("setV_"+8, new Class[]{String.class});
					method8.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WKYM").toString()))});
					Method method9 = cl.getMethod("setV_"+9, new Class[]{String.class});
					method9.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WC").toString()))});
					Method method10 = cl.getMethod("setV_"+10, new Class[]{String.class});
					method10.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("BNWC").toString()))});
					Method method11 = cl.getMethod("setV_"+11, new Class[]{String.class});
					method11.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCL").toString()))});
					int k=12;
					for (int j = 0; j < nf.length; j++) {
						Method method12 = cl.getMethod("setV_"+k, new Class[]{String.class});
						method12.invoke(l, new Object[]{list.get(i).get("XMSL"+nf[j]).toString()});
						Method method13 = cl.getMethod("setV_"+(k+1), new Class[]{String.class});
						method13.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("YM"+nf[j]).toString()))});
						Method method14 = cl.getMethod("setV_"+(k+2), new Class[]{String.class});
						method14.invoke(l, new Object[]{list.get(i).get("WCXMSL"+nf[j]).toString()});
						Method method15 = cl.getMethod("setV_"+(k+3), new Class[]{String.class});
						method15.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCYM"+nf[j]).toString()))});
						Method method16 = cl.getMethod("setV_"+(k+4), new Class[]{String.class});
						method16.invoke(l, new Object[]{list.get(i).get("ZJXMSL"+nf[j]).toString()});
						Method method17 = cl.getMethod("setV_"+(k+5), new Class[]{String.class});
						method17.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("ZJYM"+nf[j]).toString()))});
						Method method18 = cl.getMethod("setV_"+(k+6), new Class[]{String.class});
						method18.invoke(l, new Object[]{list.get(i).get("WKXMSL"+nf[j]).toString()});
						Method method19 = cl.getMethod("setV_"+(k+7), new Class[]{String.class});
						method19.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WKYM"+nf[j]).toString()))});
						Method method20 = cl.getMethod("setV_"+(k+8), new Class[]{String.class});
						method20.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WC"+nf[j]).toString()))});
						Method method21 = cl.getMethod("setV_"+(k+9), new Class[]{String.class});
						method21.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("BNWC"+nf[j]).toString()))});
						Method method22 = cl.getMethod("setV_"+(k+10), new Class[]{String.class});
						method22.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCL"+nf[j]).toString()))});
						k+=11;
					}
					elist.add(l);
				}
				elist=qddh(elist);
				//把数据放入elist
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("全省危桥改造项目汇总表");//设置第一行 
				eldata.setSheetName("危桥");//设置sheeet名
				eldata.setFileName("全省危桥改造项目汇总表");//设置文件名
				eldata.setEl(elist);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("设区市交通局",1,3,0,0));
				et.add(new Excel_tilte("合计",1,1,1,11));
				int sj1=12;
				for (int i = 0; i < nf.length; i++) {
					et.add(new Excel_tilte(nf[i]+"年度",1,1,sj1,sj1+10));
					sj1=sj1+11;
				}
				et.add(new Excel_tilte("计划项目",2,2,1,2));
				et.add(new Excel_tilte("完工项目",2,2,3,4));
				et.add(new Excel_tilte("在建项目",2,2,5,6));
				et.add(new Excel_tilte("未开工项目",2,2,7,8));
				et.add(new Excel_tilte("完成投资(万元)",2,3,9,9));
				et.add(new Excel_tilte("本年完成投资(万元)",2,3,10,10));
				et.add(new Excel_tilte("完成率(%)",2,3,11,11));
				int sj2=11;
				for (int i = 0; i < nf.length; i++) {
					et.add(new Excel_tilte("计划项目",2,2,sj2+1,sj2+2));
					et.add(new Excel_tilte("完工项目",2,2,sj2+3,sj2+4));
					et.add(new Excel_tilte("在建项目",2,2,sj2+5,sj2+6));
					et.add(new Excel_tilte("未开工项目",2,2,sj2+7,sj2+8));
					et.add(new Excel_tilte("完成投资(万元)",2,3,sj2+9,sj2+9));
					et.add(new Excel_tilte("本年完成投资(万元)",2,3,sj2+10,sj2+10));
					et.add(new Excel_tilte("完成率(%)",2,3,sj2+11,sj2+11));
					sj2=sj2+11;
				}
				et.add(new Excel_tilte("座",3,3,1,1));
				et.add(new Excel_tilte("延米",3,3,2,2));
				et.add(new Excel_tilte("座",3,3,3,3));
				et.add(new Excel_tilte("延米",3,3,4,4));
				et.add(new Excel_tilte("座",3,3,5,5));
				et.add(new Excel_tilte("延米",3,3,6,6));
				et.add(new Excel_tilte("座",3,3,7,7));
				et.add(new Excel_tilte("延米",3,3,8,8));
				int sj3=12;
				for (int i = 0; i < nf.length; i++) {
					et.add(new Excel_tilte("座",3,3,sj3,sj3));
					et.add(new Excel_tilte("延米",3,3,sj3+1,sj3+1));
					et.add(new Excel_tilte("座",3,3,sj3+2,sj3+2));
					et.add(new Excel_tilte("延米",3,3,sj3+3,sj3+3));
					et.add(new Excel_tilte("座",3,3,sj3+4,sj3+4));
					et.add(new Excel_tilte("延米",3,3,sj3+5,sj3+5));
					et.add(new Excel_tilte("座",3,3,sj3+6,sj3+6));
					et.add(new Excel_tilte("延米",3,3,sj3+7,sj3+7));
					sj3=sj3+11;
				}
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
				
			}else{
				JsonUtils.write(list, getresponse().getWriter());
			}
			}catch(Exception e){
				e.printStackTrace();
			}
	}

	public void getAbgchzb(){
		try{
			List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
			String tableName="abgchzb";
			String[] arr=gcglwqgz.getXmnf().split(",");
			String sql="select xzqhmc";
			String viewsql="create or replace view abgchzb as "
					+"select tb1.xzqh,tb1.xzqhmc,tb1.jhnf,nvl(tb1.sl,0) jhsl,nvl(tb1.ym,0) jhym,nvl(tb2.sl,0) wcsl,nvl(tb2.wcym,0) wcym,nvl(tb3.sl,0) zjsl,nvl(tb3.wcym,0) zjym,nvl(tb4.sl,0) wksl,nvl(tb4.wcym,0) wkym,tb1.wc,tb1.wc bnwc,decode(tb1.ym,0,0,round(to_number(tb2.wcym)/to_number(tb1.ym)*100,0)) wcl from (select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) ym,sum(dw) dw,sum(wc) wc,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,substr(xm.xzqhdm,1,4) xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where (xm.tsdq!='省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb1,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,substr(xm.xzqhdm,1,4) xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.jgzt='1' and( xm.tsdq!='省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb2,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,substr(xm.xzqhdm,1,4) xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.jgzt='0' and pl.kgzt='1' and( xm.tsdq!='省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb3,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,substr(xm.xzqhdm,1,4) xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.kgzt='0' and( xm.tsdq!='省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb4 where tb1.xzqh=tb2.xzqh(+) and tb1.jhnf=tb2.jhnf(+) and tb1.xzqh=tb3.xzqh(+) and tb1.jhnf=tb3.jhnf(+) and tb1.jhnf=tb4.jhnf(+) and tb1.xzqh=tb4.xzqh(+) union all select '9'||tb1.xzqh xzqh,tb1.xzqhmc,tb1.jhnf,nvl(tb1.sl,0) jhsl,nvl(tb1.ym,0) jhym,nvl(tb2.sl,0) wcsl,nvl(tb2.wcym,0) wcym,nvl(tb3.sl,0) zjsl,nvl(tb3.wcym,0) zjym,nvl(tb4.sl,0) wksl,nvl(tb4.wcym,0) wkym,tb1.wc,tb1.wc bnwc,decode(tb1.ym,0,0,round(to_number(tb2.wcym)/to_number(tb1.ym)*100,0)) wcl from (select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) ym,sum(dw) dw,sum(wc) wc,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,xm.xzqhdm xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where xm.tsdq='省直管试点县'  and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb1,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,xm.xzqhdm xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.jgzt='1' and xm.tsdq='省直管试点县'  and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb2,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,xm.xzqhdm xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.jgzt='0' and pl.kgzt='1' and xm.tsdq='省直管试点县'  and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb3,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,xm.xzqhdm xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.kgzt='0' and xm.tsdq='省直管试点县'  and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb4 where tb1.xzqh=tb2.xzqh(+) and tb1.jhnf=tb2.jhnf(+) and tb1.xzqh=tb3.xzqh(+) and tb1.jhnf=tb3.jhnf(+) and tb1.jhnf=tb4.jhnf(+) and tb1.xzqh=tb4.xzqh(+) union all select '36' xzqh,'全省汇总' xzqhmc,tb.jhnf,sum(tb.jhsl),sum(tb.jhym),sum(tb.wcsl),sum(tb.wcym),sum(tb.zjsl),sum(tb.zjym),sum(tb.wksl),sum(tb.wkym),sum(tb.wc) wc,sum(tb.bnwc) bnwc,decode(sum(tb.jhym),0,0,round(to_number(sum(tb.wcym))/to_number(sum(tb.jhym))*100,0)) wcl from(select tb1.xzqh,tb1.xzqhmc,tb1.jhnf,nvl(tb1.sl,0) jhsl,nvl(tb1.ym,0) jhym,nvl(tb2.sl,0) wcsl,nvl(tb2.wcym,0) wcym,nvl(tb3.sl,0) zjsl,nvl(tb3.wcym,0) zjym,nvl(tb4.sl,0) wksl,nvl(tb4.wcym,0) wkym,tb1.wc,tb1.wc bnwc,decode(tb1.ym,0,0,round(to_number(tb2.wcym)/to_number(tb1.ym)*100,0)) wcl from (select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) ym,sum(dw) dw,sum(wc) wc,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,substr(xm.xzqhdm,1,4) xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where (xm.tsdq!='省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb1,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,substr(xm.xzqhdm,1,4) xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.jgzt='1' and( xm.tsdq!='省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb2,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,substr(xm.xzqhdm,1,4) xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.jgzt='0' and pl.kgzt='1' and( xm.tsdq!='省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb3,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh||'00')) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,substr(xm.xzqhdm,1,4) xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.kgzt='0' and( xm.tsdq!='省直管试点县' or xm.tsdq is null) and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb4 where tb1.xzqh=tb2.xzqh(+) and tb1.jhnf=tb2.jhnf(+) and tb1.xzqh=tb3.xzqh(+) and tb1.jhnf=tb3.jhnf(+) and tb1.jhnf=tb4.jhnf(+) and tb1.xzqh=tb4.xzqh(+) union all select '9'||tb1.xzqh xzqh,tb1.xzqhmc,tb1.jhnf,nvl(tb1.sl,0) jhsl,nvl(tb1.ym,0) jhym,nvl(tb2.sl,0) wcsl,nvl(tb2.wcym,0) wcym,nvl(tb3.sl,0) zjsl,nvl(tb3.wcym,0) zjym,nvl(tb4.sl,0) wksl,nvl(tb4.wcym,0) wkym,tb1.wc,tb1.wc bnwc,decode(tb1.ym,0,0,round(to_number(tb2.wcym)/to_number(tb1.ym)*100,0)) wcl from (select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) ym,sum(dw) dw,sum(wc) wc,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,xm.xzqhdm xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where xm.tsdq='省直管试点县'  and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb1,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,xm.xzqhdm xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.jgzt='1' and xm.tsdq='省直管试点县'  and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb2,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,xm.xzqhdm xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.jgzt='0' and pl.kgzt='1' and xm.tsdq='省直管试点县'  and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb3,(select to_char(t.xzqh)xzqh,xzqhmc,t.jhnf,sum(ym) wcym,count(*) sl from(select t1.xmbm,to_char((select name from xtgl_xzqh where id=t1.xzqh)) xzqhmc,t1.jhnf,t1.ym,t1.xzqh,t2.dw,t3.wc from(select pl.id xmbm,pl.jhnf jhnf,sc.scyhlc ym,xm.xzqhdm xzqh from plan_abgc pl left join sck_abgc sc on pl.sckid=sc.sckid left join xmk_abgc xm on sc.xmkid=xm.id where pl.kgzt='0' and xm.tsdq='省直管试点县'  and xm.gydwbm like '1%') t1,(select zj.xmid xmbm,zj.xdzj dw from plan_zjxd zj) t2,(select gc.jhid xmbm,sum(decode(gc.wc_btz,null,0,gc.wc_btz))+sum(decode(gc.wc_stz,null,0,gc.wc_stz))+sum(decode(gc.wc_qttz,null,0,gc.wc_qttz)) wc from gcgl_abgc gc where to_date(gc.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by gc.jhid) t3 where t1.xmbm=t2.xmbm and t1.xmbm=t3.xmbm) t group by t.xzqh,xzqhmc,t.jhnf) tb4 where tb1.xzqh=tb2.xzqh(+) and tb1.jhnf=tb2.jhnf(+) and tb1.xzqh=tb3.xzqh(+) and tb1.jhnf=tb3.jhnf(+) and tb1.jhnf=tb4.jhnf(+) and tb1.xzqh=tb4.xzqh(+)) tb group by jhnf order by xzqh,jhnf";
			gcybbServer.createybView(viewsql);
			String in="";
			for(int j=0;j<arr.length;j++){
				if(j==0)
				    in=in+"'"+arr[j]+"'";
				else
					in=in+",'"+arr[j]+"'";
				sql=sql+",decode(sum(decode(jhnf,'"+arr[j]+"',jhsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',jhsl))) jhsl"+arr[j]+
							",decode(sum(decode(jhnf,'"+arr[j]+"',jhym)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',jhym))) jhym"+arr[j]+
							",decode(sum(decode(jhnf,'"+arr[j]+"',wcsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',wcsl))) wcsl"+arr[j]+
							",decode(sum(decode(jhnf,'"+arr[j]+"',wcym)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',wcym))) wcym"+arr[j]+
							",decode(sum(decode(jhnf,'"+arr[j]+"',zjsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',zjsl))) zjsl"+arr[j]+
							",decode(sum(decode(jhnf,'"+arr[j]+"',zjym)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',zjym))) zjym"+arr[j]+
							",decode(sum(decode(jhnf,'"+arr[j]+"',wksl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',wksl))) wksl"+arr[j]+
							",decode(sum(decode(jhnf,'"+arr[j]+"',wkym)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',wkym))) wkym"+arr[j]+
					        ",decode(sum(decode(jhnf,'"+arr[j]+"',wc)),null,0,sum(decode(jhnf,'"+arr[j]+"',wc))) wc"+arr[j]+
					        ",decode(sum(decode(jhnf,'"+arr[j]+"',bnwc)),null,0,sum(decode(jhnf,'"+arr[j]+"',bnwc))) bnwc"+arr[j]+""+
					        ",decode(sum(decode(jhnf,'"+arr[j]+"',wcl)),null,0,sum(decode(jhnf,'"+arr[j]+"',wcl))) wcl"+arr[j]+"";
			}
			sql=sql+" from "+tableName+"  where jhnf in("+in+")group by xzqhmc,xzqh order by xzqh";		
			System.out.println(sql);
			list=gcybbServer.getGjxjmxbsj(sql);
			
			for(int i=0;i<list.size();i++){
				HashMap<String,Object> hm=(HashMap<String, Object>) list.get(i);
				double jhsl=0;
				double jhym=0;
				double wcsl=0;
				double wcym=0;
				double zjsl=0;
				double zjym=0;
				double wksl=0;
				double wkym=0;
				double wc=0;
				double bnwc=0;
				String wcl="";
				for(int j=arr.length-1;j>=0;j--){
					jhsl=jhsl+Double.valueOf(hm.get("JHSL"+arr[j]).toString());
					jhym=jhym+Double.valueOf(hm.get("JHYM"+arr[j]).toString());
					wcsl=wcsl+Double.valueOf(hm.get("WCSL"+arr[j]).toString());
					wcym=wcym+Double.valueOf(hm.get("WCYM"+arr[j]).toString());
					zjsl=zjsl+Double.valueOf(hm.get("ZJSL"+arr[j]).toString());
					zjym=zjym+Double.valueOf(hm.get("ZJYM"+arr[j]).toString());
					wksl=wksl+Double.valueOf(hm.get("WKSL"+arr[j]).toString());
					wkym=wkym+Double.valueOf(hm.get("WKYM"+arr[j]).toString());
					wc=wc+Double.valueOf(hm.get("WC"+arr[j]).toString());
					bnwc=bnwc+Double.valueOf(hm.get("BNWC"+arr[j]).toString());
					if((Double.valueOf(hm.get("JHSL"+arr[j]).toString()))!=0.0||(Double.valueOf(hm.get("JHSL"+arr[j]).toString()))!=0)
					 hm.put("WCL"+arr[j],(int)((Double.valueOf(hm.get("WCSL"+arr[j]).toString())/Double.valueOf(hm.get("JHSL"+arr[j]).toString()))*100)+"");
				}
				if(jhsl!=0){
					wcl=(int)((wcsl/jhsl)*100)+""; 
				}else{
					wcl="0";
				}
			   hm.put("WCL",wcl);
			   hm.put("JHSL",jhsl);
			   hm.put("JHYM",jhym);
			   hm.put("WCSL",wcsl);
			   hm.put("WCYM",wcym);
			   hm.put("ZJSL",zjsl);
			   hm.put("ZJYM",zjym);
			   hm.put("WKSL",wksl);
			   hm.put("WKYM",wkym);
			   hm.put("WC",wc);
			   hm.put("BNWC",wc);
			}
			if("flag".equals(flag)){
				String[] nf = gcglwqgz.getXmnf().split(",");
				Arrays.sort(nf);
				List<Excel_list> elist=new ArrayList<Excel_list>();
				int cd=(nf.length+1)*6+3;
				NumberFormat nfs = NumberFormat.getInstance(); 
		        nfs.setRoundingMode(RoundingMode.HALF_UP);//设置四舍五入 
		        nfs.setMinimumFractionDigits(2);//设置最小保留几位小数 
		        nfs.setMaximumFractionDigits(2);//设置最大保留几位小数
				for(int i=0;i<list.size();i++){
					Excel_list l = new Excel_list();
					Class cl = l.getClass();
					Method method = cl.getMethod("setV_"+0, new Class[]{String.class});
					method.invoke(l, new Object[]{list.get(i).get("XZQHMC").toString()});
					Method method1 = cl.getMethod("setV_"+1, new Class[]{String.class});
					method1.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("JHSL").toString()))});
					Method method2 = cl.getMethod("setV_"+2, new Class[]{String.class});
					method2.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("JHYM").toString()))});
					Method method3 = cl.getMethod("setV_"+3, new Class[]{String.class});
					method3.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCSL").toString()))});
					Method method4 = cl.getMethod("setV_"+4, new Class[]{String.class});
					method4.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCYM").toString()))});
					Method method5 = cl.getMethod("setV_"+5, new Class[]{String.class});
					method5.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("ZJSL").toString()))});
					Method method6 = cl.getMethod("setV_"+6, new Class[]{String.class});
					method6.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("ZJYM").toString()))});
					Method method7 = cl.getMethod("setV_"+7, new Class[]{String.class});
					method7.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WKSL").toString()))});
					Method method8 = cl.getMethod("setV_"+8, new Class[]{String.class});
					method8.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WKYM").toString()))});
					Method method9 = cl.getMethod("setV_"+9, new Class[]{String.class});
					method9.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WC").toString()))});
					Method method10 = cl.getMethod("setV_"+10, new Class[]{String.class});
					method10.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("BNWC").toString()))});
					Method method11 = cl.getMethod("setV_"+11, new Class[]{String.class});
					method11.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCL").toString()))});
					int k=12;
					for (int j = 0; j < nf.length; j++) {
						Method method12 = cl.getMethod("setV_"+k, new Class[]{String.class});
						method12.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("JHSL"+nf[j]).toString()))});
						Method method13 = cl.getMethod("setV_"+(k+1), new Class[]{String.class});
						method13.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("JHYM"+nf[j]).toString()))});
						Method method14 = cl.getMethod("setV_"+(k+2), new Class[]{String.class});
						method14.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCSL"+nf[j]).toString()))});
						Method method15 = cl.getMethod("setV_"+(k+3), new Class[]{String.class});
						method15.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCYM"+nf[j]).toString()))});
						Method method16 = cl.getMethod("setV_"+(k+4), new Class[]{String.class});
						method16.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("ZJSL"+nf[j]).toString()))});
						Method method17 = cl.getMethod("setV_"+(k+5), new Class[]{String.class});
						method17.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("ZJYM"+nf[j]).toString()))});
						Method method18 = cl.getMethod("setV_"+(k+6), new Class[]{String.class});
						method18.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WKSL"+nf[j]).toString()))});
						Method method19 = cl.getMethod("setV_"+(k+7), new Class[]{String.class});
						method19.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WKYM"+nf[j]).toString()))});
						Method method20 = cl.getMethod("setV_"+(k+8), new Class[]{String.class});
						method20.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WC"+nf[j]).toString()))});
						Method method21 = cl.getMethod("setV_"+(k+9), new Class[]{String.class});
						method21.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("BNWC"+nf[j]).toString()))});
						Method method22 = cl.getMethod("setV_"+(k+10), new Class[]{String.class});
						method22.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCL"+nf[j]).toString()))});
						k+=11;
					}
					elist.add(l);
				}
				elist=qddh(elist);
				//把数据放入elist
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("全省安保工程项目汇总表");//设置第一行 
				eldata.setSheetName("危桥");//设置sheeet名
				eldata.setFileName("全省安保工程项目汇总表");//设置文件名
				eldata.setEl(elist);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("设区市交通局",1,3,0,0));
				et.add(new Excel_tilte("合计",1,1,1,11));
				int sj1=12;
				for (int i = 0; i < nf.length; i++) {
					et.add(new Excel_tilte(nf[i]+"年度",1,1,sj1,sj1+10));
					sj1=sj1+11;
				}
				et.add(new Excel_tilte("计划项目",2,2,1,2));
				et.add(new Excel_tilte("完工项目",2,2,3,4));
				et.add(new Excel_tilte("在建项目",2,2,5,6));
				et.add(new Excel_tilte("未开工项目",2,2,7,8));
				et.add(new Excel_tilte("完成投资(万元)",2,3,9,9));
				et.add(new Excel_tilte("本年完成投资(万元)",2,3,10,10));
				et.add(new Excel_tilte("完成率(%)",2,3,11,11));
				int sj2=11;
				for (int i = 0; i < nf.length; i++) {
					et.add(new Excel_tilte("计划项目",2,2,sj2+1,sj2+2));
					et.add(new Excel_tilte("完工项目",2,2,sj2+3,sj2+4));
					et.add(new Excel_tilte("在建项目",2,2,sj2+5,sj2+6));
					et.add(new Excel_tilte("未开工项目",2,2,sj2+7,sj2+8));
					et.add(new Excel_tilte("完成投资(万元)",2,3,sj2+9,sj2+9));
					et.add(new Excel_tilte("本年完成投资(万元)",2,3,sj2+10,sj2+10));
					et.add(new Excel_tilte("完成率(%)",2,3,sj2+11,sj2+11));
					sj2=sj2+11;
				}
				et.add(new Excel_tilte("个数",3,3,1,1));
				et.add(new Excel_tilte("公里",3,3,2,2));
				et.add(new Excel_tilte("个数",3,3,3,3));
				et.add(new Excel_tilte("公里",3,3,4,4));
				et.add(new Excel_tilte("个数",3,3,5,5));
				et.add(new Excel_tilte("公里",3,3,6,6));
				et.add(new Excel_tilte("个数",3,3,7,7));
				et.add(new Excel_tilte("公里",3,3,8,8));
				int sj3=12;
				for (int i = 0; i < nf.length; i++) {
					et.add(new Excel_tilte("个数",3,3,sj3,sj3));
					et.add(new Excel_tilte("公里",3,3,sj3+1,sj3+1));
					et.add(new Excel_tilte("个数",3,3,sj3+2,sj3+2));
					et.add(new Excel_tilte("公里",3,3,sj3+3,sj3+3));
					et.add(new Excel_tilte("个数",3,3,sj3+4,sj3+4));
					et.add(new Excel_tilte("公里",3,3,sj3+5,sj3+5));
					et.add(new Excel_tilte("个数",3,3,sj3+6,sj3+6));
					et.add(new Excel_tilte("公里",3,3,sj3+7,sj3+7));
					sj3=sj3+11;
				}
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
				
			}else{
				JsonUtils.write(list, getresponse().getWriter());
			}
			}catch(Exception e){
				e.printStackTrace();
			}
	}
	
	//
	public void getGjxjmxb(){
		//System.out.println(gcglwqgz.getTiaojian()+"---"+gcglwqgz.getXmnf());
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		String tableName="";
		try{
				String viewsql="";
			    if("升级改造".equals(gcglwqgz.getTiaojian())){
			    	tableName="yb_sj";
			    	viewsql="CREATE OR REPLACE VIEW YB_SJ AS "
			    			+"select t1.xzqh,t1.xzqhmc,t1.jhnf,t1.xmsl,t1.xmlc,t2.xmzj,t3.wclc,t4.wcxmzj,t1.bbzorsbz,t2.bbz,t1.pfztz from (select to_char(t.xzqh)xzqh,to_char((select name from xtgl_xzqh where id=t.xzqh||'00')) xzqhmc,t.jhnf,count(*) xmsl,sum(xmlc) xmlc,sum(bbzorsbz) bbzorsbz,sum(pfztz) pfztz from (select xm.xmbm,xm.jhnf,lx.xmlc,lx.xzqh,xm.bbzorsbz,xm.pfztz from (SELECT xmbm,'升级改造' lx,substr(xmbm,0,4) jhnf,bbzzj+sbzzj bbzorsbz,pfztz from jhsh_sjgz) xm, (SELECT xmid,'升级改造' lx,sum(lc) xmlc,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx where xm.xmbm=lx.xmid(+)) t group by t.xzqh,t.jhnf)t1, (select t.xzqh,t.xdnf,sum(xmzj) xmzj,sum(bbz) bbz from (select xm.xmbm,lx.xzqh,xdzj.xdnf,xmzj,bbz from (SELECT xmbm,'升级改造' lx from jhsh_sjgz) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT xmid,xdnf,sum(btzzj+stz) xmzj,sum(btzzj) bbz from plan_zjxd group by xmid,xdnf)xdzj where xm.xmbm=lx.xmid(+) and xm.xmbm=xdzj.xmid(+)) t group by t.xzqh,t.xdnf)t2, (select t.xzqh,t.wclcnf,sum(wclc) wclc from (select xm.xmbm,lx.xzqh,wclc.wclcnf,wclc from (SELECT xmbm,'升级改造' lx from jhsh_sjgz) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,'升级改造' lx,sum(bywcmc) wclc,substr(sbyf,1,4) wclcnf from gcgl_gcgzsj tb where to_date(tb.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(sbyf,1,4))wclc where xm.xmbm=lx.xmid(+) and xm.xmbm=wclc.jhid(+)) t group by t.xzqh,t.wclcnf)t3, (select t.xzqh,t.wczjnf,sum(wcxmzj) wcxmzj from (select xm.xmbm,lx.xzqh,wczj.wczjnf,wcxmzj from (SELECT xmbm,'升级改造' lx from jhsh_sjgz) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4)) lx, (SELECT jhid,substr(tbyf,1,4) wczjnf,sum(cgsdwzj+stz) wcxmzj from gcgl_cgs tg where to_date(tg.tbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(tbyf,1,4)) wczj where xm.xmbm=lx.xmid(+) and xm.xmbm=wczj.jhid(+)) t group by t.xzqh,t.wczjnf)t4 where t1.xzqh=t2.xzqh(+) and t1.xzqh=t3.xzqh(+) and t1.xzqh=t4.xzqh(+) and t1.jhnf=t2.xdnf(+) and t1.jhnf=t3.wclcnf(+) and t1.jhnf=t4.wczjnf(+) union all select t1.xzqh,t1.xzqhmc,t1.jhnf,t1.xmsl,t1.xmlc,t2.xmzj,t3.wclc,t4.wcxmzj,t1.bbzorsbz,t2.bbz,t1.pfztz from (select to_char(t.xzqh)xzqh,to_char((select name from xtgl_xzqh where id=t.xzqh||'00')) xzqhmc,t.jhnf,count(*) xmsl,sum(xmlc) xmlc,sum(bbzorsbz) bbzorsbz,sum(pfztz) pfztz from (select xm.xmbm,xm.jhnf,lx.xmlc,lx.xzqh,xm.bbzorsbz,xm.pfztz from (SELECT xmbm,'升级改造' lx,substr(xmbm,0,4) jhnf,bbzzj+sbzzj bbzorsbz,pfztz from jhsh_xj) xm, (SELECT xmid,'升级改造' lx,sum(lc) xmlc,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx where xm.xmbm=lx.xmid(+)) t group by t.xzqh,t.jhnf)t1, (select t.xzqh,t.xdnf,sum(xmzj) xmzj,sum(bbz) bbz from (select xm.xmbm,lx.xzqh,xdzj.xdnf,xmzj,bbz from (SELECT xmbm,'升级改造' lx from jhsh_xj) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT xmid,xdnf,sum(btzzj+stz) xmzj,sum(btzzj) bbz from plan_zjxd group by xmid,xdnf)xdzj where xm.xmbm=lx.xmid(+) and xm.xmbm=xdzj.xmid(+)) t group by t.xzqh,t.xdnf)t2, (select t.xzqh,t.wclcnf,sum(wclc) wclc from (select xm.xmbm,lx.xzqh,wclc.wclcnf,wclc from (SELECT xmbm,'升级改造' lx from jhsh_xj) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,'升级改造' lx,sum(bywcmc) wclc,substr(sbyf,1,4) wclcnf from gcgl_xj tb where to_date(tb.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(sbyf,1,4))wclc where xm.xmbm=lx.xmid(+) and xm.xmbm=wclc.jhid(+)) t group by t.xzqh,t.wclcnf)t3, (select t.xzqh,t.wczjnf,sum(wcxmzj) wcxmzj from (select xm.xmbm,lx.xzqh,wczj.wczjnf,wcxmzj from (SELECT xmbm,'升级改造' lx from jhsh_xj) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,substr(tbyf,1,4) wczjnf,sum(cgsdwzj+stz) wcxmzj from gcgl_cgs tg where to_date(tg.tbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(tbyf,1,4)) wczj where xm.xmbm=lx.xmid(+) and xm.xmbm=wczj.jhid(+)) t group by t.xzqh,t.wczjnf)t4 where t1.xzqh=t2.xzqh(+) and t1.xzqh=t3.xzqh(+) and t1.xzqh=t4.xzqh(+) and t1.jhnf=t2.xdnf(+) and t1.jhnf=t3.wclcnf(+) and t1.jhnf=t4.wczjnf(+) union all select '36' xzqh,'全省汇总' xzqhmc,jhnf,sum(xmsl),sum(xmlc),sum(xmzj),sum(wclc),sum(wcxmzj),sum(bbzorsbz),sum(bbz),sum(pfztz) from (select t1.xzqh,t1.xzqhmc,t1.jhnf,t1.xmsl,t1.xmlc,t2.xmzj,t3.wclc,t4.wcxmzj,t1.bbzorsbz,t2.bbz,t1.pfztz from (select to_char(t.xzqh)xzqh,to_char((select name from xtgl_xzqh where id=t.xzqh||'00')) xzqhmc,t.jhnf,count(*) xmsl,sum(xmlc) xmlc,sum(bbzorsbz) bbzorsbz,sum(pfztz) pfztz from (select xm.xmbm,xm.jhnf,lx.xmlc,lx.xzqh,xm.bbzorsbz,xm.pfztz from (SELECT xmbm,'升级改造' lx,substr(xmbm,0,4) jhnf,bbzzj+sbzzj bbzorsbz,pfztz from jhsh_sjgz) xm, (SELECT xmid,'升级改造' lx,sum(lc) xmlc,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx where xm.xmbm=lx.xmid(+)) t group by t.xzqh,t.jhnf)t1, (select t.xzqh,t.xdnf,sum(xmzj) xmzj,sum(bbz) bbz from (select xm.xmbm,lx.xzqh,xdzj.xdnf,xmzj,bbz from (SELECT xmbm,'升级改造' lx from jhsh_sjgz) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT xmid,xdnf,sum(btzzj+stz) xmzj,sum(btzzj) bbz from plan_zjxd group by xmid,xdnf)xdzj where xm.xmbm=lx.xmid(+) and xm.xmbm=xdzj.xmid(+)) t group by t.xzqh,t.xdnf)t2, (select t.xzqh,t.wclcnf,sum(wclc) wclc from (select xm.xmbm,lx.xzqh,wclc.wclcnf,wclc from (SELECT xmbm,'升级改造' lx from jhsh_sjgz) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,'升级改造' lx,sum(bywcmc) wclc,substr(sbyf,1,4) wclcnf from gcgl_gcgzsj tb where to_date(tb.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(sbyf,1,4))wclc where xm.xmbm=lx.xmid(+) and xm.xmbm=wclc.jhid(+)) t group by t.xzqh,t.wclcnf)t3, (select t.xzqh,t.wczjnf,sum(wcxmzj) wcxmzj from (select xm.xmbm,lx.xzqh,wczj.wczjnf,wcxmzj from (SELECT xmbm,'升级改造' lx from jhsh_sjgz) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,substr(tbyf,1,4) wczjnf,sum(cgsdwzj+stz) wcxmzj from gcgl_cgs tg where to_date(tg.tbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(tbyf,1,4)) wczj where xm.xmbm=lx.xmid(+) and xm.xmbm=wczj.jhid(+)) t group by t.xzqh,t.wczjnf)t4 where t1.xzqh=t2.xzqh(+) and t1.xzqh=t3.xzqh(+) and t1.xzqh=t4.xzqh(+) and t1.jhnf=t2.xdnf(+) and t1.jhnf=t3.wclcnf(+) and t1.jhnf=t4.wczjnf(+) union all select t1.xzqh,t1.xzqhmc,t1.jhnf,t1.xmsl,t1.xmlc,t2.xmzj,t3.wclc,t4.wcxmzj,t1.bbzorsbz,t2.bbz,t1.pfztz from (select to_char(t.xzqh)xzqh,to_char((select name from xtgl_xzqh where id=t.xzqh||'00')) xzqhmc,t.jhnf,count(*) xmsl,sum(xmlc) xmlc,sum(bbzorsbz) bbzorsbz,sum(pfztz) pfztz from (select xm.xmbm,xm.jhnf,lx.xmlc,lx.xzqh,xm.bbzorsbz,xm.pfztz from (SELECT xmbm,'升级改造' lx,substr(xmbm,0,4) jhnf,bbzzj+sbzzj bbzorsbz,pfztz from jhsh_xj) xm, (SELECT xmid,'升级改造' lx,sum(lc) xmlc,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx where xm.xmbm=lx.xmid(+)) t group by t.xzqh,t.jhnf)t1, (select t.xzqh,t.xdnf,sum(xmzj) xmzj,sum(bbz) bbz from (select xm.xmbm,lx.xzqh,xdzj.xdnf,xmzj,bbz from (SELECT xmbm,'升级改造' lx from jhsh_xj) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT xmid,xdnf,sum(btzzj+stz) xmzj,sum(btzzj) bbz from plan_zjxd group by xmid,xdnf)xdzj where xm.xmbm=lx.xmid(+) and xm.xmbm=xdzj.xmid(+)) t group by t.xzqh,t.xdnf)t2, (select t.xzqh,t.wclcnf,sum(wclc) wclc from (select xm.xmbm,lx.xzqh,wclc.wclcnf,wclc from (SELECT xmbm,'升级改造' lx from jhsh_xj) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,'升级改造' lx,sum(bywcmc) wclc,substr(sbyf,1,4) wclcnf from gcgl_xj tb where to_date(tb.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(sbyf,1,4))wclc where xm.xmbm=lx.xmid(+) and xm.xmbm=wclc.jhid(+)) t group by t.xzqh,t.wclcnf)t3, (select t.xzqh,t.wczjnf,sum(wcxmzj) wcxmzj from (select xm.xmbm,lx.xzqh,wczj.wczjnf,wcxmzj from (SELECT xmbm,'升级改造' lx from jhsh_xj) xm, (SELECT xmid,'升级改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,substr(tbyf,1,4) wczjnf,sum(cgsdwzj+stz) wcxmzj from gcgl_cgs tg where to_date(tg.tbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(tbyf,1,4)) wczj where xm.xmbm=lx.xmid(+) and xm.xmbm=wczj.jhid(+)) t group by t.xzqh,t.wczjnf)t4 where t1.xzqh=t2.xzqh(+) and t1.xzqh=t3.xzqh(+) and t1.xzqh=t4.xzqh(+) and t1.jhnf=t2.xdnf(+) and t1.jhnf=t3.wclcnf(+) and t1.jhnf=t4.wczjnf(+) ) group by substr(xzqh,1,2),jhnf order by xzqh,jhnf";
			    }
				if("路面改造".equals(gcglwqgz.getTiaojian())){
					tableName="yb_gj";
					viewsql="CREATE OR REPLACE VIEW YB_GJ AS"
					+" select t1.xzqh,t1.xzqhmc,t1.jhnf,t1.xmsl,t1.xmlc,t2.xmzj,t3.wclc,t4.wcxmzj,t1.bbzorsbz,t2.bbz,t1.pfztz from (select to_char(t.xzqh)xzqh,to_char((select name from xtgl_xzqh where id=t.xzqh||'00'))  xzqhmc,t.jhnf,count(*) xmsl,sum(xmlc) xmlc,sum(bbzorsbz) bbzorsbz,sum(pfztz) pfztz from (select xm.xmbm,xm.jhnf,lx.xmlc,lx.xzqh,xm.bbzorsbz,xm.pfztz from (SELECT xmbm,'路面改造' lx,substr(xmbm,0,4) jhnf,bbzzj+sbzzj bbzorsbz,pfztz from jhsh_lmgz) xm, (SELECT xmid,'路面改造' lx,sum(lc) xmlc,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx where xm.xmbm=lx.xmid(+)) t group by t.xzqh,t.jhnf)t1, (select t.xzqh,t.xdnf,sum(xmzj) xmzj,sum(bbz) bbz from (select xm.xmbm,lx.xzqh,xdzj.xdnf,xmzj,bbz from (SELECT xmbm,'路面改造' lx from jhsh_lmgz) xm, (SELECT xmid,'路面改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT xmid,xdnf,sum(btzzj+stz) xmzj,sum(btzzj) bbz from plan_zjxd group by xmid,xdnf)xdzj where xm.xmbm=lx.xmid(+) and xm.xmbm=xdzj.xmid(+)) t group by t.xzqh,t.xdnf)t2, (select t.xzqh,t.wclcnf,sum(wclc) wclc from (select xm.xmbm,lx.xzqh,wclc.wclcnf,wclc from (SELECT xmbm,'路面改造' lx from jhsh_lmgz) xm, (SELECT xmid,'路面改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,'路面改造' lx,sum(bywcmc) wclc,substr(sbyf,1,4) wclcnf from gcgl_gcgzgj tb where to_date(tb.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(sbyf,1,4))wclc where xm.xmbm=lx.xmid(+) and xm.xmbm=wclc.jhid(+)) t group by t.xzqh,t.wclcnf)t3, (select t.xzqh,t.wczjnf,sum(wcxmzj) wcxmzj from (select xm.xmbm,lx.xzqh,wczj.wczjnf,wcxmzj from (SELECT xmbm,'路面改造' lx from jhsh_lmgz) xm, (SELECT xmid,'路面改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,substr(tbyf,1,4) wczjnf,sum(cgsdwzj+stz) wcxmzj from gcgl_cgs tg where to_date(tg.tbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(tbyf,1,4)) wczj where xm.xmbm=lx.xmid(+) and xm.xmbm=wczj.jhid(+)) t group by t.xzqh,t.wczjnf)t4 where t1.xzqh=t2.xzqh(+) and t1.xzqh=t3.xzqh(+) and t1.xzqh=t4.xzqh(+) and t1.jhnf=t2.xdnf(+) and t1.jhnf=t3.wclcnf(+) and t1.jhnf=t4.wczjnf(+) union all select '36' xzqh,'全省汇总' xzqhmc,jhnf,sum(xmsl),sum(xmlc),sum(xmzj),sum(wclc),sum(wcxmzj),sum(bbzorsbz) bbzorsbz,sum(bbz),sum(pfztz) from (select t1.xzqh,t1.xzqhmc,t1.jhnf,t1.xmsl,t1.xmlc,t2.xmzj,t3.wclc,t4.wcxmzj,t1.bbzorsbz,t2.bbz,t1.pfztz from (select to_char(t.xzqh)xzqh,to_char((select name from xtgl_xzqh where id=t.xzqh||'00')) xzqhmc,t.jhnf,count(*) xmsl,sum(xmlc) xmlc,sum(bbzorsbz) bbzorsbz,sum(pfztz) pfztz from (select xm.xmbm,xm.jhnf,lx.xmlc,lx.xzqh,xm.bbzorsbz,xm.pfztz from (SELECT xmbm,'路面改造' lx,substr(xmbm,0,4) jhnf,bbzzj+sbzzj bbzorsbz,pfztz from jhsh_lmgz) xm, (SELECT xmid,'路面改造' lx,sum(lc) xmlc,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx where xm.xmbm=lx.xmid(+)) t group by t.xzqh,t.jhnf)t1, (select t.xzqh,t.xdnf,sum(xmzj) xmzj,sum(bbz) bbz from (select xm.xmbm,lx.xzqh,xdzj.xdnf,xmzj,bbz from (SELECT xmbm,'路面改造' lx from jhsh_lmgz) xm, (SELECT xmid,'路面改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT xmid,xdnf,sum(btzzj+stz) xmzj,sum(btzzj) bbz from plan_zjxd group by xmid,xdnf)xdzj where xm.xmbm=lx.xmid(+) and xm.xmbm=xdzj.xmid(+)) t group by t.xzqh,t.xdnf)t2, (select t.xzqh,t.wclcnf,sum(wclc) wclc from (select xm.xmbm,lx.xzqh,wclc.wclcnf,wclc from (SELECT xmbm,'路面改造' lx from jhsh_lmgz) xm, (SELECT xmid,'路面改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,'路面改造' lx,sum(bywcmc) wclc,substr(sbyf,1,4) wclcnf from gcgl_gcgzgj tb where to_date(tb.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(sbyf,1,4))wclc where xm.xmbm=lx.xmid(+) and xm.xmbm=wclc.jhid(+)) t group by t.xzqh,t.wclcnf)t3, (select t.xzqh,t.wczjnf,sum(wcxmzj) wcxmzj from (select xm.xmbm,lx.xzqh,wczj.wczjnf,wcxmzj from (SELECT xmbm,'路面改造' lx from jhsh_lmgz) xm, (SELECT xmid,'路面改造' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,substr(tbyf,1,4) wczjnf,sum(cgsdwzj+stz) wcxmzj from gcgl_cgs tg where to_date(tg.tbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(tbyf,1,4)) wczj where xm.xmbm=lx.xmid(+) and xm.xmbm=wczj.jhid(+)) t group by t.xzqh,t.wczjnf)t4 where t1.xzqh=t2.xzqh(+) and t1.xzqh=t3.xzqh(+) and t1.xzqh=t4.xzqh(+) and t1.jhnf=t2.xdnf(+) and t1.jhnf=t3.wclcnf(+) and t1.jhnf=t4.wczjnf(+) ) group by substr(xzqh,1,2),jhnf order by xzqh,jhnf";
				}
				if("灾毁重建".equals(gcglwqgz.getTiaojian())){
					tableName="yb_sh";
					viewsql="CREATE OR REPLACE VIEW YB_SH AS "
					+" select t1.xzqh,t1.xzqhmc,t1.jhnf,t1.xmsl,t1.xmlc,t2.xmzj,t3.wclc,t4.wcxmzj,t1.bbzorsbz,t2.bbz,t1.pfztz from (select to_char(t.xzqh) xzqh,to_char((select name from xtgl_xzqh where id=t.xzqh||'00')) xzqhmc,t.jhnf,count(*) xmsl,sum(xmlc) xmlc,sum(bbzorsbz) bbzorsbz,sum(pfztz) pfztz from (select xm.xmbm,xm.jhnf,lx.xmlc,lx.xzqh,xm.bbzorsbz,xm.pfztz from (SELECT xmbm,'水毁' lx,substr(xmbm,0,4) jhnf,bbzzj+sbzzj bbzorsbz,pfztz from jhsh_sh) xm, (SELECT xmid,'水毁' lx,sum(lc) xmlc,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx where xm.xmbm=lx.xmid(+)) t group by t.xzqh,t.jhnf)t1, (select t.xzqh,t.xdnf,sum(xmzj) xmzj,sum(bbz) bbz from (select xm.xmbm,lx.xzqh,xdzj.xdnf,xmzj,bbz from (SELECT xmbm,'水毁' lx from jhsh_sh) xm, (SELECT xmid,'水毁' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT xmID,xdnf,sum(btzzj+stz) xmzj,sum(btzzj) bbz from plan_zjxd group by xmid,xdnf)xdzj where xm.xmbm=lx.xmid(+) and xm.xmbm=xdzj.xmID(+)) t group by t.xzqh,t.xdnf)t2, (select t.xzqh,t.wclcnf,sum(wclc) wclc from (select xm.xmbm,lx.xzqh,wclc.wclcnf,wclc from (SELECT xmbm,'水毁' lx from jhsh_sh) xm, (SELECT xmid,'水毁' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,'水毁' lx,sum(bywcmc) wclc,substr(sbyf,1,4) wclcnf from gcgl_sh tb where to_date(tb.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(sbyf,1,4))wclc where xm.xmbm=lx.xmid(+) and xm.xmbm=wclc.jhid(+)) t group by t.xzqh,t.wclcnf)t3, (select t.xzqh,t.wczjnf,sum(wcxmzj) wcxmzj from (select xm.xmbm,lx.xzqh,wczj.wczjnf,wcxmzj from (SELECT xmbm,'水毁' lx from jhsh_sh) xm, (SELECT xmid,'水毁' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,substr(tbyf,1,4) wczjnf,sum(cgsdwzj+stz) wcxmzj from gcgl_cgs tg where to_date(tg.tbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(tbyf,1,4)) wczj where xm.xmbm=lx.xmid(+) and xm.xmbm=wczj.jhid(+)) t group by t.xzqh,t.wczjnf)t4 where t1.xzqh=t2.xzqh(+) and t1.xzqh=t3.xzqh(+) and t1.xzqh=t4.xzqh(+) and t1.jhnf=t2.xdnf(+) and t1.jhnf=t3.wclcnf(+) and t1.jhnf=t4.wczjnf(+) union all select '36' xzqh,'全省汇总' xzqhmc,jhnf,sum(xmsl) xmsl,sum(xmlc) xmlc,sum(xmzj) xmzj,sum(wclc) wclc,sum(wcxmzj) wcxmzj,sum(bbzorsbz) bbzorsbz,sum(bbz),sum(pfztz) from (select t1.xzqh,t1.xzqhmc,t1.jhnf,t1.xmsl,t1.xmlc,t2.xmzj,t3.wclc,t4.wcxmzj,t1.bbzorsbz,t2.bbz,t1.pfztz from (select to_char(t.xzqh) xzqh,to_char((select name from xtgl_xzqh where id=t.xzqh||'00')) xzqhmc,t.jhnf,count(*) xmsl,sum(xmlc) xmlc,sum(bbzorsbz) bbzorsbz,sum(pfztz) pfztz from (select xm.xmbm,xm.jhnf,lx.xmlc,lx.xzqh,xm.bbzorsbz,xm.pfztz from (SELECT xmbm,'水毁' lx,substr(xmbm,0,4) jhnf,bbzzj+sbzzj bbzorsbz,pfztz from jhsh_sh) xm, (SELECT xmid,'水毁' lx,sum(lc) xmlc,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx where xm.xmbm=lx.xmid(+)) t group by t.xzqh,t.jhnf)t1, (select t.xzqh,t.xdnf,sum(xmzj) xmzj,sum(bbz) bbz from (select xm.xmbm,lx.xzqh,xdzj.xdnf,xmzj,bbz from (SELECT xmbm,'水毁' lx from jhsh_sh) xm, (SELECT xmid,'水毁' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT xmID,xdnf,sum(btzzj+stz) xmzj,sum(btzzj) bbz from plan_zjxd group by xmid,xdnf)xdzj where xm.xmbm=lx.xmid(+) and xm.xmbm=xdzj.xmID(+)) t group by t.xzqh,t.xdnf)t2, (select t.xzqh,t.wclcnf,sum(wclc) wclc from (select xm.xmbm,lx.xzqh,wclc.wclcnf,wclc from (SELECT xmbm,'水毁' lx from jhsh_sh) xm, (SELECT xmid,'水毁' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,'水毁' lx,sum(bywcmc) wclc,substr(sbyf,1,4) wclcnf from gcgl_sh tb where to_date(tb.sbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(sbyf,1,4))wclc where xm.xmbm=lx.xmid(+) and xm.xmbm=wclc.jhid(+)) t group by t.xzqh,t.wclcnf)t3, (select t.xzqh,t.wczjnf,sum(wcxmzj) wcxmzj from (select xm.xmbm,lx.xzqh,wczj.wczjnf,wcxmzj from (SELECT xmbm,'水毁' lx from jhsh_sh) xm, (SELECT xmid,'水毁' lx,substr(xzqhdm,1,4) xzqh from lxsh_lx where jdbs='2' group by xmid,substr(xzqhdm,1,4))lx, (SELECT jhid,substr(tbyf,1,4) wczjnf,sum(cgsdwzj+stz) wcxmzj from gcgl_cgs tg where to_date(tg.tbyf,'yyyy-mm')<=to_date('"+gcglwqgz.getYbnf()+"-"+gcglwqgz.getYbyf()+"','yyyy-mm') group by jhid,substr(tbyf,1,4)) wczj where xm.xmbm=lx.xmid(+) and xm.xmbm=wczj.jhid(+)) t group by t.xzqh,t.wczjnf)t4 where t1.xzqh=t2.xzqh(+) and t1.xzqh=t3.xzqh(+) and t1.xzqh=t4.xzqh(+) and t1.jhnf=t2.xdnf(+) and t1.jhnf=t3.wclcnf(+) and t1.jhnf=t4.wczjnf(+) )  group by substr(xzqh,1,2),jhnf order by xzqh,jhnf";
				}
					gcybbServer.createybView(viewsql);
				String[] arr=gcglwqgz.getXmnf().split(",");
				String sql="select xzqhmc";
				String in="";
				for(int j=0;j<arr.length;j++){
					if(j==0)
					    in=in+"'"+arr[j]+"'";
					else
						in=in+",'"+arr[j]+"'";
					sql=sql+",decode(sum(decode(jhnf,'"+arr[j]+"',xmsl)) ,null,0,sum(decode(jhnf,'"+arr[j]+"',xmsl)) )xmsl"+arr[j]+
							",decode(sum(decode(jhnf,'"+arr[j]+"',xmlc)),null,0,sum(decode(jhnf,'"+arr[j]+"',xmlc))) xmlc"+arr[j]+
				        ",decode(sum(decode(jhnf,'"+arr[j]+"',xmzj)),null,0,sum(decode(jhnf,'"+arr[j]+"',xmzj))) xmzj"+arr[j]+
				        ",decode(sum(decode(jhnf,'"+arr[j]+"',wclc)),null,0,sum(decode(jhnf,'"+arr[j]+"',wclc))) wclc"+arr[j]+
				        ",decode(sum(decode(jhnf,'"+arr[j]+"',bbz)),null,0,sum(decode(jhnf,'"+arr[j]+"',bbz))) bbz"+arr[j]+
				        ",decode(sum(decode(jhnf,'"+arr[j]+"',pfztz)),null,0,sum(decode(jhnf,'"+arr[j]+"',pfztz))) pfztz"+arr[j]+
				        ",decode(sum(decode(jhnf,'"+arr[j]+"',bbzorsbz)),null,0,sum(decode(jhnf,'"+arr[j]+"',bbzorsbz))) bbzorsbz"+arr[j]+
				        ",decode(sum(decode(jhnf,'"+arr[j]+"',wcxmzj)),null,0,sum(decode(jhnf,'"+arr[j]+"',wcxmzj))) wcxmzj"+arr[j]+"";
				}
				sql=sql+" from "+tableName+"  where jhnf in("+in+")group by xzqhmc,xzqh order by xzqh";		
				System.out.println(sql);
				list=gcybbServer.getGjxjmxbsj(sql);
				for(int i=0;i<list.size();i++){
					HashMap<String,Object> hm=(HashMap<String, Object>) list.get(i);
					double xmsl=0;
					double xmlc=0;
					double xmzj=0;
					double wclc=0;
					double wcxmzj=0;
					double bbzorsbz=0;
					double bbz=0;
					double pfztz=0;
					for(int j=arr.length-1;j>=0;j--){
						xmsl=xmsl+Double.valueOf(hm.get("XMSL"+arr[j]).toString());
						xmlc=xmlc+Double.valueOf(hm.get("XMLC"+arr[j]).toString());
						xmzj=xmzj+Double.valueOf(hm.get("XMZJ"+arr[j]).toString());
						wclc=wclc+Double.valueOf(hm.get("WCLC"+arr[j]).toString());
						bbz=bbz+Double.valueOf(hm.get("BBZ"+arr[j]).toString());
						//System.out.println(hm.get("PFZTZ"+arr[j]).toString());
						pfztz=pfztz+Double.valueOf(hm.get("PFZTZ"+arr[j]).toString());
						bbzorsbz=bbzorsbz+Double.valueOf(hm.get("BBZORSBZ"+arr[j]).toString());
						wcxmzj=wcxmzj+Double.valueOf(hm.get("WCXMZJ"+arr[j]).toString());
						hm.put("LJWCLC"+arr[j],xmlc);
						hm.put("LJWCBBZ"+arr[j],bbz);
						hm.put("LJWCZJ"+arr[j],wcxmzj);
					}
					//System.out.println(pfztz);
				   hm.put("XMSL",xmsl);
				   hm.put("XMLC",xmlc);
				   hm.put("XMZJ",xmzj);
				   hm.put("WCLC",wclc);
				   hm.put("BBZ",bbz);
				   hm.put("PFZTZ",pfztz);
				   hm.put("WCXMZJ",wcxmzj);
				   hm.put("LJWCBBZ",bbz);
				   hm.put("BBZORSBZ",bbzorsbz);
				   hm.put("LJWCZJ",wcxmzj);
				   hm.put("LJWCLC",wclc);
				   hm.put("XH", i);
				}
				if("flag".equals(flag)){
					String[] nf = gcglwqgz.getXmnf().split(",");
					Arrays.sort(nf);
					List<Excel_list> elist=new ArrayList<Excel_list>();
					int cd=(nf.length+1)*10+3;
					NumberFormat nfs = NumberFormat.getInstance(); 
			        nfs.setRoundingMode(RoundingMode.HALF_UP);//设置四舍五入 
			        nfs.setMinimumFractionDigits(2);//设置最小保留几位小数 
			        nfs.setMaximumFractionDigits(2);//设置最大保留几位小数
					for(int i=0;i<list.size();i++){
						Excel_list l = new Excel_list();
						Class cl = l.getClass();
						if("0".equals(list.get(i).get("XH").toString())){
							Method method = cl.getMethod("setV_"+0, new Class[]{String.class});
							method.invoke(l, new Object[]{list.get(i).get("XZQHMC").toString()});
						}else{
							Method method = cl.getMethod("setV_"+0, new Class[]{String.class});
							method.invoke(l, new Object[]{list.get(i).get("XH").toString()});
						}
						
						Method method1 = cl.getMethod("setV_"+1, new Class[]{String.class});
						method1.invoke(l, new Object[]{list.get(i).get("XZQHMC").toString()});
						Method method2 = cl.getMethod("setV_"+2, new Class[]{String.class});
						method2.invoke(l, new Object[]{gcglwqgz.getTiaojian()});
						Method method3 = cl.getMethod("setV_"+3, new Class[]{String.class});
						method3.invoke(l, new Object[]{list.get(i).get("XMSL").toString().substring(0, list.get(i).get("XMSL").toString().length()-2)});
						Method method4 = cl.getMethod("setV_"+4, new Class[]{String.class});
						method4.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("XMLC").toString()))});
						Method method5 = cl.getMethod("setV_"+5, new Class[]{String.class});
						method5.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("BBZORSBZ").toString()))});
						Method method6 = cl.getMethod("setV_"+6, new Class[]{String.class});
						method6.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("PFZTZ").toString()))});
						Method method7 = cl.getMethod("setV_"+7, new Class[]{String.class});
						method7.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCLC").toString()))});
						Method method8 = cl.getMethod("setV_"+8, new Class[]{String.class});
						method8.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("LJWCLC").toString()))});
						Method method9 = cl.getMethod("setV_"+9, new Class[]{String.class});
						method9.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("BBZ").toString()))});
						Method method10 = cl.getMethod("setV_"+10, new Class[]{String.class});
						method10.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("LJWCBBZ").toString()))});
						Method method11 = cl.getMethod("setV_"+11, new Class[]{String.class});
						method11.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCXMZJ").toString()))});
						Method method12 = cl.getMethod("setV_"+12, new Class[]{String.class});
						method12.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("LJWCZJ").toString()))});
						int k=13;
						for (int j = 0; j < nf.length; j++) {
							Method method13 = cl.getMethod("setV_"+k, new Class[]{String.class});
							method13.invoke(l, new Object[]{list.get(i).get("XMSL"+nf[j]).toString()});
							Method method14 = cl.getMethod("setV_"+(k+1), new Class[]{String.class});
							method14.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("XMLC"+nf[j]).toString()))});
							Method method15 = cl.getMethod("setV_"+(k+2), new Class[]{String.class});
							method15.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("BBZORSBZ"+nf[j]).toString()))});
							Method method16 = cl.getMethod("setV_"+(k+3), new Class[]{String.class});
							method16.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("PFZTZ"+nf[j]).toString()))});
							Method method17 = cl.getMethod("setV_"+(k+4), new Class[]{String.class});
							method17.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCLC"+nf[j]).toString()))});
							Method method18 = cl.getMethod("setV_"+(k+5), new Class[]{String.class});
							method18.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("LJWCLC"+nf[j]).toString()))});
							Method method19 = cl.getMethod("setV_"+(k+6), new Class[]{String.class});
							method19.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("BBZ"+nf[j]).toString()))});
							Method method20 = cl.getMethod("setV_"+(k+7), new Class[]{String.class});
							method20.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("LJWCBBZ"+nf[j]).toString()))});
							Method method21 = cl.getMethod("setV_"+(k+8), new Class[]{String.class});
							method21.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("WCXMZJ"+nf[j]).toString()))});
							Method method22 = cl.getMethod("setV_"+(k+9), new Class[]{String.class});
							method22.invoke(l, new Object[]{nfs.format(Double.parseDouble(list.get(i).get("LJWCZJ"+nf[j]).toString()))});
							k+=10;
						}
						Method method23 = cl.getMethod("setV_"+cd, new Class[]{String.class});
						method23.invoke(l, new Object[]{""});
						elist.add(l);
					}
					elist=qddh(elist);
					//把数据放入elist
					ExcelData eldata=new ExcelData();//创建一个类
					eldata.setTitleName("公路改造工程新上、续建工程项目完成情况汇总表");//设置第一行 
					eldata.setSheetName("完成情况表");//设置sheeet名
					eldata.setFileName("公路改造工程新上、续建工程项目完成情况汇总表");//设置文件名
					eldata.setEl(elist);//将实体list放入类中
					List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
					et.add(new Excel_tilte("序号",1,3,0,0));
					et.add(new Excel_tilte("设区市",1,3,1,1));
					et.add(new Excel_tilte("项目类型",1,3,2,2));
					et.add(new Excel_tilte("计划下达及完成情况",1,1,3,12));
					int sj1=13;
					for (int i = 0; i < nf.length; i++) {
						et.add(new Excel_tilte("计划下达及完成情况",1,1,sj1,sj1+9));
						sj1=sj1+10;
					}
					et.add(new Excel_tilte("备注",1,3,sj1,sj1));
					et.add(new Excel_tilte(nf[0]+"-"+nf[nf.length-1]+"年度",2,2,3,6));
					et.add(new Excel_tilte("本年完成里程(公里)",2,3,7,7));
					et.add(new Excel_tilte("累计完成里程(公里)",2,3,8,8));
					et.add(new Excel_tilte("本年车购税到位(万元)",2,3,9,9));
					et.add(new Excel_tilte("累计车购税到位(万元)",2,3,10,10));
					et.add(new Excel_tilte("本年完成投资(万元)",2,3,11,11));
					et.add(new Excel_tilte("累计完成投资(万元)",2,3,12,12));
					int sj2=13;
					for (int i = 0; i < nf.length; i++) {
						et.add(new Excel_tilte(nf[i]+"年度",2,2,sj2,sj2+3));
						et.add(new Excel_tilte("本年完成里程(公里)",2,3,sj2+4,sj2+4));
						et.add(new Excel_tilte("累计完成里程(公里)",2,3,sj2+5,sj2+5));
						et.add(new Excel_tilte("本年车购税到位(万元)",2,3,sj2+6,sj2+6));
						et.add(new Excel_tilte("累计车购税到位(万元)",2,3,sj2+7,sj2+7));
						et.add(new Excel_tilte("本年完成投资(万元)",2,3,sj2+8,sj2+8));
						et.add(new Excel_tilte("累计完成投资(万元)",2,3,sj2+9,sj2+9));
						sj2=sj2+10;
					}
					et.add(new Excel_tilte("项目数量",3,3,3,3));
					et.add(new Excel_tilte("计划里程(公里)",3,3,4,4));
					et.add(new Excel_tilte("中央或省统筹资金(万元)含续建",3,3,5,5));
					et.add(new Excel_tilte("计划总投资",3,3,6,6));
					int sj3=13;
					for (int i = 0; i < nf.length; i++) {
						et.add(new Excel_tilte("项目数量",3,3,sj3,sj3));
						et.add(new Excel_tilte("计划里程(公里)",3,3,sj3+1,sj3+1));
						et.add(new Excel_tilte("中央或省统筹资金(万元)含续建",3,3,sj3+2,sj3+2));
						et.add(new Excel_tilte("计划总投资",3,3,sj3+3,sj3+3));
						sj3=sj3+10;
					}
					eldata.setEt(et);//将表头内容设置到类里面
					HttpServletResponse response= getresponse();//获得一个HttpServletResponse
					Excel_export.excel_exportmxb(eldata,response);
					
				}else
				JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	} 
	
	//weiqiao
	public void getWqgzjsb(){
		String tiaojian1="";
		String tiaojian2="";
		String xzqhdm = "";
		String gydwdm = "";
		if("flag".equals(flag)){
			HttpServletRequest request = ServletActionContext.getRequest();
			HttpSession session = request.getSession();
			gydwdm=(String) session.getAttribute("gydwbb");	
			xzqhdm=(String) session.getAttribute("xzqhbb");	
		}else{
		gydwdm = gydw;
		xzqhdm	= xzqh;
		}
		if(gydwdm.indexOf(",")==-1){
			tiaojian1="and gydw like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
		}else{
			tiaojian1="and gydw in ("+gydwdm+")";
		}
		if(xzqhdm.indexOf(",")==-1){
			tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
		}else{
			tiaojian2="and xzqhdm in ("+xzqhdm+")";
		}
		gcglwqgz.setSbyf(nf);
		gcglwqgz.setGydw(tiaojian1);
		gcglwqgz.setTiaojian(xzdj);
		gcglwqgz.setXzqhdm(tiaojian2);
		gcglwqgz.setXmnf(xmnf);
		if("flag".equals(flag)){
			List<Excel_list> list1=gcybbServer.getWqgzJsb1(gcglwqgz);
			for (int i = 0; i < list1.size(); i++) {
				list1.get(i).setV_0(i+1+"");
			}
			List<Excel_list>  l=new ArrayList<Excel_list>();
			Excel_list elis=new Excel_list();
			elis.setV_0("1");elis.setV_1("2");elis.setV_2("3");elis.setV_3("4");elis.setV_4("5");elis.setV_5("6");elis.setV_6("7");elis.setV_7("8");elis.setV_8("9");elis.setV_9("10");
			elis.setV_10("11");elis.setV_11("12");elis.setV_12("13");elis.setV_13("14");elis.setV_14("15");elis.setV_15("16");elis.setV_16("17");elis.setV_17("18");elis.setV_18("19");elis.setV_19("20");
			elis.setV_20("21");elis.setV_21("22");elis.setV_22("23");elis.setV_23("24");elis.setV_24("25");elis.setV_25("26");elis.setV_26("27");elis.setV_27("28");elis.setV_28("29");elis.setV_29("30");
			elis.setV_30("31");elis.setV_31("32");elis.setV_32("33");elis.setV_33("34");elis.setV_34("35");elis.setV_35("36");elis.setV_36("37");elis.setV_37("38");elis.setV_38("39");elis.setV_39("40");
			elis.setV_40("41");elis.setV_41("42");elis.setV_42("43");elis.setV_43("44");elis.setV_44("45");elis.setV_45("46");elis.setV_46("47");elis.setV_47("48");elis.setV_48("49");elis.setV_49("50");
			elis.setV_50("51");elis.setV_51("52");elis.setV_52("53");elis.setV_53(" ");
			l.add(elis);
			l.addAll(list1);
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("市农村公路危桥改造工程项目建设表");//设置第一行
				eldata.setSheetName("危桥");//设置sheeet名
				eldata.setFileName("市农村公路危桥改造工程项目建设表");//设置文件名
				eldata.setEl(l);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,3,0,0));
				et.add(new Excel_tilte("县（市、区）",1,3,1,1));
				et.add(new Excel_tilte("是否17个罗宵山区连片特困县",1,3,2,2));
				et.add(new Excel_tilte("是否38个原中央苏区和特困片区县",1,3,3,3));
				et.add(new Excel_tilte("是否54个赣南等原中央苏区县",1,3,4,4));
				et.add(new Excel_tilte("计划情况",1,1,5,22));
				et.add(new Excel_tilte("建设进展情况",1,1,23,42));
				et.add(new Excel_tilte("资金落实情况",1,1,43,52));
				et.add(new Excel_tilte("备注",1,3,53,53));
				et.add(new Excel_tilte("行政区划代码",2,3,5,5));
				et.add(new Excel_tilte("行政区划名称",2,3,6,6));
				et.add(new Excel_tilte("路线编码",2,3,7,7));
				et.add(new Excel_tilte("路线名称",2,3,8,8));
				et.add(new Excel_tilte("桥梁桩号",2,3,9,9));
				et.add(new Excel_tilte("桥梁编码",2,3,10,10));
				et.add(new Excel_tilte("桥梁名称",2,3,11,11));
				et.add(new Excel_tilte("计划下达时间",2,3,12,12));
				et.add(new Excel_tilte("计划开工时间",2,3,13,13));
				et.add(new Excel_tilte("计划完成时间",2,3,14,14));
				et.add(new Excel_tilte("预计竣工时间",2,3,15,15));
				et.add(new Excel_tilte("桥长(延米)",2,3,16,16));
				et.add(new Excel_tilte("宽度(米)",2,3,17,17));
				et.add(new Excel_tilte("建设性质",2,3,18,18));
				et.add(new Excel_tilte("施工图批复文号",2,3,19,19));
				et.add(new Excel_tilte("总投资(万元)",2,3,20,20));
				et.add(new Excel_tilte("其中中央投资(万元)",2,3,21,21));
				et.add(new Excel_tilte("其中省补资金(万元)",2,3,22,22));
				et.add(new Excel_tilte("实际开工时间",2,3,23,23));
				et.add(new Excel_tilte("工程竣工时间",2,3,24,24));
				et.add(new Excel_tilte("建设单位",2,3,25,25));
				et.add(new Excel_tilte("设计单位",2,3,26,26));
				et.add(new Excel_tilte("施工单位",2,3,27,27));
				et.add(new Excel_tilte("监理单位",2,3,28,28));
				et.add(new Excel_tilte("实际建成桥长（米）",2,3,29,29));
				et.add(new Excel_tilte("实际建成桥宽（米）",2,3,30,30));
				et.add(new Excel_tilte("是否本年完成",2,3,31,31));
				et.add(new Excel_tilte("在建(座)",2,3,32,32));
				et.add(new Excel_tilte("延米",2,3,33,33));
				et.add(new Excel_tilte("未开工(座)",2,3,34,34));
				et.add(new Excel_tilte("延米",2,3,35,35));
				et.add(new Excel_tilte("完成总投资（万元）",2,3,36,36));
				et.add(new Excel_tilte("完成中央投资(万元)",2,3,37,37));
				et.add(new Excel_tilte("完成地方自筹(万元)",2,3,38,38));
				et.add(new Excel_tilte("本年完成投资（万元）",2,3,39,39));
				et.add(new Excel_tilte("未完成原因",2,3,40,40));
				et.add(new Excel_tilte("是否交工验收",2,3,41,41));
				et.add(new Excel_tilte("是否拆除老桥",2,3,42,42));
				et.add(new Excel_tilte("车购税补助资金",2,2,43,45));
				et.add(new Excel_tilte("省级补助资金",2,2,46,48));
				et.add(new Excel_tilte("地方配套资金",2,2,49,51));
				et.add(new Excel_tilte("以奖代补资金(万元)",2,3,52,52));
				et.add(new Excel_tilte("计划补助资金",3,3,43,43));
				et.add(new Excel_tilte("到位金额(万元)",3,3,44,44));
				et.add(new Excel_tilte("到位率(%)",3,3,45,45));
				et.add(new Excel_tilte("计划补助资金",3,3,46,46));
				et.add(new Excel_tilte("到位金额(万元)",3,3,47,47));
				et.add(new Excel_tilte("到位率(%)",3,3,48,48));
				et.add(new Excel_tilte("应配套资金(万元)",3,3,49,49));
				et.add(new Excel_tilte("到位金额(万元)",3,3,50,50));
				et.add(new Excel_tilte("到位率(%)",3,3,51,51));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				try {
					Excel_export.excel_export(eldata,response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		else{
			try {
				List<Map<String, Object>> list=gcybbServer.getWqgzJsb(gcglwqgz);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	//anbao
		public void getAbgcjsb(){
			String tiaojian1="";
			String tiaojian2="";
			String xzqhdm = "";
			String gydwdm = "";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
			}else{
			gydwdm = gydw;
			xzqhdm	= xzqh;
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydw like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and gydw in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqhdm+")";
			}
			gcglwqgz.setSbyf(nf);
			gcglwqgz.setGydw(tiaojian1);
			gcglwqgz.setTiaojian(xzdj);
			gcglwqgz.setXzqhdm(tiaojian2);
			gcglwqgz.setXmnf(xmnf);
			if("flag".equals(flag)){
				List<Excel_list> list=gcybbServer.getAbgcJsb1(gcglwqgz);
				for (int i = 0; i < list.size(); i++) {
					list.get(i).setV_0(i+1+"");
				}
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("市农村公路安保工程项目建设表");//设置第一行
				eldata.setSheetName("安保");//设置sheeet名
				eldata.setFileName("市农村公路安保工程项目建设表");//设置文件名
				eldata.setEl(list);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,3,0,0));
				et.add(new Excel_tilte("县（市、区）",1,3,1,1));
				et.add(new Excel_tilte("是否17个罗宵山区连片特困县",1,3,2,2));
				et.add(new Excel_tilte("是否38个原中央苏区和特困片区县",1,3,3,3));
				et.add(new Excel_tilte("是否54个赣南等原中央苏区县",1,3,4,4));
				et.add(new Excel_tilte("计划情况",1,1,5,18));
				et.add(new Excel_tilte("建设进展情况",1,1,19,31));
				et.add(new Excel_tilte("资金落实情况",1,1,32,37));
				et.add(new Excel_tilte("备注",1,3,38,38));
				et.add(new Excel_tilte("行政区划代码",2,3,5,5));
				et.add(new Excel_tilte("行政区划名称",2,3,6,6));
				et.add(new Excel_tilte("路线编码",2,3,7,7));
				et.add(new Excel_tilte("路线名称",2,3,8,8));
				et.add(new Excel_tilte("起点桩号",2,3,9,9));
				et.add(new Excel_tilte("止点桩号",2,3,10,10));
				et.add(new Excel_tilte("处理隐患里程（公里）",2,3,11,11));
				et.add(new Excel_tilte("建设性质",2,3,12,12));
				et.add(new Excel_tilte("计划下达时间",2,3,13,13));
				et.add(new Excel_tilte("计划开工时间",2,3,14,14));
				et.add(new Excel_tilte("计划完成时间",2,3,15,15));
				et.add(new Excel_tilte("预计竣工时间",2,3,16,16));
				et.add(new Excel_tilte("总投资(万元)",2,3,17,17));
				et.add(new Excel_tilte("其中中央投资(万元)",2,3,18,18));
				et.add(new Excel_tilte("实际开工时间",2,3,19,19));
				et.add(new Excel_tilte("工程竣工时间",2,3,20,20));
				et.add(new Excel_tilte("建设单位",2,3,21,21));
				et.add(new Excel_tilte("设计单位",2,3,22,22));
				et.add(new Excel_tilte("施工单位",2,3,23,23));
				et.add(new Excel_tilte("监理单位",2,3,24,24));
				et.add(new Excel_tilte("完成总里程（公里）",2,3,25,25));
				et.add(new Excel_tilte("本年完成里程（公里）",2,3,26,26));
				et.add(new Excel_tilte("完成总投资（万元）",2,3,27,27));
				et.add(new Excel_tilte("完成中央投资(万元)",2,3,28,28));
				et.add(new Excel_tilte("完成地方自筹(万元)",2,3,29,29));
				et.add(new Excel_tilte("本年完成投资（万元）",2,3,30,30));
				et.add(new Excel_tilte("项目验收里程(公里)",2,3,31,31));
				et.add(new Excel_tilte("车购税补助资金",2,2,32,34));
				et.add(new Excel_tilte("地方配套资金",2,2,35,37));
				et.add(new Excel_tilte("计划补助资金",3,3,32,32));
				et.add(new Excel_tilte("到位金额(万元)",3,3,33,33));
				et.add(new Excel_tilte("到位率(%)",3,3,34,34));
				et.add(new Excel_tilte("应配套资金(万元)",3,3,35,35));
				et.add(new Excel_tilte("到位金额(万元)",3,3,36,36));
				et.add(new Excel_tilte("到位率(%)",3,3,37,37));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				try {
					Excel_export.excel_export(eldata,response);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			try {
				List<Map<String, Object>> list=gcybbServer.getAbgcJsb(gcglwqgz);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//去掉逗号
		public List<Excel_list> qddh(List<Excel_list> list){
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setV_0(list.get(i).getV_0()==null? " ":list.get(i).getV_0().replaceAll(",", ""));
				list.get(i).setV_1(list.get(i).getV_1()==null? " ":list.get(i).getV_1().replaceAll(",", ""));
				list.get(i).setV_2(list.get(i).getV_2()==null? " ":list.get(i).getV_2().replaceAll(",", ""));
				list.get(i).setV_3(list.get(i).getV_3()==null? " ":list.get(i).getV_3().replaceAll(",", ""));
				list.get(i).setV_4(list.get(i).getV_4()==null? " ":list.get(i).getV_4().replaceAll(",", ""));
				list.get(i).setV_5(list.get(i).getV_5()==null? " ":list.get(i).getV_5().replaceAll(",", ""));
				list.get(i).setV_6(list.get(i).getV_6()==null? " ":list.get(i).getV_6().replaceAll(",", ""));
				list.get(i).setV_7(list.get(i).getV_7()==null? " ":list.get(i).getV_7().replaceAll(",", ""));
				list.get(i).setV_8(list.get(i).getV_8()==null? " ":list.get(i).getV_8().replaceAll(",", ""));
				list.get(i).setV_9(list.get(i).getV_9()==null? " ":list.get(i).getV_9().replaceAll(",", ""));
				list.get(i).setV_10(list.get(i).getV_10()==null? " ":list.get(i).getV_10().replaceAll(",", ""));
				list.get(i).setV_11(list.get(i).getV_11()==null? " ":list.get(i).getV_11().replaceAll(",", ""));
				list.get(i).setV_12(list.get(i).getV_12()==null? " ":list.get(i).getV_12().replaceAll(",", ""));
				list.get(i).setV_13(list.get(i).getV_13()==null? " ":list.get(i).getV_13().replaceAll(",", ""));
				list.get(i).setV_14(list.get(i).getV_14()==null? " ":list.get(i).getV_14().replaceAll(",", ""));
				list.get(i).setV_15(list.get(i).getV_15()==null? " ":list.get(i).getV_15().replaceAll(",", ""));
				list.get(i).setV_16(list.get(i).getV_16()==null? " ":list.get(i).getV_16().replaceAll(",", ""));
				list.get(i).setV_17(list.get(i).getV_17()==null? " ":list.get(i).getV_17().replaceAll(",", ""));
				list.get(i).setV_18(list.get(i).getV_18()==null? " ":list.get(i).getV_18().replaceAll(",", ""));
				list.get(i).setV_19(list.get(i).getV_19()==null? " ":list.get(i).getV_19().replaceAll(",", ""));
				list.get(i).setV_20(list.get(i).getV_20()==null? " ":list.get(i).getV_20().replaceAll(",", ""));
				list.get(i).setV_21(list.get(i).getV_21()==null? " ":list.get(i).getV_21().replaceAll(",", ""));
				list.get(i).setV_22(list.get(i).getV_22()==null? " ":list.get(i).getV_22().replaceAll(",", ""));
				list.get(i).setV_23(list.get(i).getV_23()==null? " ":list.get(i).getV_23().replaceAll(",", ""));
				list.get(i).setV_24(list.get(i).getV_24()==null? " ":list.get(i).getV_24().replaceAll(",", ""));
				list.get(i).setV_25(list.get(i).getV_25()==null? " ":list.get(i).getV_25().replaceAll(",", ""));
				list.get(i).setV_26(list.get(i).getV_26()==null? " ":list.get(i).getV_26().replaceAll(",", ""));
				list.get(i).setV_27(list.get(i).getV_27()==null? " ":list.get(i).getV_27().replaceAll(",", ""));
				list.get(i).setV_28(list.get(i).getV_28()==null? " ":list.get(i).getV_28().replaceAll(",", ""));
				list.get(i).setV_29(list.get(i).getV_29()==null? " ":list.get(i).getV_29().replaceAll(",", ""));
				list.get(i).setV_30(list.get(i).getV_30()==null? " ":list.get(i).getV_30().replaceAll(",", ""));
				list.get(i).setV_31(list.get(i).getV_31()==null? " ":list.get(i).getV_31().replaceAll(",", ""));
				list.get(i).setV_32(list.get(i).getV_32()==null? " ":list.get(i).getV_32().replaceAll(",", ""));
				list.get(i).setV_33(list.get(i).getV_33()==null? " ":list.get(i).getV_33().replaceAll(",", ""));
				list.get(i).setV_34(list.get(i).getV_34()==null? " ":list.get(i).getV_34().replaceAll(",", ""));
				list.get(i).setV_35(list.get(i).getV_35()==null? " ":list.get(i).getV_35().replaceAll(",", ""));
				list.get(i).setV_36(list.get(i).getV_36()==null? " ":list.get(i).getV_36().replaceAll(",", ""));
				list.get(i).setV_37(list.get(i).getV_37()==null? " ":list.get(i).getV_37().replaceAll(",", ""));
				list.get(i).setV_38(list.get(i).getV_38()==null? " ":list.get(i).getV_38().replaceAll(",", ""));
				list.get(i).setV_39(list.get(i).getV_39()==null? " ":list.get(i).getV_39().replaceAll(",", ""));
				list.get(i).setV_40(list.get(i).getV_40()==null? " ":list.get(i).getV_40().replaceAll(",", ""));
				list.get(i).setV_41(list.get(i).getV_41()==null? " ":list.get(i).getV_41().replaceAll(",", ""));
				list.get(i).setV_42(list.get(i).getV_42()==null? " ":list.get(i).getV_42().replaceAll(",", ""));
				list.get(i).setV_43(list.get(i).getV_43()==null? " ":list.get(i).getV_43().replaceAll(",", ""));
				list.get(i).setV_44(list.get(i).getV_44()==null? " ":list.get(i).getV_44().replaceAll(",", ""));
				list.get(i).setV_45(list.get(i).getV_45()==null? " ":list.get(i).getV_45().replaceAll(",", ""));
				list.get(i).setV_46(list.get(i).getV_46()==null? " ":list.get(i).getV_46().replaceAll(",", ""));
				list.get(i).setV_47(list.get(i).getV_47()==null? " ":list.get(i).getV_47().replaceAll(",", ""));
				list.get(i).setV_48(list.get(i).getV_48()==null? " ":list.get(i).getV_48().replaceAll(",", ""));
				list.get(i).setV_49(list.get(i).getV_49()==null? " ":list.get(i).getV_49().replaceAll(",", ""));
			}
			return list;
		}
		
		//危桥计划
		public void getWqgzjh(){
			String tiaojian1="";
			String tiaojian2="";
			String xzqhdm = "";
			String gydwdm = "";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
			}else{
			gydwdm = gydw;
			xzqhdm = xzqh;
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqhdm+")";
			}
			gcglwqgz.setGydw(tiaojian1);
			gcglwqgz.setTiaojian(xzdj);
			gcglwqgz.setXzqhdm(tiaojian2);
			gcglwqgz.setXmnf(xmnf);
			gcglwqgz.setSfylrbwqk(sfylrbwqk);
			List<Excel_list> list=gcybbServer.getWqgzjh(gcglwqgz);
			if("flag".equals(flag)){
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName(xmnf+"年公路路网结构改造工程建设计划（危桥改造项目）");//设置第一行
				eldata.setSheetName("危桥");//设置sheeet名
				eldata.setFileName(xmnf+"年公路路网结构改造工程建设计划（危桥改造项目）");//设置文件名
				eldata.setEl(list);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,1,0,0));
				et.add(new Excel_tilte("设区市",1,1,1,1));
				et.add(new Excel_tilte("县（市、区）",1,1,2,2));
				et.add(new Excel_tilte("乡镇名称",1,1,3,3));
				et.add(new Excel_tilte("桥梁编码",1,1,4,4));
				et.add(new Excel_tilte("桥梁名称",1,1,5,5));
				et.add(new Excel_tilte("桥长（米）",1,1,6,6));
				et.add(new Excel_tilte("桥宽（米）",1,1,7,7));
				et.add(new Excel_tilte("建设性质",1,1,8,8));
				et.add(new Excel_tilte("建设内容",1,1,9,9));
				et.add(new Excel_tilte("总投资（万元）",1,1,10,10));
				et.add(new Excel_tilte("安排省级补助资金（万元）",1,1,11,11));
				et.add(new Excel_tilte("地方自筹资金  （万元）",1,1,12,12));
				et.add(new Excel_tilte("开工年",1,1,13,13));
				et.add(new Excel_tilte("完工年",1,1,14,14));
				et.add(new Excel_tilte("路线编码",1,1,15,15));
				et.add(new Excel_tilte("路线名称",1,1,16,16));
				et.add(new Excel_tilte("中心桩号",1,1,17,17));
				et.add(new Excel_tilte("批复文号",1,1,18,18));
				et.add(new Excel_tilte("本年完成情况(总投资)",1,1,19,19));
				et.add(new Excel_tilte("本年完成情况(省投资)",1,1,20,20));
				et.add(new Excel_tilte("备注",1,1,21,21));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				try {
					Excel_export.excel_exportwqjh(eldata,response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				try {
					JsonUtils.write(list, getresponse().getWriter());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		
		//abjh
		public void getAbgcjh(){
			String tiaojian1="";
			String tiaojian2="";
			String xzqhdm = "";
			String gydwdm = "";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
			}else{
			gydwdm = gydw;
			xzqhdm = xzqh;
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqhdm+")";
			}
			gcglwqgz.setGydw(tiaojian1);
			gcglwqgz.setTiaojian(xzdj);
			gcglwqgz.setXzqhdm(tiaojian2);
			gcglwqgz.setXmnf(xmnf);
			List<Excel_list> list=gcybbServer.getAbgcjh(gcglwqgz);
			if("flag".equals(flag)){
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName(xmnf+"年公路路网结构改造工程建设计划（安全生命防护工程）");//设置第一行
				eldata.setSheetName("安保");//设置sheeet名
				eldata.setFileName(xmnf+"年公路路网结构改造工程建设计划（安全生命防护工程）");//设置文件名
				eldata.setEl(list);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,2,0,0));
				et.add(new Excel_tilte("行政区划代码",1,2,1,1));
				et.add(new Excel_tilte("管养单位",1,2,2,2));
				et.add(new Excel_tilte("项目名称",1,1,3,6));
				et.add(new Excel_tilte("建设性质",1,2,7,7));
				et.add(new Excel_tilte("处治隐患里程（公里）",1,2,8,8));
				et.add(new Excel_tilte("建设年限",1,1,9,10));
				et.add(new Excel_tilte("总投资（万元）",1,2,11,11));
				et.add(new Excel_tilte("中央投资（万元）",1,2,12,12));
				et.add(new Excel_tilte(xmnf+"年 计 划 （ 万 元 ）",1,1,13,16));
				et.add(new Excel_tilte("本年完成情况(总投资)",1,2,17,17));
				et.add(new Excel_tilte("本年完成情况(省投资)",1,2,18,18));
				et.add(new Excel_tilte("备注",1,2,19,19));
				et.add(new Excel_tilte("路线编号",2,2,3,3));
				et.add(new Excel_tilte("项目名称",2,2,4,4));
				et.add(new Excel_tilte("起点桩号",2,2,5,5));
				et.add(new Excel_tilte("止点桩号",2,2,6,6));
				et.add(new Excel_tilte("开工年",2,2,9,9));
				et.add(new Excel_tilte("完工年",2,2,10,10));
				et.add(new Excel_tilte("合计",2,2,13,13));
				et.add(new Excel_tilte("中央投资车购税",2,2,14,14));
				et.add(new Excel_tilte("地方自筹",2,2,15,15));
				et.add(new Excel_tilte("主要建设内容",2,2,16,16));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				try {
					Excel_export.excel_exportabjh(eldata,response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				try {
					JsonUtils.write(list, getresponse().getWriter());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}
		
		public void getWqgzjy(){
			String tiaojian1="";
			String tiaojian2="";
			String xzqhdm = "";
			String gydwdm = "";
			if("flag".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
			}else{
			gydwdm = gydw;
			xzqhdm = xzqh;
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and gydwbm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and gydwbm in ("+gydwdm+")";
			}
			if(xzqhdm.indexOf(",")==-1){
				tiaojian2="and xzqhdm like '%"+xzqhdm+"%'";
			}else{
				tiaojian2="and xzqhdm in ("+xzqhdm+")";
			}
			gcglwqgz.setGydw(tiaojian1);
			gcglwqgz.setTiaojian(xzdj);
			gcglwqgz.setXzqhdm(tiaojian2);
			gcglwqgz.setXmnf(xmnf);
			gcglwqgz.setSfylrbwqk(sfylrbwqk);
			List<Excel_list> list=gcybbServer.getWqgzjy(gcglwqgz);
			if("flag".equals(flag)){
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName(xmnf+"年农村公路危桥改造工程建议计划（第二批）");//设置第一行
				eldata.setSheetName("危桥");//设置sheeet名
				eldata.setFileName(xmnf+"年农村公路危桥改造工程建议计划（第二批）");//设置文件名
				eldata.setEl(list);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("序号",1,1,0,0));
				et.add(new Excel_tilte("设区市",1,1,1,1));
				et.add(new Excel_tilte("县（市、区）",1,1,2,2));
				et.add(new Excel_tilte("路线编码",1,1,3,3));
				et.add(new Excel_tilte("路线名称",1,1,4,4));
				et.add(new Excel_tilte("桥梁编码",1,1,5,5));
				et.add(new Excel_tilte("桥梁名称",1,1,6,6));
				et.add(new Excel_tilte("中心桩号",1,1,7,7));
				et.add(new Excel_tilte("设计单位",1,1,8,8));
				et.add(new Excel_tilte("设计批复单位",1,1,9,9));
				et.add(new Excel_tilte("批复文号",1,1,10,10));
				et.add(new Excel_tilte("批复总投资（万元）",1,1,11,11));
				et.add(new Excel_tilte("计划使用部（省）补助金额（万元）",1,1,12,12));
				et.add(new Excel_tilte("计划使用地方自筹资金（万元）",1,1,13,13));
				et.add(new Excel_tilte("是否申请按比例补助",1,1,14,14));
				et.add(new Excel_tilte("按比例补助申请文号",1,1,15,15));
				et.add(new Excel_tilte("建设性质",1,1,16,16));
				et.add(new Excel_tilte("建设内容",1,1,17,17));
				et.add(new Excel_tilte("开工年",1,1,18,18));
				et.add(new Excel_tilte("完工年",1,1,19,19));
				et.add(new Excel_tilte("设区市名称",1,1,20,20));
				et.add(new Excel_tilte("县市区名称",1,1,21,21));
				et.add(new Excel_tilte("乡镇名称",1,1,22,22));
				et.add(new Excel_tilte("预算60%（万元）",1,1,23,23));
				et.add(new Excel_tilte("按定额计算（万元）",1,1,24,24));
				et.add(new Excel_tilte("实际补助（万元）",1,1,25,25));
				et.add(new Excel_tilte("桥长（米）",1,1,26,26));
				et.add(new Excel_tilte("桥宽（米）",1,1,27,27));
				et.add(new Excel_tilte("备注",1,1,28,28));
				
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				try {
					Excel_export.excel_exportwqjh(eldata,response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else{
				try {
					JsonUtils.write(list, getresponse().getWriter());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

		}
		
		public void getGlgzxj(){
			try {
			String shijian=nf+"-"+yf;
			gcglabgc.setSbyf(shijian);
			String tiaojian1="";
			String tiaojian2="";
			String xzqhdm = "";
			String gydwdm = "";
			if("1".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
				xzqhdm=(String) session.getAttribute("xzqhbb");	
			}else{
			gydwdm = gydw;
			xzqhdm	= xzqh;
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
			gcglabgc.setGydw(tiaojian1);
			gcglabgc.setLxmc(lxmc);
			gcglabgc.setTiaojian(xzdj);
			gcglabgc.setXzqhdm(tiaojian2);
			gcglabgc.setXmnf(xmnf);
			gcglabgc.setXmmc(xmmc);
			//查总合list
			
			List<Excel_list> list1=gcybbServer.getGlgzxj(gcglabgc);
			
			if("1".equals(flag)){
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("公路改造工程新上、续建工程项目完成情况明细表");//设置第一行
				eldata.setSheetName("明细表");//设置sheeet名
				eldata.setFileName("公路改造工程新上、续建工程项目完成情况明细表");//设置文件名
				eldata.setEl(list1);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("一、 项 目 计 划",1,1,0,23));
				et.add(new Excel_tilte("二、 本年元月至本月完成情况",1,1,24,41));
				et.add(new Excel_tilte("三、本月进展情况",1,1,42,44));
				et.add(new Excel_tilte("四、 自开工至本月底累计完成情况",1,1,45,65));
				et.add(new Excel_tilte("备注",1,4,66,66));
				et.add(new Excel_tilte("序号",2,4,0,0));
				et.add(new Excel_tilte("计划唯一编码",2,4,1,1));
				et.add(new Excel_tilte("项目所在地市",2,4,2,2));
				et.add(new Excel_tilte("项目所在县市",2,4,3,3));
				et.add(new Excel_tilte("路线编码、项目名称",2,4,4,4));
				et.add(new Excel_tilte("计划年度",2,4,5,5));
				et.add(new Excel_tilte("行政等级",2,4,6,6));
				et.add(new Excel_tilte("起点桩号",2,4,7,7));
				et.add(new Excel_tilte("止点桩号",2,4,8,8));
				et.add(new Excel_tilte("原技术等级",2,4,9,9));
				et.add(new Excel_tilte("建设技术标准",2,4,10,10));
				et.add(new Excel_tilte("公路建设类型",2,4,11,11));
				et.add(new Excel_tilte("项目里程（公里）",2,4,12,12));
				et.add(new Excel_tilte("总投资（万元）",2,4,13,13));
				et.add(new Excel_tilte("中央车购税（万元）",2,4,14,14));
				et.add(new Excel_tilte("地方配套（万元）",2,4,15,15));
				et.add(new Excel_tilte("本年度计划投资（万元）",2,4,16,16));
				et.add(new Excel_tilte("",2,2,17,17));
				et.add(new Excel_tilte("本年实施里程(公里)",2,4,18,18));
				et.add(new Excel_tilte("项目在建个数（个）",2,4,19,19));
				et.add(new Excel_tilte("项目完工个数（个）",2,4,20,20));
				et.add(new Excel_tilte("项目未开工个数（个）",2,4,21,21));
				et.add(new Excel_tilte("开工时间",2,4,22,22));
				et.add(new Excel_tilte("完工时间",2,4,23,23));
				et.add(new Excel_tilte("累计资金到位（万 元）",2,2,24,31));
				et.add(new Excel_tilte("项目完成投资(万元)",2,4,32,32));
				et.add(new Excel_tilte("占投资比例（%）",2,4,33,33));
				et.add(new Excel_tilte("完 成 工 程 量（公里)",2,2,34,41));
				et.add(new Excel_tilte("新增资金到位（万元）",2,4,42,42));
				et.add(new Excel_tilte("新增完成工程量（公里）",2,4,43,43));
				et.add(new Excel_tilte("新增项目完成投资（万元）",2,4,44,44));
				et.add(new Excel_tilte("累计资金到位（万元）",2,2,45,52));
				et.add(new Excel_tilte("项目完成投资（万元）",2,4,53,53));
				et.add(new Excel_tilte("累 计 完 成 工 程 量 （ 公 里 )",2,2,54,61));
				et.add(new Excel_tilte("项目未完工程量（公里）",2,4,62,62));
				et.add(new Excel_tilte("完成工程量比例（%）",2,4,63,63));
				et.add(new Excel_tilte("车购税到位比例（%）",2,4,64,64));
				et.add(new Excel_tilte("完成投资比例（%）",2,4,65,65));
				et.add(new Excel_tilte("其中中央车购税（万元）",3,4,17,17));
				et.add(new Excel_tilte("合计",3,4,24,24));
				et.add(new Excel_tilte("中央车购税",3,4,25,25));
				et.add(new Excel_tilte("地方配套",3,3,26,29));
				et.add(new Excel_tilte("省厅贴息(贷款)",3,4,30,30));
				et.add(new Excel_tilte("其他资金",3,4,31,31));
				et.add(new Excel_tilte("按技术等级",3,3,34,38));
				et.add(new Excel_tilte("按路面类型",3,3,39,40));
				et.add(new Excel_tilte("砂石垫层通车",3,4,41,41));
				et.add(new Excel_tilte("合计",3,4,45,45));
				et.add(new Excel_tilte("中央车购税",3,4,46,46));
				et.add(new Excel_tilte("地方配套",3,3,47,50));
				et.add(new Excel_tilte("省厅贴息(贷款)",3,4,51,51));
				et.add(new Excel_tilte("其他资金",3,4,52,52));
				et.add(new Excel_tilte("按技术等级",3,3,54,58));
				et.add(new Excel_tilte("按路面类型",3,3,59,60));
				et.add(new Excel_tilte("砂石垫层通车",3,4,61,61));
				et.add(new Excel_tilte("小计",4,4,26,26));
				et.add(new Excel_tilte("其中：银行贷款",4,4,27,27));
				et.add(new Excel_tilte("国债",4,4,28,28));
				et.add(new Excel_tilte("省债",4,4,29,29));
				et.add(new Excel_tilte("小计",4,4,34,34));
				et.add(new Excel_tilte("一级",4,4,35,35));
				et.add(new Excel_tilte("二级",4,4,36,36));
				et.add(new Excel_tilte("三级",4,4,37,37));
				et.add(new Excel_tilte("四级",4,4,38,38));
				et.add(new Excel_tilte("沥青路",4,4,39,39));
				et.add(new Excel_tilte("水泥砼",4,4,40,40));
				et.add(new Excel_tilte("小计",4,4,47,47));
				et.add(new Excel_tilte("其中：银行贷款",4,4,48,48));
				et.add(new Excel_tilte("国债",4,4,49,49));
				et.add(new Excel_tilte("省债",4,4,50,50));
				et.add(new Excel_tilte("小计",4,4,54,54));
				et.add(new Excel_tilte("一级",4,4,55,55));
				et.add(new Excel_tilte("二级",4,4,56,56));
				et.add(new Excel_tilte("三级",4,4,57,57));
				et.add(new Excel_tilte("四级",4,4,58,58));
				et.add(new Excel_tilte("沥青路",4,4,59,59));
				et.add(new Excel_tilte("水泥砼",4,4,60,60));
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_exportGlgzxj(eldata,response);
				
			}else{
				JsonUtils.write(list1, getresponse().getWriter());
               }                                                     
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void xmkaqsmfhbb1(){
			try {
			String tiaojian1="";
			String gydwdm="";
			if("1".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
			}else{
			gydwdm = gydw;
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and unitcode like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and unitcode in ("+gydwdm+")";
			}
			if("12".equals(xzdj)){
				tiaojian1+=" and (jsdj like '%1%' or jsdj like '%2%')";
			}else{
				tiaojian1+=" and (jsdj like '%3%' or jsdj like '%4%')";
			}
			if("".equals(xmnf)){}else{
				tiaojian1+=" and jhnf="+xmnf;
			}
			List<Excel_list> list=gcybbServer.xmkaqsmfhbb1(tiaojian1);
			if("1".equals(flag)){
				
			}else{
					JsonUtils.write(list, getresponse().getWriter());
			}
			}  catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void xmkaqsmfhbb2(){
			try {
			String tiaojian1="";
			String gydwdm="";
			if("1".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
			}else{
			gydwdm = gydw;
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and unitcode like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and unitcode in ("+gydwdm+")";
			}
			if("12".equals(xzdj)){
				tiaojian1+=" and (jsdj like '%1%' or jsdj like '%2%')";
			}else{
				tiaojian1+=" and (jsdj like '%3%' or jsdj like '%4%')";
			}
			if("".equals(xmnf)){}else{
				tiaojian1+=" and jhnf="+xmnf;
			}
			List<Excel_list> list=gcybbServer.xmkaqsmfhbb2(tiaojian1);
			if("1".equals(flag)){
				
			}else{
					JsonUtils.write(list, getresponse().getWriter());
			}
			}  catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void sckaqsmfhbb(){
			try {
			String tiaojian1="";
			String gydwdm="";
			if("1".equals(flag)){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
				gydwdm=(String) session.getAttribute("gydwbb");	
			}else{
			gydwdm = gydw;
			}
			if(gydwdm.indexOf(",")==-1){
				tiaojian1="and sc.gydwdm like '%'||substr('"+gydwdm+"',0,4)||'_'||substr('"+gydwdm+"',6)||'%'";
			}else{
				tiaojian1="and sc.gydwdm in ("+gydwdm+")";
			}
			if("".equals(xmnf)){}else{
				tiaojian1+=" and sc.jhnf="+xmnf;
			}
			List<Excel_list> list=gcybbServer.sckaqsmfhbb(tiaojian1);
			if("1".equals(flag)){
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("安全生命防护工程审查库报表");//设置第一行
				eldata.setSheetName("安全生命防护工程");//设置sheeet名
				eldata.setFileName("安全生命防护工程审查库报表");//设置文件名
				eldata.setEl(list);//将实体list放入类中
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("1",1,1,0,0));
				et.add(new Excel_tilte("2",1,1,1,1));
				et.add(new Excel_tilte("3",1,1,2,2));
				et.add(new Excel_tilte("4",1,1,3,3));
				et.add(new Excel_tilte("5",1,1,4,4));
				et.add(new Excel_tilte("6",1,1,5,5));
				et.add(new Excel_tilte("7",1,1,6,6));
				et.add(new Excel_tilte("8",1,1,7,7));
				et.add(new Excel_tilte("9",1,1,8,8));
				et.add(new Excel_tilte("10",1,1,9,9));
				et.add(new Excel_tilte("11",1,1,10,10));
				et.add(new Excel_tilte("12",1,1,11,11));
				et.add(new Excel_tilte("13",1,1,12,12));
				et.add(new Excel_tilte("14",1,1,13,13));
				et.add(new Excel_tilte("15",1,1,14,14));
				et.add(new Excel_tilte("16",1,1,15,15));
				et.add(new Excel_tilte("序号",2,3,0,0));
				et.add(new Excel_tilte("省",2,3,1,1));
				et.add(new Excel_tilte("市",2,3,2,2));
				et.add(new Excel_tilte("县",2,3,3,3));
				et.add(new Excel_tilte("公路编号",2,3,4,4));
				et.add(new Excel_tilte("路段总里程",2,2,5,5));
				et.add(new Excel_tilte("路段修建/改建年度",2,2,6,6));
				et.add(new Excel_tilte("方案评估单位",2,3,7,7));
				et.add(new Excel_tilte("方案审查单位",2,3,8,8));
				et.add(new Excel_tilte("方案审批时间",2,2,9,9));
				et.add(new Excel_tilte("方案审批文号",2,3,10,10));
				et.add(new Excel_tilte("建设性质",2,2,11,11));
				et.add(new Excel_tilte("投资估算",2,2,12,12));
				et.add(new Excel_tilte("是否申请按比例补助",2,2,13,13));
				et.add(new Excel_tilte("按比例补助申请文号",2,3,14,14));
				et.add(new Excel_tilte("备注",2,3,15,15));
				et.add(new Excel_tilte("（km）",3,3,5,5));
				et.add(new Excel_tilte("（年）",3,3,6,6));
				et.add(new Excel_tilte("（年/月/日）",3,3,9,9));
				et.add(new Excel_tilte("1、中修2、大修",3,3,11,11));
				et.add(new Excel_tilte("（万元）",3,3,12,12));
				et.add(new Excel_tilte("0、否1、是",3,3,13,13));

				
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);
			}else{
					JsonUtils.write(list, getresponse().getWriter());
			}
			}  catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getHzgjxj(){
			try {
				List<Excel_list> list=gcybbServer.getHzgjxj(gcglwqgz);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getHzzh(){
			try {
				List<Excel_list> list=gcybbServer.getHzzh(gcglwqgz);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getHzlm(){
			try {
				List<Excel_list> list=gcybbServer.getHzlm(gcglwqgz);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getHzyh(){
			try {
				List<Excel_list> list=gcybbServer.getHzyh(gcglwqgz);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public void getHzlw(){
			try {
				List<Excel_list> list=gcybbServer.getHzlw(gcglwqgz);
				JsonUtils.write(list, getresponse().getWriter());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
}
