package com.hdsx.jxzhpt.gcgl.bean;

import java.io.Serializable;
import java.util.Date;

public class Gcglyhdzx implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String jhid;
	private String wc_btz;
	private String wc_stz;
	private String wc_qttz;
	private String zjdw_btz;
	private String zjdw_stz;
	private String zjdw_qttz;
	private String wcqk;
	private String sbyf;
	private String sbsj;
	private String sbbm;
	private String shzt;
	private String shuser;
	private Date shtime;
	private String bywcdc;
	private String bywcjc;
	private String bywcmc;
	private String kgdl;
	private String qksm;
	private String zjje;//追加金额
	private String xgcsyj;//相关处室意见
	private String cscyj;//财审处意见
	
	//车购税  CGSDWZJ  TBYF  TBSJ  TBR
	private String cgsdwzj;
	private String tbyf;
	private String tbsj;
	private String tbr;
	
	private int page;
	private int rows;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getJhid() {
		return jhid;
	}
	public void setJhid(String jhid) {
		this.jhid = jhid;
	}
	public String getWc_btz() {
		return wc_btz;
	}
	public void setWc_btz(String wc_btz) {
		this.wc_btz = wc_btz;
	}
	public String getWc_stz() {
		return wc_stz;
	}
	public void setWc_stz(String wc_stz) {
		this.wc_stz = wc_stz;
	}
	public String getWc_qttz() {
		return wc_qttz;
	}
	public void setWc_qttz(String wc_qttz) {
		this.wc_qttz = wc_qttz;
	}
	public String getWcqk() {
		return wcqk;
	}
	public void setWcqk(String wcqk) {
		this.wcqk = wcqk;
	}
	public String getSbyf() {
		return sbyf;
	}
	public void setSbyf(String sbyf) {
		this.sbyf = sbyf;
	}
	public String getSbsj() {
		return sbsj;
	}
	public void setSbsj(String sbsj) {
		this.sbsj = sbsj;
	}
	public String getSbbm() {
		return sbbm;
	}
	public void setSbbm(String sbbm) {
		this.sbbm = sbbm;
	}
	
	public String getShzt() {
		return shzt;
	}
	public void setShzt(String shzt) {
		this.shzt = shzt;
	}
	public String getShuser() {
		return shuser;
	}
	public void setShuser(String shuser) {
		this.shuser = shuser;
	}
	public Date getShtime() {
		return shtime;
	}
	public void setShtime(Date shtime) {
		this.shtime = shtime;
	}

	public String getBywcdc() {
		return bywcdc;
	}
	public void setBywcdc(String bywcdc) {
		this.bywcdc = bywcdc;
	}
	public String getBywcjc() {
		return bywcjc;
	}
	public void setBywcjc(String bywcjc) {
		this.bywcjc = bywcjc;
	}
	public String getBywcmc() {
		return bywcmc;
	}
	public void setBywcmc(String bywcmc) {
		this.bywcmc = bywcmc;
	}
	public String getKgdl() {
		return kgdl;
	}
	public void setKgdl(String kgdl) {
		this.kgdl = kgdl;
	}
	public String getQksm() {
		return qksm;
	}
	public void setQksm(String qksm) {
		this.qksm = qksm;
	}
	public String getZjje() {
		return zjje;
	}
	public void setZjje(String zjje) {
		this.zjje = zjje;
	}
	public String getXgcsyj() {
		return xgcsyj;
	}
	public void setXgcsyj(String xgcsyj) {
		this.xgcsyj = xgcsyj;
	}
	public String getCscyj() {
		return cscyj;
	}
	public void setCscyj(String cscyj) {
		this.cscyj = cscyj;
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
	
	public String getZjdw_btz() {
		return zjdw_btz;
	}
	public void setZjdw_btz(String zjdw_btz) {
		this.zjdw_btz = zjdw_btz;
	}
	public String getZjdw_stz() {
		return zjdw_stz;
	}
	public void setZjdw_stz(String zjdw_stz) {
		this.zjdw_stz = zjdw_stz;
	}
	public String getZjdw_qttz() {
		return zjdw_qttz;
	}
	public void setZjdw_qttz(String zjdw_qttz) {
		this.zjdw_qttz = zjdw_qttz;
	}
	public String getCgsdwzj() {
		return cgsdwzj;
	}
	public void setCgsdwzj(String cgsdwzj) {
		this.cgsdwzj = cgsdwzj;
	}
	public String getTbyf() {
		return tbyf;
	}
	public void setTbyf(String tbyf) {
		this.tbyf = tbyf;
	}
	public String getTbsj() {
		return tbsj;
	}
	public void setTbsj(String tbsj) {
		this.tbsj = tbsj;
	}
	public String getTbr() {
		return tbr;
	}
	public void setTbr(String tbr) {
		this.tbr = tbr;
	}

	
}