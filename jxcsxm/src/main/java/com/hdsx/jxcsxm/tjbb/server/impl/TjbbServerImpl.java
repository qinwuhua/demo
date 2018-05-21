package com.hdsx.jxcsxm.tjbb.server.impl;




import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.tjbb.bean.Excel_list;
import com.hdsx.jxcsxm.tjbb.server.TjbbServer;
import com.hdsx.jxcsxm.xtgl.bean.TreeNode;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;



@Service
public class TjbbServerImpl extends BaseOperate  implements TjbbServer{

	public TjbbServerImpl() {
		super("tjbb", "jdbc");
	}

	@Override
	public List<TreeNode> createBtTree(Excel_list elist) {
		return queryList("createBtTree", elist);
	}

	@Override
	public List<Excel_list> getZdyBbzd(Excel_list elist) {
		return queryList("getZdyBbzd", elist);
	}

	@Override
	public List<Excel_list> getJhzxqkb(Excel_list elist) {
		//删除jhzxqkb数据
		String sql1="delete from jhzxqkb";
		String ny="";
		if("".equals(elist.getBbsj())) {
			ny=new Date().getYear()+"-"+new Date().getMonth();
		}else {
			ny=elist.getBbsj().substring(0, 7);
		}
		update("zxsql", sql1);
		//添加jhzxqkb数据
		String sql2="insert into jhzxqkb select xd.jhxdwh v_1,decode(substr(gydwdm,1,1),'1',xm.gydw,xm.sgydw) v_2,xm.xmmc v_3,xd.ztz v_8,xd.cgs v_9,xd.rys v_10,xd.ttc v_11,xd.dfzc v_12,decode(dw.jhxdwh,xd.jhxdwh,dw.ztz,0) v_13,decode(dw.jhxdwh,xd.jhxdwh,dw.cgs,0) v_14,decode(dw.jhxdwh,xd.jhxdwh,dw.rys,0) v_15,decode(dw.jhxdwh,xd.jhxdwh,dw.ttc,0) v_16,decode(dw.jhxdwh,xd.jhxdwh,dw.dfzc,0) v_17,decode(bf.jhxdwh,xd.jhxdwh,bf.ztz,0) v_18,decode(bf.jhxdwh,xd.jhxdwh,bf.cgs,0) v_19,decode(bf.jhxdwh,xd.jhxdwh,bf.rys,0) v_20,decode(bf.jhxdwh,xd.jhxdwh,bf.ttc,0) v_21,decode(bf.jhxdwh,xd.jhxdwh,bf.dfzc,0) v_22,xm.sgydw,xm.sgydwdm,xm.xmbm,xm.gydwdm "
				+ "from (select * from jhzxqkb_xd where 1=1 "+elist.getXmnf()+" "+elist.getJhxdwh()+") xd "
				+ "left join xmjbxx_bb xm on xd.xmid=xm.xmbm "
				+ "left join (select * from jhzxqkb_dw where ny='"+ny+"') dw on xd.xmid=dw.xmbm and xd.jhxdwh=dw.jhxdwh "
				+ "left join (select * from jhzxqkb_bf where ny='"+ny+"') bf on xd.xmid=bf.xmbm and xd.jhxdwh=bf.jhxdwh "
				+ "where 1=1 "+elist.getXmlx()+" "+elist.getJhnf()+" "+elist.getGydwdm()+" "+elist.getXzqhdm()+" and xm.xmmc like '%"+elist.getXmmc()+"%'";
		update("zxsql", sql2);
		//
		if("wh".equals(elist.getPxfs())) {
			List<Excel_list> l1=new ArrayList<Excel_list>();
			List<Excel_list> l2=new ArrayList<Excel_list>();
			List<Excel_list> l3=new ArrayList<Excel_list>();
			List<Excel_list> l4=new ArrayList<Excel_list>();
			List<Excel_list> l5=new ArrayList<Excel_list>();
			l1=queryList("cxjhzxqkbhjwh");
			l2=queryList("cxjhzxqkbshjwh");
			l3=queryList("cxjhzxqkbxhjwh");
			l4=queryList("cxjhzxqkbwhhjwh");
			l5=queryList("cxjhzxqkbwh");
			int f3=0,f4=0,f5=0;
			int no2=0,no3=0,no4=0;
			l1.get(0).setSfhj("是");
			for (Excel_list e2 : l2) {
				e2.setSfhj("是");
				l1.add(e2);
				no2+=Integer.parseInt(e2.getV_2());
				if("1".equals(e2.getGydwdm().substring(0, 1))) {
					for (int i = f3; i < l3.size(); i++) {
						l1.add(l3.get(i));f3++;
						no3+=Integer.parseInt(l3.get(i).getV_2());
						for (int j = f4; j < l4.size(); j++) {
							if(Integer.parseInt(l4.get(j).getV_2())!=1)
							l1.add(l4.get(j));f4++;
							
							no4+=Integer.parseInt(l4.get(j).getV_2());
							l1.addAll(l5.subList(f5, f5+Integer.parseInt(l4.get(j).getV_2())));
							f5+=Integer.parseInt(l4.get(j).getV_2());
							if(no4==no3) {
								break;
							}
							
						}
						if(no3==no2) {
							no4=0;
							no3=0;
							no2=0;
							break;
						}
						
					}
					
				}else {
					for (int j = f4; j < l4.size(); j++) {
						if(Integer.parseInt(l4.get(j).getV_2())!=1)
						l1.add(l4.get(j));f4++;
						no4+=Integer.parseInt(l4.get(j).getV_2());
						l1.addAll(l5.subList(f5, f5+Integer.parseInt(l4.get(j).getV_2())));
						f5+=Integer.parseInt(l4.get(j).getV_2());
						if(no4==no2) {
							no4=0;
							no3=0;
							no2=0;
							break;
						}
					}
					
				}
				
			}
			int k=1;
			for (Excel_list e1 : l1) {
				e1.setV_0(k+"");k++;
			}
			return l1;
		}
		else if("xm".equals(elist.getPxfs())) {
			String sql3="delete from jhzxqkb_xm";
			String sql4="insert into jhzxqkb_xm "
					+ "select t1.*,t1.v_8 v_4,t2.wcl v_5,t2.wctz v_6,decode(nvl(v_8,0),0,'0%',to_char(round((nvl(t2.wctz,0)/nvl(v_8,0))*100,2))||'%') v_7 from "
					+ "(select ' ' v_0,min(v_3)||'合计' v_1,count(v_1) v_2,min(v_3) v_3,sum(nvl(v_8,0)) v_8,sum(nvl(v_9,0)) v_9,sum(nvl(v_10,0)) v_10,sum(nvl(v_11,0)) v_11,sum(nvl(v_12,0)) v_12,sum(nvl(v_13,0)) v_13,sum(nvl(v_14,0)) v_14,sum(nvl(v_15,0)) v_15,sum(nvl(v_16,0)) v_16,sum(nvl(v_17,0)) v_17,sum(nvl(v_18,0)) v_18,sum(nvl(v_19,0)) v_19,sum(nvl(v_20,0)) v_20,sum(nvl(v_21,0)) v_21,sum(nvl(v_22,0)) v_22,sum(nvl(v_13,0))-sum(nvl(v_18,0)) v_23,sum(nvl(v_14,0))-sum(nvl(v_19,0)) v_24,sum(nvl(v_15,0))-sum(nvl(v_20,0)) v_25,sum(nvl(v_16,0))-sum(nvl(v_21,0)) v_26,sum(nvl(v_17,0))-sum(nvl(v_22,0)) v_27,decode(sum(nvl(v_8,0)),0,'0%',to_char(round((sum(nvl(v_13,0))/sum(nvl(v_8,0)))*100,2))||'%') v_28,decode(sum(nvl(v_13,0)),0,'0%',to_char(round((sum(nvl(v_18,0))/sum(nvl(v_13,0)))*100,2))||'%') v_29,decode(sum(nvl(v_8,0)),0,'0%',to_char(round((sum(nvl(v_18,0))/sum(nvl(v_8,0)))*100,2))||'%') v_30,xmbm,min(sgydwdm) sgydwdm,min(gydwdm) gydwdm,min(sgydw) sgydw,min(v_2) gydw from jhzxqkb group by xmbm ) t1,"
					+ "(select xmbm,sum(nvl(wcl,0)) wcl,sum(nvl(wctz,0)) wctz from XM_XMWC group by xmbm) t2 where t1.xmbm=t2.xmbm(+)";
			update("zxsql", sql3);
			update("zxsql", sql4);
			
			List<Excel_list> l1=new ArrayList<Excel_list>();
			List<Excel_list> l2=new ArrayList<Excel_list>();
			List<Excel_list> l3=new ArrayList<Excel_list>();
			List<Excel_list> l4=new ArrayList<Excel_list>();
			List<Excel_list> l5=new ArrayList<Excel_list>();
			l1=queryList("cxjhzxqkbhjxm");
			l2=queryList("cxjhzxqkbshjxm");
			l3=queryList("cxjhzxqkbxhjxm");
			l4=queryList("cxjhzxqkbxmhjxm");
			l5=queryList("cxjhzxqkbxm");
			
			int f3=0,f4=0,f5=0;
			int no2=0,no3=0,no4=0;
			
			for (Excel_list e2 : l2) {
				e2.setSfhj("是");
				l1.add(e2);
				no2+=Integer.parseInt(e2.getV_2());
				if("1".equals(e2.getGydwdm().substring(0, 1))) {
					for (int i = f3; i < l3.size(); i++) {
						l1.add(l3.get(i));f3++;
						no3+=Integer.parseInt(l3.get(i).getV_2());
						for (int j = f4; j < l4.size(); j++) {
							if(Integer.parseInt(l4.get(j).getV_2())!=1) {
								l1.add(l4.get(j));
							}
							else {
								l5.get(f5).setV_4(l4.get(j).getV_4());
								l5.get(f5).setV_5(l4.get(j).getV_5());
								l5.get(f5).setV_6(l4.get(j).getV_6());
								l5.get(f5).setV_7(l4.get(j).getV_7());
							}
							f4++;
							no4+=Integer.parseInt(l4.get(j).getV_2());
							l1.addAll(l5.subList(f5, f5+Integer.parseInt(l4.get(j).getV_2())));
							f5+=Integer.parseInt(l4.get(j).getV_2());
							if(no4==no3) {
								break;
							}
							
						}
						if(no3==no2) {
							no4=0;
							no3=0;
							no2=0;
							break;
						}
						
					}
					
				}else {
					for (int j = f4; j < l4.size(); j++) {
						if(Integer.parseInt(l4.get(j).getV_2())!=1)
							if(Integer.parseInt(l4.get(j).getV_2())!=1) {
								l1.add(l4.get(j));
							}
							else {
								l5.get(f5).setV_4(l4.get(j).getV_4());
								l5.get(f5).setV_5(l4.get(j).getV_5());
								l5.get(f5).setV_6(l4.get(j).getV_6());
								l5.get(f5).setV_7(l4.get(j).getV_7());
							}
						f4++;
						no4+=Integer.parseInt(l4.get(j).getV_2());
						l1.addAll(l5.subList(f5, f5+Integer.parseInt(l4.get(j).getV_2())));
						f5+=Integer.parseInt(l4.get(j).getV_2());
						if(no4==no2) {
							no4=0;
							no3=0;
							no2=0;
							break;
						}
					}
					
					
				}
				
				
				
			}
			int k=1;
			for (Excel_list e1 : l1) {
				e1.setV_0(k+"");k++;
			}
			
			return l1;
		}else {
			return null;
		}
		
	}

