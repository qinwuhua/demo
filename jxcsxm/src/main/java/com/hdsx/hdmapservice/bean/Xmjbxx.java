package com.hdsx.hdmapservice.bean;

import java.io.Serializable;
/**
 * 
 * 项目基本信息表实体
 * @author 
 * 
 */
public class Xmjbxx implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3611109655157548249L;
	
	
	
	private String xmmc;//项目名称
	private String xmbm;//项目编码
    private String xmfl;//项目分类
	private String jsxz;//建设性质1.新建2.改建
	private String szxzqh;//所在行政区划
	private String xmxz;//项目性质
	private String gjpkx;///是否国家贫困县
	private String ssmzdq;//是否少数民族地区
	private  String gmlq;//是否革命老区
	private String sfxmk;//是否3.9万项目库
	private String qtxm;//其他项目
    private String ztz;//总投资
	private String zytz;//中央投资
	private String stz;//省投资
	private String sjpt;//市级配套
	private String xjpt;//县级配套
	private String zcpt;//镇村配套
	private  String jskgnf;//建设开工年份
	private String yjwgnf;//预计完工年份
	private String sbjhlc;//上报计划里程
	private String qyxz;//区域性质
	private String tbsj;//填报时间
	private String tbdw;//填报单位
	private  String jswh;//建设文号
	private String yswh;//预设文号
	private String qlgs;//桥梁个数
	private String bz;//备注
	private String xdjhwh;//下达计划文号
	private String xmtdxz;//项目通达乡镇
	private  String xmtdjzc;//项目通达建制村
	private  String xmtdzrc;//项目通达自然村
	
	
    private String page;
    private String rows;
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc;
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm;
	}
	public String getXmfl() {
		return xmfl;
	}
	public void setXmfl(String xmfl) {
		this.xmfl = xmfl;
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz;
	}
	public String getSzxzqh() {
		return szxzqh;
	}
	public void setSzxzqh(String szxzqh) {
		this.szxzqh = szxzqh;
	}
	public String getXmxz() {
		return xmxz;
	}
	public void setXmxz(String xmxz) {
		this.xmxz = xmxz;
	}
	public String getGjpkx() {
		return gjpkx;
	}
	public void setGjpkx(String gjpkx) {
		this.gjpkx = gjpkx;
	}
	public String getSsmzdq() {
		return ssmzdq;
	}
	public void setSsmzdq(String ssmzdq) {
		this.ssmzdq = ssmzdq;
	}
	public String getGmlq() {
		return gmlq;
	}
	public void setGmlq(String gmlq) {
		this.gmlq = gmlq;
	}
	public String getSfxmk() {
		return sfxmk;
	}
	public void setSfxmk(String sfxmk) {
		this.sfxmk = sfxmk;
	}
	public String getQtxm() {
		return qtxm;
	}
	public void setQtxm(String qtxm) {
		this.qtxm = qtxm;
	}
	public String getJskgnf() {
		return jskgnf;
	}
	public void setJskgnf(String jskgnf) {
		this.jskgnf = jskgnf;
	}
	public String getYjwgnf() {
		return yjwgnf;
	}
	public void setYjwgnf(String yjwgnf) {
		this.yjwgnf = yjwgnf;
	}
	public String getSbjhlc() {
		return sbjhlc;
	}
	public void setSbjhlc(String sbjhlc) {
		this.sbjhlc = sbjhlc;
	}
	public String getQyxz() {
		return qyxz;
	}
	public void setQyxz(String qyxz) {
		this.qyxz = qyxz;
	}
	public String getTbsj() {
		return tbsj;
	}
	public void setTbsj(String tbsj) {
		this.tbsj = tbsj;
	}
	public String getTbdw() {
		return tbdw;
	}
	public void setTbdw(String tbdw) {
		this.tbdw = tbdw;
	}
	public String getJswh() {
		return jswh;
	}
	public void setJswh(String jswh) {
		this.jswh = jswh;
	}
	public String getYswh() {
		return yswh;
	}
	public void setYswh(String yswh) {
		this.yswh = yswh;
	}
	public String getQlgs() {
		return qlgs;
	}
	public void setQlgs(String qlgs) {
		this.qlgs = qlgs;
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz;
	}
	public String getXdjhwh() {
		return xdjhwh;
	}
	public void setXdjhwh(String xdjhwh) {
		this.xdjhwh = xdjhwh;
	}
	public String getXmtdxz() {
		return xmtdxz;
	}
	public void setXmtdxz(String xmtdxz) {
		this.xmtdxz = xmtdxz;
	}
	public String getXmtdjzc() {
		return xmtdjzc;
	}
	public void setXmtdjzc(String xmtdjzc) {
		this.xmtdjzc = xmtdjzc;
	}
	public String getXmtdzrc() {
		return xmtdzrc;
	}
	public void setXmtdzrc(String xmtdzrc) {
		this.xmtdzrc = xmtdzrc;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public String getZtz() {
		return ztz;
	}
	public void setZtz(String ztz) {
		this.ztz = ztz;
	}
	public String getZytz() {
		return zytz;
	}
	public void setZytz(String zytz) {
		this.zytz = zytz;
	}
	public String getStz() {
		return stz;
	}
	public void setStz(String stz) {
		this.stz = stz;
	}
	public String getSjpt() {
		return sjpt;
	}
	public void setSjpt(String sjpt) {
		this.sjpt = sjpt;
	}
	public String getXjpt() {
		return xjpt;
	}
	public void setXjpt(String xjpt) {
		this.xjpt = xjpt;
	}
	public String getZcpt() {
		return zcpt;
	}
	public void setZcpt(String zcpt) {
		this.zcpt = zcpt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
