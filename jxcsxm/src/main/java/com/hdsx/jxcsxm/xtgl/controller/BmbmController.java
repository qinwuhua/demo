package com.hdsx.jxcsxm.xtgl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.hdsx.webutil.struts.BaseActionSupport;
import com.hdsx.jxcsxm.xtgl.bean.BmTree;
import com.hdsx.jxcsxm.xtgl.bean.Bmbm2;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.xtgl.bean.TreeNode;
import com.hdsx.jxcsxm.xtgl.bean.Unit;
import com.hdsx.jxcsxm.xtgl.server.XtglServer;

@Controller
public class BmbmController extends BaseActionSupport{

	private static final long serialVersionUID = 1L;
	@Resource (name="xtglServerImpl")
	private XtglServer xtglServer;
	private String name;
	private  HashMap<String, List<Bmbm2>> hm=new  HashMap<String,List<Bmbm2>>();
	private  List<HashMap<String,String>> list;

	private  HashMap<String,List<BmTree>> treehm=new  HashMap<String,List<BmTree>>();

	public String getName() {
		return name;
	}

	public void setName(String name) {
		bankLock.lock();
		this.name = name;
	}
	private Lock bankLock=new ReentrantLock();
	public void createBmbmByName(){
		list =  xtglServer.selBmbmList();
		String name="";
		for(int i=0;i<list.size();i++){
			if(list.get(i).get("ID").length()==4){
				List<Bmbm2> list2=new ArrayList<Bmbm2>();
				name=list.get(i).get("NAME");
				hm.put(name, list2);
				
				List<BmTree> listTree=new ArrayList<BmTree>();
				treehm.put(name, listTree);
			}else{
				hm.get(name).add(new Bmbm2(list.get(i).get("ID"),list.get(i).get("NAME")));
				
				BmTree bmTree=new BmTree();
				bmTree.setId("'"+list.get(i).get("NAME")+"'");
				bmTree.setText(list.get(i).get("NAME"));
				bmTree.setChecked(false);
				bmTree.setIconCls("icon-none");
				treehm.get(name).add(bmTree);
			}
		}
	}

	public void getBmbmByName(){
		String[] s=name.split(",");
		List<List<Bmbm2>> llist=new ArrayList<List<Bmbm2>>();
		for(int i=0;i<s.length;i++){
			List<Bmbm2> nalist=hm.get(s[i]);
			if(nalist ==null){
				createBmbmByName();
				nalist=hm.get(s[i]);
				if(nalist ==null){
					nalist =new ArrayList<Bmbm2>();
				}
			}
			llist.add(nalist);
		}
		
		try {
			JsonUtils.write(llist, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			bankLock.unlock();
		}
			
	}

	public void getBmbmTreeByName(){
		System.out.println("name="+name);
		String[] s=name.split(",");
		List<List<BmTree>> llist=new ArrayList<List<BmTree>>();
		
		for(int i=0;i<s.length;i++){
			List<BmTree> nalist=treehm.get(s[i]);
			if(nalist ==null){
				createBmbmByName();
				nalist=treehm.get(s[i]);
				if(nalist ==null){
					nalist =new ArrayList<BmTree>();
				}
			}
			llist.add(nalist);
		}
		
		try {
			JsonUtils.write(llist, getresponse().getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			bankLock.unlock();
		}
			
	}
	
}