	@Override
	public List<Excel_list> getTzhzb(Excel_list elist) {
		List<Excel_list> l1=new ArrayList<Excel_list>();
		List<Excel_list> l2=new ArrayList<Excel_list>();
		List<Excel_list> l3=new ArrayList<Excel_list>();
		l2=queryList("getTzhzbHj", elist);
		l3=queryList("getTzhzb", elist);
		for (int i = 0; i < l2.size(); i++) {
			l1.add(l2.get(i));
			int k=1;
			for (int j = 0; j < l3.size(); j++) {
				if(l2.get(i).getXzqhdm().equals(l3.get(j).getXzqhdm())){
					l3.get(j).setV_0(""+k);
					l1.add(l3.get(j));
					k++;
				}
			}
		}
		
		return l1;
	}

	@Override
	public List<Xmjbxx> queryXmlist(Xmjbxx xmjbxx) {
		return queryList("queryXmlist", xmjbxx);
	}

	@Override
	public int queryXmlistCount(Xmjbxx xmjbxx) {
		return queryOne("queryXmlistCount", xmjbxx);
	}

	@Override
	public List<Excel_list> getTzmxbbt(Excel_list elist) {
		List<Excel_list> l=new ArrayList<Excel_list>();
		List<Excel_list> l1=queryList("getTzmxbbtdw",elist);
		List<Excel_list> l2=queryList("getTzmxbbtbf",elist);
		String sql0="select '一' v_0,'收款情况（收拨款情况）' v_1,xd.ztz v_2,dw2.ztz v_3,";
		String sql="select '1' v_0,'车购税' v_1,xd.cgs v_2,dw2.cgs v_3,";
		String sql1="select '2' v_0,'燃油税' v_1,xd.rys v_2,dw2.rys v_3,";
		String sql2="select '3' v_0,'厅统筹' v_1,xd.ttc v_2,dw2.ttc v_3,";
		String sql3="select '4' v_0,'地方自筹' v_1,xd.dfzc v_2,dw2.dfzc v_3,";
		String sql4="select ' ' v_0,'拨款情况（拨款明细）' v_1,null v_2,null v_3,";
		String sql5="select '5' v_0,'标段一小计' v_1,null v_2,null v_3,";
		String sql6="select '6' v_0,'标段二小计' v_1,null v_2,null v_3,";
		
		String dwsql0="( select ";String bfsql0="(select ";
		String dwsql="( select ";String bfsql="(select ";
		String dwsql1="( select ";String bfsql1="(select ";
		String dwsql2="( select ";String bfsql2="(select ";
		String dwsql3="( select ";String bfsql3="(select ";
		String dwsql4="( select ";String bfsql4="(select ";
		String dwsql5="( select ";String bfsql5="(select ";
		String dwsql6="( select ";String bfsql6="(select ";
		String dwbt="";String bfbt="";
		int x=4;
		if(l1.size()>0){
			sql0+="dw1.ztz v_4,dws.*,";
			sql+="dw1.cgs v_4,dws.*,";
			sql1+="dw1.rys v_4,dws.*,";
			sql2+="dw1.ttc v_4,dws.*,";
			sql3+="dw1.dfzc v_4,dws.*,";
			sql4+="null v_4,dws.*,";
			sql5+="null v_4,dws.*,";
			sql6+="null v_4,dws.*,";
			//明天从这里开始做，要一个一个拼出来
			x++;
		}
		for (int i = 0; i < l1.size(); i++) {
			dwsql0+="sum(decode(dw.dwyf,'"+l1.get(i).getV_0()+"',dw.ztz)) v_"+x+",";
			dwsql+="sum(decode(dw.dwyf,'"+l1.get(i).getV_0()+"',dw.cgs)) v_"+x+",";
			dwsql1+="sum(decode(dw.dwyf,'"+l1.get(i).getV_0()+"',dw.rys)) v_"+x+",";
			dwsql2+="sum(decode(dw.dwyf,'"+l1.get(i).getV_0()+"',dw.ttc)) v_"+x+",";
			dwsql3+="sum(decode(dw.dwyf,'"+l1.get(i).getV_0()+"',dw.dfzc)) v_"+x+",";
			dwsql4+="null v_"+x+",";
			dwsql5+="null v_"+x+",";
			dwsql6+="null v_"+x+",";
			dwbt+=l1.get(i).getV_0()+",";
			x++;
		}
		sql0+="bf2.ztz v_"+x+",";
		sql+="bf2.cgs v_"+x+",";
		sql1+="bf2.rys v_"+x+",";
		sql2+="bf2.ttc v_"+x+",";
		sql3+="bf2.dfzc v_"+x+",";
		sql4+="bf2.ztz v_"+x+",";
		sql5+="bf2.ztz v_"+x+",";
		sql6+="bf2.ztz v_"+x+",";
		x++;
		if(l2.size()>0){
			sql0+="bf1.ztz v_"+x+",bfs.*,";
			sql+="bf1.cgs v_"+x+",bfs.*,";
			sql1+="bf1.rys v_"+x+",bfs.*,";
			sql2+="bf1.ttc v_"+x+",bfs.*,";
			sql3+="bf1.dfzc v_"+x+",bfs.*,";
			sql4+="bf1.ztz v_"+x+",bfs.*,";
			sql5+="bf1.ztz v_"+x+",bfs.*,";
			sql6+="bf1.ztz v_"+x+",bfs.*,";
			
			x++;
		}
		for (int i = 0; i < l2.size(); i++) {
			bfsql0+="sum(decode(bf.bfyf,'"+l2.get(i).getV_0()+"',bf.ztz)) v_"+x+",";
			bfsql+="sum(decode(bf.bfyf,'"+l2.get(i).getV_0()+"',bf.cgs)) v_"+x+",";
			bfsql1+="sum(decode(bf.bfyf,'"+l2.get(i).getV_0()+"',bf.rys)) v_"+x+",";
			bfsql2+="sum(decode(bf.bfyf,'"+l2.get(i).getV_0()+"',bf.ttc)) v_"+x+",";
			bfsql3+="sum(decode(bf.bfyf,'"+l2.get(i).getV_0()+"',bf.dfzc)) v_"+x+",";
			bfsql4+="sum(decode(bf.bfyf,'"+l2.get(i).getV_0()+"',bf.ztz)) v_"+x+",";
			bfsql5+="sum(decode(bf.bfyf,'"+l2.get(i).getV_0()+"',bf.ztz)) v_"+x+",";
			bfsql6+="sum(decode(bf.bfyf,'"+l2.get(i).getV_0()+"',bf.ztz)) v_"+x+",";
			bfbt+=l2.get(i).getV_0()+",";
			x++;
		}
		sql0+="nvl(dw2.ztz,0)+nvl(dw1.ztz,0) v_"+(x+0)+",nvl(bf2.ztz,0)+nvl(bf1.ztz,0) v_"+(x+1)+",xd.ztz-(nvl(dw2.ztz,0)+nvl(dw1.ztz,0)) v_"+(x+2)+",(nvl(dw2.ztz,0)+nvl(dw1.ztz,0))-(nvl(bf2.ztz,0)+nvl(bf1.ztz,0)) v_"+(x+3)+",null v_"+(x+4)+",'0' xh";
		sql+="nvl(dw2.cgs,0)+nvl(dw1.cgs,0) v_"+(x+0)+",nvl(bf2.cgs,0)+nvl(bf1.cgs,0) v_"+(x+1)+",xd.cgs-(nvl(dw2.cgs,0)+nvl(dw1.cgs,0)) v_"+(x+2)+",(nvl(dw2.cgs,0)+nvl(dw1.cgs,0))-(nvl(bf2.cgs,0)+nvl(bf1.cgs,0)) v_"+(x+3)+",null v_"+(x+4)+",'1' xh";
		sql1+="nvl(dw2.rys,0)+nvl(dw1.rys,0) v_"+(x+0)+",nvl(bf2.rys,0)+nvl(bf1.rys,0) v_"+(x+1)+",xd.rys-(nvl(dw2.rys,0)+nvl(dw1.rys,0)) v_"+(x+2)+",(nvl(dw2.rys,0)+nvl(dw1.rys,0))-(nvl(bf2.rys,0)+nvl(bf1.rys,0)) v_"+(x+3)+",null v_"+(x+4)+",'2' xh";
		sql2+="nvl(dw2.ttc,0)+nvl(dw1.ttc,0) v_"+(x+0)+",nvl(bf2.ttc,0)+nvl(bf1.ttc,0) v_"+(x+1)+",xd.ttc-(nvl(dw2.ttc,0)+nvl(dw1.ttc,0)) v_"+(x+2)+",(nvl(dw2.ttc,0)+nvl(dw1.ttc,0))-(nvl(bf2.ttc,0)+nvl(bf1.ttc,0)) v_"+(x+3)+",null v_"+(x+4)+",'3' xh";
		sql3+="nvl(dw2.dfzc,0)+nvl(dw1.dfzc,0) v_"+(x+0)+",nvl(bf2.dfzc,0)+nvl(bf1.dfzc,0) v_"+(x+1)+",xd.dfzc-(nvl(dw2.dfzc,0)+nvl(dw1.dfzc,0)) v_"+(x+2)+",(nvl(dw2.dfzc,0)+nvl(dw1.dfzc,0))-(nvl(bf2.dfzc,0)+nvl(bf1.dfzc,0)) v_"+(x+3)+",null v_"+(x+4)+",'4' xh";
		sql4+="null v_"+(x+0)+",nvl(bf2.ztz,0)+nvl(bf1.ztz,0) v_"+(x+1)+",null v_"+(x+2)+",null v_"+(x+3)+",null v_"+(x+4)+",'5' xh";
		sql5+="null v_"+(x+0)+",nvl(bf2.ztz,0)+nvl(bf1.ztz,0) v_"+(x+1)+",null v_"+(x+2)+",null v_"+(x+3)+",null v_"+(x+4)+",'6' xh";
		sql6+="null v_"+(x+0)+",nvl(bf2.ztz,0)+nvl(bf1.ztz,0) v_"+(x+1)+",null v_"+(x+2)+",null v_"+(x+3)+",null v_"+(x+4)+",'7' xh";
		
		dwsql0+="xmbm dwjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmbm,dwyf,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+"  group by dwyf,xmbm) dw group by xmbm) dws,";
		dwsql+="xmbm dwjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,dwyf,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+"  group by dwyf,xmbm) dw group by xmbm) dws,";
		dwsql1+="xmbm dwjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,dwyf,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+"  group by dwyf,xmbm) dw group by xmbm) dws,";
		dwsql2+="xmbm dwjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,dwyf,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+"  group by dwyf,xmbm) dw group by xmbm) dws,";
		dwsql3+="xmbm dwjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,dwyf,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+"  group by dwyf,xmbm) dw group by xmbm) dws,";
		dwsql4+="xmbm dwjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmbm,dwyf,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+"  group by dwyf,xmbm) dw group by xmbm) dws,";
		dwsql5+="xmbm dwjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmbm,dwyf,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+"  group by dwyf,xmbm) dw group by xmbm) dws,";
		dwsql6+="xmbm dwjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmbm,dwyf,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+"  group by dwyf,xmbm) dw group by xmbm) dws,";
		
		bfsql0+="xmbm bfjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmbm,bfyf,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+"  group by bfyf,xmbm) bf group by xmbm) bfs," ;
		bfsql+="xmbm bfjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,bfyf,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+"  group by bfyf,xmbm) bf group by xmbm) bfs," ;
		bfsql1+="xmbm bfjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,bfyf,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+"  group by bfyf,xmbm) bf group by xmbm) bfs," ;
		bfsql2+="xmbm bfjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,bfyf,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+"  group by bfyf,xmbm) bf group by xmbm) bfs," ;
		bfsql3+="xmbm bfjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,bfyf,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+"  group by bfyf,xmbm) bf group by xmbm) bfs," ;
		bfsql4+="xmbm bfjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmbm,bfyf,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+"  group by bfyf,xmbm) bf group by xmbm) bfs," ;
		bfsql5+="xmbm bfjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmbm,bfyf,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" and bd='标段一' group by bfyf,xmbm) bf group by xmbm) bfs," ;
		bfsql6+="xmbm bfjhxdwh from (select sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmbm,bfyf,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" and bd='标段二' group by bfyf,xmbm) bf group by xmbm) bfs," ;
		
		String table0=
			      " from (select sum(nvl(btzzj,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(btzzj,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmid,xmid jhxdwh from xm_gsd_jhxd xm where jhxdwh is not null group by xmid) xd," 
						+dwsql0
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+" group by xmbm) dw1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)<"+elist.getJhnf()+" group by xmbm) dw2," 
						+bfsql0
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" group by xmbm) bf1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)<"+elist.getJhnf()+" group by xmbm) bf2" 
						+" where xd.jhxdwh=dws.dwjhxdwh(+) and xd.jhxdwh=dw1.jhxdwh(+) and xd.jhxdwh=dw2.jhxdwh(+) and xd.jhxdwh=bfs.bfjhxdwh(+) and xd.jhxdwh=bf1.jhxdwh(+) and xd.jhxdwh=bf2.jhxdwh(+)"
						+" and xd.xmid='"+elist.getXmbm()+"'";
		String table=
	      " from (select sum(nvl(btzzj,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(btzzj,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmid,xmid jhxdwh from xm_gsd_jhxd xm where jhxdwh is not null group by xmid) xd," 
				+dwsql
				+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+" group by xmbm) dw1," 
				+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)<"+elist.getJhnf()+" group by xmbm) dw2," 
				+bfsql
				+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" group by xmbm) bf1," 
				+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)<"+elist.getJhnf()+" group by xmbm) bf2" 
				+" where xd.jhxdwh=dws.dwjhxdwh(+) and xd.jhxdwh=dw1.jhxdwh(+) and xd.jhxdwh=dw2.jhxdwh(+) and xd.jhxdwh=bfs.bfjhxdwh(+) and xd.jhxdwh=bf1.jhxdwh(+) and xd.jhxdwh=bf2.jhxdwh(+)"
				+" and xd.xmid='"+elist.getXmbm()+"'";
		String table1=
			      " from (select sum(nvl(btzzj,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(btzzj,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmid,xmid jhxdwh from xm_gsd_jhxd xm where jhxdwh is not null group by xmid) xd," 
						+dwsql1
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+" group by xmbm) dw1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)<"+elist.getJhnf()+" group by xmbm) dw2," 
						+bfsql1
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" group by xmbm) bf1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)<"+elist.getJhnf()+" group by xmbm) bf2" 
						+" where xd.jhxdwh=dws.dwjhxdwh(+) and xd.jhxdwh=dw1.jhxdwh(+) and xd.jhxdwh=dw2.jhxdwh(+) and xd.jhxdwh=bfs.bfjhxdwh(+) and xd.jhxdwh=bf1.jhxdwh(+) and xd.jhxdwh=bf2.jhxdwh(+)"
						+" and xd.xmid='"+elist.getXmbm()+"'";
		String table2=
			      " from (select sum(nvl(btzzj,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(btzzj,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmid,xmid jhxdwh from xm_gsd_jhxd xm where jhxdwh is not null group by xmid) xd," 
						+dwsql2
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+" group by xmbm) dw1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)<"+elist.getJhnf()+" group by xmbm) dw2," 
						+bfsql2
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" group by xmbm) bf1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)<"+elist.getJhnf()+" group by xmbm) bf2" 
						+" where xd.jhxdwh=dws.dwjhxdwh(+) and xd.jhxdwh=dw1.jhxdwh(+) and xd.jhxdwh=dw2.jhxdwh(+) and xd.jhxdwh=bfs.bfjhxdwh(+) and xd.jhxdwh=bf1.jhxdwh(+) and xd.jhxdwh=bf2.jhxdwh(+)"
						+" and xd.xmid='"+elist.getXmbm()+"'";
		String table3=
			      " from (select sum(nvl(btzzj,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(btzzj,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmid,xmid jhxdwh from xm_gsd_jhxd xm where jhxdwh is not null group by xmid) xd," 
						+dwsql3
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+" group by xmbm) dw1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)<"+elist.getJhnf()+" group by xmbm) dw2," 
						+bfsql3
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" group by xmbm) bf1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)<"+elist.getJhnf()+" group by xmbm) bf2" 
						+" where xd.jhxdwh=dws.dwjhxdwh(+) and xd.jhxdwh=dw1.jhxdwh(+) and xd.jhxdwh=dw2.jhxdwh(+) and xd.jhxdwh=bfs.bfjhxdwh(+) and xd.jhxdwh=bf1.jhxdwh(+) and xd.jhxdwh=bf2.jhxdwh(+)"
						+" and xd.xmid='"+elist.getXmbm()+"'";
		String table4=
			      " from (select sum(nvl(btzzj,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(btzzj,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmid,xmid jhxdwh from xm_gsd_jhxd xm where jhxdwh is not null group by xmid) xd," 
						+dwsql4
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+" group by xmbm) dw1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)<"+elist.getJhnf()+" group by xmbm) dw2," 
						+bfsql4
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" group by xmbm) bf1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)<"+elist.getJhnf()+" group by xmbm) bf2" 
						+" where xd.jhxdwh=dws.dwjhxdwh(+) and xd.jhxdwh=dw1.jhxdwh(+) and xd.jhxdwh=dw2.jhxdwh(+) and xd.jhxdwh=bfs.bfjhxdwh(+) and xd.jhxdwh=bf1.jhxdwh(+) and xd.jhxdwh=bf2.jhxdwh(+)"
						+" and xd.xmid='"+elist.getXmbm()+"'";
		String table5=
			      " from (select sum(nvl(btzzj,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(btzzj,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmid,xmid jhxdwh from xm_gsd_jhxd xm where jhxdwh is not null group by xmid) xd," 
						+dwsql5
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+" group by xmbm) dw1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)<"+elist.getJhnf()+" group by xmbm) dw2," 
						+bfsql5
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" and bd='标段一' group by xmbm) bf1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)<"+elist.getJhnf()+" and bd='标段一' group by xmbm) bf2" 
						+" where xd.jhxdwh=dws.dwjhxdwh(+) and xd.jhxdwh=dw1.jhxdwh(+) and xd.jhxdwh=dw2.jhxdwh(+) and xd.jhxdwh=bfs.bfjhxdwh(+) and xd.jhxdwh=bf1.jhxdwh(+) and xd.jhxdwh=bf2.jhxdwh(+)"
						+" and xd.xmid='"+elist.getXmbm()+"'";
		String table6=
			      " from (select sum(nvl(btzzj,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(btzzj,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,sum(nvl(ztz,0)) ztz,xmid,xmid jhxdwh from xm_gsd_jhxd xm where jhxdwh is not null group by xmid) xd," 
						+dwsql6
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)="+elist.getJhnf()+" group by xmbm) dw1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjdw xm where jhxdwh is not null and substr(dwyf,0,4)<"+elist.getJhnf()+" group by xmbm) dw2," 
						+bfsql6
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)="+elist.getJhnf()+" and bd='标段二' group by xmbm) bf1," 
						+" (select sum(nvl(ztz,0)) ztz,sum(nvl(cgs,0)) cgs,sum(nvl(rys,0)) rys,sum(nvl(ztz,0))-sum(nvl(cgs,0))-sum(nvl(rys,0))-sum(nvl(dfzc,0)) ttc,sum(nvl(dfzc,0)) dfzc,xmbm,xmbm jhxdwh from xm_zjbf xm where jhxdwh is not null and substr(bfyf,0,4)<"+elist.getJhnf()+" and bd='标段二' group by xmbm) bf2" 
						+" where xd.jhxdwh=dws.dwjhxdwh(+) and xd.jhxdwh=dw1.jhxdwh(+) and xd.jhxdwh=dw2.jhxdwh(+) and xd.jhxdwh=bfs.bfjhxdwh(+) and xd.jhxdwh=bf1.jhxdwh(+) and xd.jhxdwh=bf2.jhxdwh(+)"
						+" and xd.xmid='"+elist.getXmbm()+"'";
		sql0+=table0+" union all " +sql+table+" union all " +sql1+table1+" union all " +sql2+table2+" union all " +sql3+table3+" union all " +sql4+table4+" union all " +sql5+table5+" union all " +sql6+table6;
		
		
		
		elist.setSql(sql0);
		l=queryList("queryListBySql",elist);
		if(l.size()>0){
			if(dwbt.length()>0)
			l.get(0).setDwbt(dwbt.substring(0,dwbt.length() - 1));
			if(bfbt.length()>0)
			l.get(0).setBfbt(bfbt.substring(0,bfbt.length() - 1));
		}
			
		return l;
	}

	@Override
	public List<Excel_list> getGlzcqkb(Excel_list elist) {
		return queryList("getGlzcqkb",elist);
	}

	@Override
	public boolean importTjbb(List<Map> data) {
		deleteBatch("deleteTjbb", data);
		
		for (Map map : data) {
			System.out.println(map);
		}
		
		return insertBatch("importTjbb", data)==data.size();
	}

	@Override
	public List<Excel_list> getTjbb(Excel_list elist) {
		if("bzsrzcb".equals(elist.getXmlx()))
		return queryList("getTjbbOfbzsrzcb",elist);
		else if("bycbb".equals(elist.getXmlx()))
			return queryList("getTjbbOfbycbb",elist);
		else if("zjbdb".equals(elist.getXmlx()))
			return queryList("getTjbbOfzjbdb",elist);
		else if("srzcb".equals(elist.getXmlx()))
			return queryList("getTjbbOfsrzcb",elist);
		else if("zxqkb".equals(elist.getXmlx()))
			return queryList("getTjbbOfzxqkb",elist);
		else if("zcfzb".equals(elist.getXmlx()))
			return queryList("getTjbbOfzcfzb",elist);
		else
			return null;
	}

	@Override
	public List<Excel_list> getZjsymxb(Excel_list elist) {
		List<Excel_list> l=new ArrayList<Excel_list>();
		List<Excel_list> l1=new ArrayList<Excel_list>();
		l=queryList("getZjsymxbzj",elist);
		l1=queryList("getZjsymxb",elist);
		l.addAll(l1);
		return l;
	}

	@Override
	public List<Excel_list> getZjsydwhzb(Excel_list elist) {
		List<Excel_list> l=new ArrayList<Excel_list>();
		
		List<Excel_list> l1=null;
		List<Excel_list> l2=null;
		if("按地市".equals(elist.getHjlx())){
			l=queryList("getZjsydwhzbhjds",elist);
			l1=queryList("getZjsydwhzbhzds",elist);
//			l2=queryList("getZjsydwhzbds",elist);
		}else{
			l=queryList("getZjsydwhzbhj",elist);
			l1=queryList("getZjsydwhzbhz",elist);
//			l2=queryList("getZjsydwhzb",elist);
		}
		int l2no=0;
		for (int i = 0; i < l1.size(); i++) {
			l.add(l1.get(i));
			/*int t=1;
			for (int j = l2no; j < l2no+l1.get(i).getXmsl(); j++) {
				l2.get(j).setV_0(t+"");t++;
			}
			System.out.println(l2no+"   "+(l2no+l1.get(i).getXmsl()));
			l.addAll(l2.subList(l2no, l2no+l1.get(i).getXmsl()));
			l2no+=l1.get(i).getXmsl();*/
		}
		
		return l;
	}

	@Override
	public List<Excel_list> getZjsyxmhzb(Excel_list elist) {
		List<Excel_list> l=new ArrayList<Excel_list>();
		l=queryList("getZjsyxmhzbhj",elist);
		List<Excel_list> l1=queryList("getZjsyxmhzbhz",elist);
//		List<Excel_list> l2=queryList("getZjsyxmhzb",elist);
		int l2no=0;
		for (int i = 0; i < l1.size(); i++) {
			l.add(l1.get(i));
			int t=1;
			/*for (int j = l2no; j < l2no+l1.get(i).getXmsl(); j++) {
				l2.get(j).setV_0(t+"");t++;
			}
			System.out.println(l2no+"   "+(l2no+l1.get(i).getXmsl()));
			l.addAll(l2.subList(l2no, l2no+l1.get(i).getXmsl()));
			l2no+=l1.get(i).getXmsl();*/
		}
		
		return l;
	}

}
