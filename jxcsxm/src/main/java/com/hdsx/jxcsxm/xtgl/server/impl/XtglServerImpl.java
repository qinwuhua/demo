package com.hdsx.jxcsxm.xtgl.server.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.stereotype.Service;

import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.xtgl.bean.Master;
import com.hdsx.jxcsxm.xtgl.bean.Param;
import com.hdsx.jxcsxm.xtgl.bean.Plan_flwbzbz;
import com.hdsx.jxcsxm.xtgl.bean.TreeNode;
import com.hdsx.jxcsxm.xtgl.bean.Unit;
import com.hdsx.jxcsxm.xtgl.server.XtglServer;

@Service
public class XtglServerImpl extends BaseOperate  implements XtglServer{

	public XtglServerImpl() {
		super("xtgl", "jdbc");
	}
	
	@Override
	public boolean czPassword(Master master) {
		int i = update("czPassword",master);
		if(i>=0) return true;
		return false;
	}

	@Override
	public List<TreeNode> seldw(String yhdw) {
		return  queryList("seldw",yhdw);
	}

	@Override
	public List<TreeNode> selchildedw(String yhdw) {
		return  queryList("selchildedw",yhdw);
	}

	@Override
	public boolean updatePassword(HashMap hm) {
		if (update("updatePassword", hm) > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public HashMap<String, String> login(HashMap hm) {
		HashMap lhm=queryOne("loginnum",hm);
		return lhm;
	}

	@Override
	public List<TreeNode> selAllXzqh2(String yhdw) {
		return queryList("selAllXzqh2",yhdw);
	}

	@Override
	public List<TreeNode> selAllXzqh(String yhdw) {
		return queryList("selAllXzqh",yhdw);
	}

	@Override
	public int selectYhListCount(HashMap hm) {
		return queryOne("selectYhListCount", hm);
	}

	@Override
	public List<Master> selectYhList(HashMap hm) {
		return queryList("selectYhList", hm);
	}

	@Override
	public List<HashMap> selQxList(HashMap hm) {
		return queryList("selQxList", hm);
	}

	@Override
	public boolean insertYh(Master master) {
		int b=insert("insertYh", master);
		return b>0?true:false;
	}

	@Override
	public boolean updatezt(HashMap hm) {
		int b=update("updatezt", hm);
		return b>0?true:false;
	}

	@Override
	public boolean deleteYh(String id) {
		int b=delete("deleteYh",id);
		return b>0?true:false;
	}

	@Override
	public boolean mimareset(HashMap hm) {
		int b=update("mimareset", hm);
		return b>0?true:false;
	}

	@Override
	public boolean updateYh(Master master) {
		int b=update("updateYh", master);
		return b>0?true:false;
	}

	@Override
	public List<Param> selectJsList(Param param) {
		return queryList("selectJsList", param);
	}

	@Override
	public boolean insertJs(Param param) {
		UUID uuid = UUID.randomUUID();
		param.setRoleid(uuid.toString());
		List<Param> l=new ArrayList<Param>();
		String[] s=param.getSource().split(",");
		for (int i=0;i<s.length;i++){
			Param p=new Param();
			p.setRoleid(uuid.toString());
			p.setSourceid(s[i]);
			l.add(p);
		}

		if (insert("insertJs", param) > 0) {
			if(insertBatch("insertRoleSourceBatch", l)>0) return true;
			else return false;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteJsById(Param param) {
		if (delete("deleteJsById",param) > 0) {
			if(delete("deleteRoleSourceById",param)>0) return true;
			else return false;
		} else {
			return false;
		}
	}

	@Override
	
	public int selectDwListCount(Unit unit) {
		return queryOne("selectDwListCount", unit);
	}

	@Override
	public List<Unit> selectDwList(Unit unit) {
		return queryList("selectDwList", unit);
	}

	@Override
	public List<TreeNode> getBmbmTreeByName(HashMap<String, String> hm) {
		return queryList("getBmbmTreeByName", hm);
	}
	@Override
	public List<TreeNode> getWhTreeByName(HashMap<String, String> hm) {
		return queryList("getWhTreeByName", hm);
	}
	@Override
	public boolean insertDw(Unit unit) {
		int b=insert("insertDw", unit);
		int b2;
		
		return b>0?true:false;
	}

	@Override
	public boolean deleteDwById(Unit unit) {
		int b=delete("deleteDwById", unit);
		return b>0?true:false;
	}

	@Override
	public List<Unit> selectDwById(Unit unit) {
		return queryList("selectDwById", unit);
	}

	@Override
	public boolean updateDw(Unit unit) {
		int b=update("updateDw", unit);
		return b>0?true:false;
	}

	@Override
	public int selectBmbmListCount(Unit unit) {
		return queryOne("selectBmbmListCount", unit);
	}

	@Override
	public List<Unit> selectBmbmList(Unit unit) {
		return queryList("selectBmbmList", unit);
	}

	@Override
	public boolean insertBmbm(Unit unit) {
		int b=insert("insertBmbm", unit);
		return b>0?true:false;
	}

	@Override
	public boolean updateBmbm(Unit unit) {
		int b=update("updateBmbm", unit);
		return b>0?true:false;
	}

	@Override
	public boolean deleteBmbmById(Unit unit) {
		int b=delete("deleteBmbmById", unit);
		return b>0?true:false;
	}

	@Override
	public List<Master> checkname(HashMap hm) {
		return queryList("checkname",hm);
	}

	@Override
	public List<Param> selectTsdqList(Param param) {
		return queryList("selectTsdqList", param);
	}

	@Override
	public int selectXzqhListCount(Unit unit) {
		return queryOne("selectXzqhListCount", unit);
	}

	@Override
	public List<Unit> selectXzqhList(Unit unit) {
		return queryList("selectXzqhList", unit);
	}

	
	@Override
	public List<Unit> checkXzqhCfById(Unit unit) {
		return queryList("checkXzqhCfById", unit);
	}

	@Override
	public boolean insertXzqh(Unit unit) {
		int b=insert("insertXzqh", unit);
		return b>0?true:false;
	}

	@Override
	public boolean updateXzqh(Unit unit) {
		int b=update("updateXzqh", unit);
		return b>0?true:false;
	}

	@Override
	public boolean deleteXzqhById(Unit unit) {
		int b=delete("deleteXzqhById", unit);
		return b>0?true:false;
	}

	@Override
	public boolean updateTsdqZt(Param param) {
		int b=update("updateTsdqZt", param);
		return b>0?true:false;
	}

	@Override
	public List<TreeNode> selAllTsdq2(String yhdw) {
		return queryList("selAllTsdq2", yhdw);
	}

	@Override
	public List<TreeNode> selAllTsdq(String yhdw) {
		return queryList("selAllTsdq", yhdw);
	}

	@Override
	public boolean insertTsdq(Param param) {
		String id=UUID.randomUUID().toString();
		param.setId(id);
		List<HashMap<String, String>> nl=new ArrayList<HashMap<String,String>>();
		String[] arr=param.getXzqhdm().split(",");
		String[] arr2=param.getXzqh().split(",");
		for(int i=0;i<arr.length;i++){
			HashMap<String, String> hm=new HashMap<String, String>();
			hm.put("parent", id);
			hm.put("xzqhdm", arr[i]);
			hm.put("xzqh", arr2[i]);
			nl.add(hm);
		}
		if(insert("insertTsdq", param)>0){
			if(insertBatch("insertTsdqList", nl)>0){
				return true;
			}else return false;
		}else return false;
	}

	@Override
	public boolean deleteTsdqById(Param param) {
		if(delete("deleteTsdqById", param)>0){
			if(delete("deleteTsdqList", param)>0){
				return true;
			}else return false;
		}else return false;
		
	}

	@Override
	public Param selectTsdqById(Param param) {
		return queryOne("selectTsdqById", param);
	}

	@Override
	public List<TreeNode> selAllBm(String yhdw) {
		return queryList("selAllBm", yhdw);
	}

	@Override
	public List<TreeNode> selAllBm2(String yhdw) {
		return queryList("selAllBm2", yhdw);
	}

	@Override
	public boolean updateTsdq(Param param) {
		List<HashMap<String, String>> nl=new ArrayList<HashMap<String,String>>();
		String[] arr=param.getXzqhdm().split(",");
		String[] arr2=param.getXzqh().split(",");
		System.out.println(param.getId());
		for(int i=0;i<arr.length;i++){
			HashMap<String, String> hm=new HashMap<String, String>();
			hm.put("parent", param.getId());
			hm.put("xzqhdm", arr[i]);
			hm.put("xzqh", arr2[i]);
			nl.add(hm);
		}
		if(update("updateTsdq", param)>0){
			if(delete("deleteTsdqListById", param)>0){
				if(insertBatch("insertTsdqList", nl)>0){
					return true;
				}else return false;
			}else return false;
		}else return false;
	}

	@Override
	public Master selectYhById(Master master) {
		return queryOne("selectYhById", master);
	}

	@Override
	public List<TreeNode> selAllQx(String yhdw) {
		return queryList("selAllQx", yhdw);
	}

	@Override
	public List<TreeNode> selAllQx2(String yhdw) {
		return queryList("selAllQx2", yhdw);
	}

	@Override
	public Param selectJsById(Param param) {
		return queryOne("selectJsById", param);
	}

	@Override
	public boolean updateJs(Param param) {
		String id=param.getRoleid();
		param.setId(id);
		param.setRoleid("('"+param.getRoleid()+"')");
		List<Param> l=new ArrayList<Param>();
		String[] s=param.getSource().split(",");
		for (int i=0;i<s.length;i++){
			Param p=new Param();
			p.setRoleid(id);
			p.setSourceid(s[i]);
			l.add(p);
		}
		if (update("updateJs", param)>0){
			if(delete("deleteRoleSourceById",param)>=0){
				if(insertBatch("insertRoleSourceBatch", l)>0){
					return true;
				}else return false;
			}else return false;
		}else return false;
		
	}

	@Override
	public List<Param> selQxByUser(Param param) {
		return queryList("selQxByUser", param);
	}

	@Override
	public List<Param> selQxByUser1(Param param) {
		return queryList("selQxByUser1", param);
	}
	
	@Override
	public List<TreeNode> selQxByRoleid(Param param) {
		return queryList("selQxByRoleid", param);
	}

	@Override
	public List<Param> selQxListByRoleid(Param param) {
		return queryList("selQxListByRoleid", param);
	}

	@Override

	public List<Unit> selectLxQlDataList(String id) {
		HashMap<String, String> hm=new HashMap<String, String>();
		
		if(id.length()==7){
			//路线
			String xzqh=id.substring(1);
			String roadcode=id.substring(0,1);
			hm.put("xzqh",xzqh);
			hm.put("roadcode",roadcode);
			return queryList("selectLxDataList", hm);
		}else{
			//桥梁
			hm.put("roadcode",id);
			
			return queryList("selectQlDataList", hm);
		}
	}
	
	public List<Plan_flwbzbz> queryFlwbzbz() {
		return queryList("queryFlwbzbz");
	}

	

	@Override
	public List<TreeNode> loadBmbmList(Unit unit) {
		return queryList("loadBmbmList",unit);
	}

	@Override
	public List<Param> selSqlStrByLxid(Param param) {System.out.println(param.getSourceid());
		if(param.getSourceid().length()==7){//shengji
			System.out.println("sheng");
			if("_____36".equals(param.getSourceid())) param.setSourceid("");
			return queryList("selSqlStrByLxid_sheng", param);
		}else if(param.getSourceid().length()==9){//shi
			System.out.println("shi");
			return queryList("selSqlStrByLxid_shi", param);
		}else{
			System.out.println("xian");
			return queryList("selSqlStrByLxid_xian", param);
		}
	}

	
	@Override
	public List<Param> checkJsCfByName(Param param) {
		return queryList("checkJsCfByName", param);
	}

	@Override
	public List<Param> selJsUsedById(Param param) {
		return queryList("selJsUsedById", param);
	}

	

	@Override
	public HashMap<String, String> loginCheck(HashMap hm) {
		HashMap lhm=queryOne("loginCheck",hm);
		return lhm;
	}

	@Override
	public List<Master> userlogin(String master) {
		return queryList("userlogin", master);
	}

	@Override
	public List<TreeNode> createMenu(Unit unit) {
		return queryList("createMenu", unit);
	}

	@Override
	public Master selectPwd(String temp) {
		return queryOne("selectPwd", temp);
	}

	

	@Override
	public List<HashMap<String, String>> selBmbmList() {
		return queryList("selBmbmList");
	}

	
	@Override
	public Unit getbmbmbyid(Unit unit) {
		return queryOne("getbmbmbyid", unit);
	}

	@Override
	public List<TreeNode> getjhxdwh(String tablename) {
		return queryList("getjhxdwh", tablename);
	}

	@Override
	public List<TreeNode> selAllXzqh1(String yhdw) {
		return queryList("selAllXzqh1", yhdw);
	}
	@Override
	public List<TreeNode> selAllUnit1(String yhdw) {
		return queryList("selAllUnit1", yhdw);
	}
	
}
