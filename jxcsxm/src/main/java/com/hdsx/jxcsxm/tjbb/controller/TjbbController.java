package com.hdsx.jxcsxm.tjbb.controller;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxcsxm.tjbb.bean.ExcelData;
import com.hdsx.jxcsxm.tjbb.bean.Excel_export;
import com.hdsx.jxcsxm.tjbb.bean.Excel_list;
import com.hdsx.jxcsxm.tjbb.bean.Excel_tilte;
import com.hdsx.jxcsxm.tjbb.server.TjbbServer;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.utile.MyUtil;
import com.hdsx.jxcsxm.utile.ResponseUtils;
import com.hdsx.jxcsxm.xtgl.bean.TreeNode;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
import com.hdsx.jxcsxm.zjdw.bean.XmZjdw;
import com.hdsx.jxcsxm.zjdw.server.ZjdwServer;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;



/**
 * Controller层
 * @author qwh
 *
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller
public class TjbbController extends BaseActionSupport implements ModelDriven<Excel_list>{
	
	@Resource(name = "tjbbServerImpl")
	private TjbbServer tjbbServer;
	private Excel_list elist=new Excel_list();
	@Override
	public Excel_list getModel() {
		return elist;
	}
	
	public void createBtTree(){
		
		List<TreeNode> l=tjbbServer.createBtTree(elist);
		TreeNode root = returnRoot1(l,l.get(0));
		List<TreeNode> children1 = new ArrayList<TreeNode>();
		children1.add(l.get(0));
		List<TreeNode> children = root.getChildren();
		children1.get(0).setChildren(children);
		try{
		    String s=JSONArray.fromObject(children1).toString();
            ResponseUtils.write(getresponse(), s);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	private TreeNode returnRoot1(List<TreeNode> list, TreeNode zzjgTree){
		for(TreeNode temp : list){
			if(temp!=zzjgTree){
				if(temp.getParent() != null &&temp.getParent() !="" && temp.getParent().equals(zzjgTree.getId())){
					if(zzjgTree.getId().indexOf("v")!=-1){
						zzjgTree.setState("close");
					}
					else{
						zzjgTree.setState("open");
					}
					zzjgTree.getChildren().add(temp);
					returnRoot1(list,temp);
				}
			}
		}
		return zzjgTree;
	}
	
	//获取jsp页面自定义表头
		public void getZdyBbzd(){
			try {	
				
		    	  List<Excel_list> list=new ArrayList<Excel_list>();
				     list=tjbbServer.getZdyBbzd(elist);
		    	//以上代码就是为了获取SQL语句的查询结果，并且封装到了一个实体里面。以下的这一段代码是在拼接表头。
			      String html="<tr>";
			      String rowxh="0";
			      for(int i=0;i<list.size();i++){
			    	  if(!rowxh.equals(list.get(i).getRowxh())){
			    		  html=html+"</tr><tr>";
			    		  rowxh=list.get(i).getRowxh();
			    	  }
			    	
			    	  if("".equals(list.get(i).getWidth())||list.get(i).getWidth()==null){
				    	  html=html+"<td rowspan='"+list.get(i).getHight()+"'  colspan='"+list.get(i).getCo()+"'>"+list.get(i).getName()+"</td>";
			    	  }else{
				    	  html=html+"<td style='width:"+list.get(i).getWidth()+"px;' rowspan='"+list.get(i).getHight()+"'  colspan='"+list.get(i).getCo()+"'>"+list.get(i).getName()+"</td>";
			    	  }
			      }
			      html=html+"</tr>";
			      System.out.println(html);
			      Excel_list e=new Excel_list();
			      e.setCol(html);
				  JsonUtils.write(e, getresponse().getWriter());
				} catch (Exception e1) {
					
					e1.printStackTrace();
				}
		}
	
	
	public void getJhzxqkb(){
		try {
			if ("1".equals(elist.getFlag())) {
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("计划执行情况表");//设置第一行
				eldata.setSheetName("sheet1");//设置sheeet名
				eldata.setFileName("计划执行情况表");//设置文件名
				
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				List<Excel_list> list=new ArrayList<Excel_list>();
		    	  	HttpServletRequest request = ServletActionContext.getRequest();
					HttpSession session = request.getSession();
					elist.setName((String) session.getAttribute("nameValue"));
				    list=tjbbServer.getZdyBbzd(elist);
				    
				    String col=(String) session.getAttribute("colValue");
				    String datalist=(String) session.getAttribute("sql");
				    JSONArray ja = JSONArray.fromObject(datalist);  
				    @SuppressWarnings("unchecked")
					List<Excel_list> list1 = (List<Excel_list>) JSONArray.toList(ja,
							new Excel_list(), new JsonConfig());
		    	//以上代码就是为了获取SQL语句的查询结果，并且封装到了一个实体里面。以下的这一段代码是在拼接表头。
					
			      int rowxh=0,col1=0,col2=0;
			      int colint=0;
			      int a[][]=new int[4][85];
			      int flag=0;
			      for(int i=0;i<list.size();i++){
			    	  if(rowxh!=Integer.parseInt(list.get(i).getRowxh())-1){
			    		  rowxh=Integer.parseInt(list.get(i).getRowxh())-1;
			    		  col1=colint;
			    		  flag=0;
			    	  }
			    	  list.get(i).setRow1(Integer.parseInt(list.get(i).getRowxh())-1);
			    	  list.get(i).setRow2(Integer.parseInt(list.get(i).getRowxh())-1+Integer.parseInt(list.get(i).getHight())-1);
			    	 
			    	 
			    	  while(a[rowxh][col1]!=0){
			    		 col1=col1+a[rowxh][col1];
			    	  }
			    	  
			    	  if(Integer.parseInt(list.get(i).getHight())!=1){
			    		  for(int j=1;j<Integer.parseInt(list.get(i).getHight());j++){
			    			  a[rowxh+j][col1]=Integer.parseInt(list.get(i).getCo());
			    		  }
			    	  }else{
			    		  if(flag==0){
			    			  colint=col1;
			    			  flag=1;
			    		  }
			    	  }
			    	  
			    	  list.get(i).setCol1(col1);
			    	  col2=col1+Integer.parseInt(list.get(i).getCo())-1;
			    	  list.get(i).setCol2(col2);
			    	  col1=col1+Integer.parseInt(list.get(i).getCo());
			      }
			      
			      for (Excel_list ex : list) {
			    	  et.add(new Excel_tilte(ex.getName(),ex.getRow1()+1,ex.getRow2()+1,ex.getCol1(),ex.getCol2()));
			      }
			      
			     
			      String[] ls=col.split(",");
			      List<Excel_list> elst=new ArrayList<Excel_list>();
			     
			      for (Excel_list els : list1) {
			    	  Excel_list els1=new Excel_list(); 
					for (int i = 0; i < ls.length; i++) {
						
						 Field field1 = null; Field field2 = null; 
						 field1 = els1.getClass().getDeclaredField("v_"+i); 
						 field2 = els.getClass().getDeclaredField(ls[i]); 
					     field1.set((Object) els1, field2.get(els));  //set方法
						
					}
			    	elst.add(els1);  
				}
			      eldata.setEl(elst);//将实体list放入类中
				    
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_export(eldata,response);	
				
			} else {
				List<Excel_list> l = tjbbServer.getJhzxqkb(elist);
				JsonUtils.write(l, getresponse().getWriter());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
}
