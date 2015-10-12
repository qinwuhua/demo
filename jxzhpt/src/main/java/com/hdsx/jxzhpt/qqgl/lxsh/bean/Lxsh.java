package com.hdsx.jxzhpt.qqgl.lxsh.bean;

import java.io.Serializable;
import java.util.Date;

public class Lxsh implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String xmmc;
	private String ghlxbh;
	private String lc;
	private String jsxz;
	private String  qdzh;
	private String  zdzh;
	private String qdmc;
	private String zdmc;
	private String jhkgn;
	private String jhwgn;
	private String jsjsdj;
	private String xjsdj ;
	private String xmbm ;
	private String tz;
	private String bzys;
	private String bzys1;
	private String  dfzc;
	private String tsdq;
	private String xzqh;
	private String gydw;
	private String xzqhdm;
	private String gydwdm;
	private String tbbmbm;
	private String tbbmmc;
	private String tbsj;
	private int page;
	private int rows;
	private String xmnf;
	private String gldj;
	private String jsdj;
	private String xmlx;
	private int sbthcd;
	private String sbzt1;
	private int shzt;
	private String lxmc;
	private String jdbs;
	private String sffirst;
	private String lsjl;//是否有历史记录
	private String gpsqdzh;
	private String gpszdzh;
	private String lxbm;
	private String minqdzh;
	private String maxzdzh;
	private String xjlxbm;//新建路线编码
	private String xjqdzh;//新建起点桩号
	private String xjzdzh;//新建止点桩号
	private String xjlc;//新建里程
	
	private String yilc;//一级公路里程
	private String erlc;//二级公路里程
	private String sanlc;//三级公路里程
	private String silc;//四级公路里程
	private String dwlc;//等外公路里程
	private String wllc;//无路里程
	private String jhyilc;//建设后一级公路里程
	private String jherlc;//建设后二级公路里程
	private String jhsanlc;//建设后三级公路里程
	private String jhsilc;//建设后四级公路里程
	private String jhdwlc;//建设后等外公路里程
	private String jhwllc;//建设后无路里程
	private String bz;//备注
	private String yhdk;//银行贷款
	private String bzcs;//补助测算
	private String jszlc;//建设总里程

	private String jsfa;//建设方案
	//历史数据字段
	private String ylxbm;//原路线编码
	private String yqdzh;//原起点桩号
	private String yzdzh;//原止点桩号
	private String jhlc;
	private String sl;
	private String zjhlc;
	private String gz;
	private String sz;
	
	public String getGz() {
		return gz;
	}
	public void setGz(String gz) {
		this.gz = gz;
	}
	public String getSz() {
		return sz;
	}
	public void setSz(String sz) {
		this.sz = sz;
	}
	public String getZjhlc() {
		return zjhlc;
	}
	public void setZjhlc(String zjhlc) {
		this.zjhlc = zjhlc;
	}
	public String getSl() {
		return sl;
	}
	public void setSl(String sl) {
		this.sl = sl;
	}
	public String getJhlc() {
		return jhlc;
	}
	public void setJhlc(String jhlc) {
		this.jhlc = jhlc;
	}
	public String getYhdk() {
		return yhdk;
	}
	public void setYhdk(String yhdk) {
		this.yhdk = yhdk.trim();
	}
	public String getBz() {
		return bz;
	}
	public void setBz(String bz) {
		this.bz = bz.trim();
	}
	public String getJhyilc() {
		return jhyilc;
	}
	public void setJhyilc(String jhyilc) {
		this.jhyilc = jhyilc.trim();
	}
	public String getJherlc() {
		return jherlc;
	}
	public void setJherlc(String jherlc) {
		this.jherlc = jherlc.trim();
	}
	public String getJhsanlc() {
		return jhsanlc;
	}
	public void setJhsanlc(String jhsanlc) {
		this.jhsanlc = jhsanlc.trim();
	}
	public String getJhsilc() {
		return jhsilc;
	}
	public void setJhsilc(String jhsilc) {
		this.jhsilc = jhsilc.trim();
	}
	public String getJhdwlc() {
		return jhdwlc;
	}
	public void setJhdwlc(String jhdwlc) {
		this.jhdwlc = jhdwlc.trim();
	}
	public String getJhwllc() {
		return jhwllc;
	}
	public void setJhwllc(String jhwllc) {
		this.jhwllc = jhwllc.trim();
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getYilc() {
		return yilc;
	}
	public void setYilc(String yilc) {
		this.yilc = yilc.trim();
	}
	public String getErlc() {
		return erlc;
	}
	public void setErlc(String erlc) {
		this.erlc = erlc.trim();
	}
	public String getSanlc() {
		return sanlc;
	}
	public void setSanlc(String sanlc) {
		this.sanlc = sanlc.trim();
	}
	public String getSilc() {
		return silc;
	}
	public void setSilc(String silc) {
		this.silc = silc.trim();
	}
	public String getDwlc() {
		return dwlc;
	}
	public void setDwlc(String dwlc) {
		this.dwlc = dwlc.trim();
	}
	public String getWllc() {
		return wllc;
	}
	public void setWllc(String wllc) {
		this.wllc = wllc.trim();
	}
	public String getXjlxbm() {
		return xjlxbm;
	}
	public void setXjlxbm(String xjlxbm) {
		this.xjlxbm = xjlxbm.trim();
	}
	public String getXjqdzh() {
		return xjqdzh;
	}
	public void setXjqdzh(String xjqdzh) {
		this.xjqdzh = xjqdzh.trim();
	}
	public String getXjzdzh() {
		return xjzdzh;
	}
	public void setXjzdzh(String xjzdzh) {
		this.xjzdzh = xjzdzh.trim();
	}
	public String getXjlc() {
		return xjlc;
	}
	public void setXjlc(String xjlc) {
		this.xjlc = xjlc.trim();
	}
	public String getMinqdzh() {
		return minqdzh;
	}
	public void setMinqdzh(String minqdzh) {
		this.minqdzh = minqdzh.trim();
	}
	public String getMaxzdzh() {
		return maxzdzh;
	}
	public void setMaxzdzh(String maxzdzh) {
		this.maxzdzh = maxzdzh.trim();
	}
	public String getLxbm() {
		return lxbm;
	}
	public void setLxbm(String lxbm) {
		this.lxbm = lxbm.trim();
	}
	public String getBzys1() {
		return bzys1;
	}
	public void setBzys1(String bzys1) {
		this.bzys1 = bzys1.trim();
	}
	public String getGpsqdzh() {
		return gpsqdzh;
	}
	public void setGpsqdzh(String gpsqdzh) {
		this.gpsqdzh = gpsqdzh.trim();
	}
	public String getGpszdzh() {
		return gpszdzh;
	}
	public void setGpszdzh(String gpszdzh) {
		this.gpszdzh = gpszdzh.trim();
	}
	public String getLsjl() {
		return lsjl;
	}
	public void setLsjl(String lsjl) {
		this.lsjl = lsjl;
	}
	public String getSffirst() {
		return sffirst;
	}
	public void setSffirst(String sffirst) {
		this.sffirst = sffirst;
	}
	public String getLxmc() {
		return lxmc;
	}
	public void setLxmc(String lxmc) {
		this.lxmc = lxmc.trim();
	}
	public int getSbthcd() {
		return sbthcd;
	}
	public void setSbthcd(int sbthcd) {
		this.sbthcd = sbthcd;
	}
	
	public String getSbzt1() {
		return sbzt1;
	}
	public void setSbzt1(String sbzt1) {
		this.sbzt1 = sbzt1;
	}
	public int getShzt() {
		return shzt;
	}
	public void setShzt(int shzt) {
		this.shzt = shzt;
	}
	public String getXmlx() {
		return xmlx;
	}
	public void setXmlx(String xmlx) {
		this.xmlx = xmlx;
	}
	public String getGldj() {
		return gldj;
	}
	public void setGldj(String gldj) {
		this.gldj = gldj;
	}
	public String getJsdj() {
		return jsdj;
	}
	public void setJsdj(String jsdj) {
		this.jsdj = jsdj;
	}
	public String getXmnf() {
		return xmnf;
	}
	public void setXmnf(String xmnf) {
		this.xmnf = xmnf;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXmmc() {
		return xmmc;
	}
	public void setXmmc(String xmmc) {
		this.xmmc = xmmc.trim();
	}
	public String getGhlxbh() {
		return ghlxbh;
	}
	public void setGhlxbh(String ghlxbh) {
		this.ghlxbh = ghlxbh.trim();
	}
	public String getLc() {
		return lc;
	}
	public void setLc(String lc) {
		this.lc = lc.trim();
	}
	public String getJsxz() {
		return jsxz;
	}
	public void setJsxz(String jsxz) {
		this.jsxz = jsxz.trim();
	}
	public String getQdzh() {
		return qdzh;
	}
	public void setQdzh(String qdzh) {
		this.qdzh = qdzh.trim();
	}
	public String getZdzh() {
		return zdzh;
	}
	public void setZdzh(String zdzh) {
		this.zdzh = zdzh.trim();
	}
	public String getQdmc() {
		return qdmc;
	}
	public void setQdmc(String qdmc) {
		this.qdmc = qdmc.trim();
	}
	public String getZdmc() {
		return zdmc;
	}
	public void setZdmc(String zdmc) {
		this.zdmc = zdmc.trim();
	}
	public String getJhkgn() {
		return jhkgn;
	}
	public void setJhkgn(String jhkgn) {
		this.jhkgn = jhkgn;
	}
	public String getJhwgn() {
		return jhwgn;
	}
	public void setJhwgn(String jhwgn) {
		this.jhwgn = jhwgn;
	}
	public String getJsjsdj() {
		return jsjsdj;
	}
	public void setJsjsdj(String jsjsdj) {
		this.jsjsdj = jsjsdj.trim();
	}
	public String getXjsdj() {
		return xjsdj;
	}
	public void setXjsdj(String xjsdj) {
		this.xjsdj = xjsdj.trim();
	}
	public String getXmbm() {
		return xmbm;
	}
	public void setXmbm(String xmbm) {
		this.xmbm = xmbm;
	}
	public String getTz() {
		return tz;
	}
	public void setTz(String tz) {
		this.tz = tz.trim();
	}
	public String getBzys() {
		return bzys;
	}
	public void setBzys(String bzys) {
		this.bzys = bzys.trim();
	}
	public String getDfzc() {
		return dfzc;
	}
	public void setDfzc(String dfzc) {
		this.dfzc = dfzc.trim();
	}
	public String getTsdq() {
		return tsdq;
	}
	public void setTsdq(String tsdq) {
		this.tsdq = tsdq;
	}
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
	public String getXzqhdm() {
		return xzqhdm;
	}
	public void setXzqhdm(String xzqhdm) {
		this.xzqhdm = xzqhdm;
	}
	public String getGydwdm() {
		return gydwdm;
	}
	public void setGydwdm(String gydwdm) {
		this.gydwdm = gydwdm;
	}
	public String getTbbmbm() {
		return tbbmbm;
	}
	public void setTbbmbm(String tbbmbm) {
		this.tbbmbm = tbbmbm;
	}
	public String getTbbmmc() {
		return tbbmmc;
	}
	public void setTbbmmc(String tbbmmc) {
		this.tbbmmc = tbbmmc;
	}
	public String getTbsj() {
		return tbsj;
	}
	public void setTbsj(String tbsj) {
		this.tbsj = tbsj;
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
	public String getJdbs() {
		return jdbs;
	}
	public void setJdbs(String jdbs) {
		this.jdbs = jdbs;
	}
	public String getBzcs() {
		return bzcs;
	}
	public void setBzcs(String bzcs) {
		this.bzcs = bzcs;
	}
	public String getJsfa() {
		return jsfa;
	}
	public void setJsfa(String jsfa) {
		this.jsfa = jsfa;
	}
	public String getYlxbm() {
		return ylxbm;
	}
	public void setYlxbm(String ylxbm) {
		this.ylxbm = ylxbm;
	}
	public String getYqdzh() {
		return yqdzh;
	}
	public void setYqdzh(String yqdzh) {
		this.yqdzh = yqdzh;
	}
	public String getYzdzh() {
		return yzdzh;
	}
	public void setYzdzh(String yzdzh) {
		this.yzdzh = yzdzh;
	}
	public String getJszlc() {
		return jszlc;
	}
	public void setJszlc(String jszlc) {
		this.jszlc = jszlc;
	}

}
