package com.hdsx.jxcsxm.tjbb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.hdsx.jxcsxm.utile.EasyUIPage;
import com.hdsx.jxcsxm.utile.ExcelReader;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.utile.MyUtil;
import com.hdsx.jxcsxm.utile.ResponseUtils;
import com.hdsx.jxcsxm.xtgl.bean.TreeNode;
import com.hdsx.jxcsxm.xtgl.bean.Xmjbxx;
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
	private Xmjbxx xmjbxx=new Xmjbxx();
	private int page=1;
	private int rows=10;
	private Excel_list elist=new Excel_list();
	private File fileupload;
	private String fileuploadFileName;
	
	@Override
	public Excel_list getModel() {
		return elist;
	}
	
	public Xmjbxx getXmjbxx() {
		return xmjbxx;
	}

	public void setXmjbxx(Xmjbxx xmjbxx) {
		this.xmjbxx = xmjbxx;
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
			
			elist.setXmlx(MyUtil.getQueryTJ(elist.getXmlx(), "xm.jsxz||xm.gcfl"));
			elist.setJhxdwh(MyUtil.getQueryTJ(elist.getJhxdwh(), "xd.jhxdwh"));
			elist.setXzqhdm(MyUtil.getQueryTJ(elist.getXzqhdm(), "xm.xzqhdm"));
			elist.setJhnf(MyUtil.getQueryTJ(elist.getJhnf(), "xd.xdnf"));
			elist.setGydwdm(MyUtil.getQueryTJDW(elist.getGydw(), "xm.gydwdm"));
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
				    /*String datalist=(String) mylist;
				    System.out.println(datalist);
				    JSONArray ja = JSONArray.fromObject(datalist);  
				    @SuppressWarnings("unchecked")
					List<Excel_list> list1 = (List<Excel_list>) JSONArray.toList(ja,
							new Excel_list(), new JsonConfig());*/
				    List<Excel_list> list1 = (List<Excel_list>) session.getAttribute("zxqkblist");
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
				getRequest().getSession().setAttribute("zxqkblist", l);
				JsonUtils.write(l, getresponse().getWriter());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//台帐汇总表
	public void getTzhzb(){
		try {
			if ("1".equals(elist.getFlag())) {
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("台帐汇总表");//设置第一行
				eldata.setSheetName("sheet1");//设置sheeet名
				eldata.setFileName("台帐汇总表");//设置文件名
				
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				List<Excel_list> list=new ArrayList<Excel_list>();
		    	  	HttpServletRequest request = ServletActionContext.getRequest();
					HttpSession session = request.getSession();
					elist.setName((String) session.getAttribute("nameValue"));
				    list=tjbbServer.getZdyBbzd(elist);
				    
				    String col=(String) session.getAttribute("colValue");
				    
				    elist.setXmlx(MyUtil.getQueryTJ(elist.getXmlx(), "xm.jsxz||xm.gcfl"));
				    
					elist.setJhxdwh(MyUtil.getQueryTJ((String)session.getAttribute("sql"), "xd.jhxdwh"));
					elist.setXzqhdm(MyUtil.getQueryTJ((String)session.getAttribute("xzqhbb"), "xm.xzqhdm"));
					
				    
				    List<Excel_list> list1 = tjbbServer.getTzhzb(elist);
				   
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
			    	  if(list.get(i).getValue().indexOf("1v_")!=-1||list.get(i).getValue().indexOf("5v_")!=-1){
			    		  list.get(i).setRow1(Integer.parseInt(list.get(i).getRowxh())-1);
				    	  list.get(i).setRow2(Integer.parseInt(list.get(i).getRowxh())-1+Integer.parseInt(list.get(i).getHight()));
			    	  }else{
			    		  list.get(i).setRow1(Integer.parseInt(list.get(i).getRowxh())-1);
				    	  list.get(i).setRow2(Integer.parseInt(list.get(i).getRowxh())-1+Integer.parseInt(list.get(i).getHight())-1);
			    	  }
			    	 
			    	 
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
				elist.setXmlx(MyUtil.getQueryTJ(elist.getXmlx(), "xm.jsxz||xm.gcfl"));
				elist.setJhxdwh(MyUtil.getQueryTJ(elist.getJhxdwh(), "xd.jhxdwh"));
				elist.setXzqhdm(MyUtil.getQueryTJ(elist.getXzqhdm(), "xm.xzqhdm"));
				List<Excel_list> l = tjbbServer.getTzhzb(elist);
				
				JsonUtils.write(l, getresponse().getWriter());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void queryXmlist(){
		
		xmjbxx.setXzqh(MyUtil.getQueryTJ(xmjbxx.getXzqh(), "xzqhdm"));
		xmjbxx.setXmnf(MyUtil.getQueryTJ(xmjbxx.getXmnf(), "xmnf"));
		xmjbxx.setJsxz(MyUtil.getQueryTJ(xmjbxx.getJsxz(), "jsxz||gcfl"));
		xmjbxx.setJhxdwh(MyUtil.getQueryTJ(xmjbxx.getJhxdwh(), "jhxdwh"));
		xmjbxx.setGcfl(MyUtil.getQueryTJ(xmjbxx.getGcfl(), "gcfl"));
		xmjbxx.setShzt(MyUtil.getQueryTJ(xmjbxx.getShzt(), "shztstr"));
		xmjbxx.setSsbzt(MyUtil.getQueryTJ(xmjbxx.getSsbzt(), "ssbztstr"));
		xmjbxx.setXsbzt(MyUtil.getQueryTJ(xmjbxx.getXsbzt(), "xsbztstr"));
		xmjbxx.setPage(page);
		xmjbxx.setRows(rows);
		
		
		List<Xmjbxx> list=tjbbServer.queryXmlist(xmjbxx);
		int count=tjbbServer.queryXmlistCount(xmjbxx);
		EasyUIPage<Xmjbxx> e=new EasyUIPage<Xmjbxx>();
		e.setRows(list);
		e.setTotal(count);
		try {
			JsonUtils.write(e, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
		
	}
	
	//台帐明细表
	public void getTzmxb(){
		try {
		List<Excel_list> l=tjbbServer.getTzmxbbt(elist);
		if("1".equals(elist.getFlag())){
			
			ExcelData eldata=new ExcelData();//创建一个类
			eldata.setTitleName("台帐明细表");//设置第一行
			eldata.setSheetName("sheet1");//设置sheeet名
			eldata.setFileName("台帐明细表");//设置文件名
			
			List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
			if(l.size()>0){
				String[] dw=new String[0];
				if(l.get(0).getDwbt()!=null&&!"".equals(l.get(0).getDwbt()))
						dw=l.get(0).getDwbt().split(",");
				String[] bf=new String[0]; 
				if(l.get(0).getBfbt()!=null&&!"".equals(l.get(0).getBfbt()))
						bf=l.get(0).getBfbt().split(",");
				
				et.add(new Excel_tilte("科目明细",1,2,0,1));
		    	et.add(new Excel_tilte("计划下达数",1,2,2,2));  
		    	et.add(new Excel_tilte("截至上年收款",1,2,3,3));
		    	int k=3;
		    	if(dw.length>0){
		    		k=4;
		    		et.add(new Excel_tilte("本年收款明细",1,1,k,k+dw.length));
		    	}
		    	et.add(new Excel_tilte("截至上年拨款",1,2,k+dw.length+1,k+dw.length+1));
		    	if(bf.length>0){
		    		et.add(new Excel_tilte("本年拨付明细",1,1,k+dw.length+2,k+dw.length+bf.length+2));
		    	}else{
		    		k=3;
		    	}
		    	et.add(new Excel_tilte("累计收款",1,2,k+dw.length+bf.length+3,k+dw.length+bf.length+3));
		    	et.add(new Excel_tilte("累计拨款",1,2,k+dw.length+bf.length+4,k+dw.length+bf.length+4));
		    	et.add(new Excel_tilte("未收款数",1,2,k+dw.length+bf.length+5,k+dw.length+bf.length+5));
		    	et.add(new Excel_tilte("收款未拨数",1,2,k+dw.length+bf.length+6,k+dw.length+bf.length+6));
		    	et.add(new Excel_tilte("备注",1,2,k+dw.length+bf.length+7,k+dw.length+bf.length+7));
		    	for (int i = 0; i < dw.length; i++) {
		    		k=4;
		    		if(i==0){
		    		et.add(new Excel_tilte("小计",2,2,k,k));
		    		et.add(new Excel_tilte(dw[i],2,2,k+i+1,k+i+1));
		    		}
		    		else
		    			et.add(new Excel_tilte(dw[i],2,2,k+i+1,k+i+1));	
				}
		    	for (int i = 0; i < bf.length; i++) {
		    		if(i==0){
		    		et.add(new Excel_tilte("小计",2,2,k+dw.length+2,k+dw.length+2));
		    		et.add(new Excel_tilte(bf[i],2,2,k+dw.length+i+3,k+dw.length+i+3));
		    		}
		    		else
		    			et.add(new Excel_tilte(bf[i],2,2,k+dw.length+i+3,k+dw.length+i+3));
				}
		    	
			}
				
		    eldata.setEl(l);//将实体list放入类中
			eldata.setEt(et);//将表头内容设置到类里面
			HttpServletResponse response= getresponse();//获得一个HttpServletResponse
			Excel_export.excel_export(eldata,response);	
			
		}
		else
		JsonUtils.write(l, getresponse().getWriter());
		} catch (Exception e1) {
			e1.printStackTrace();
		}
	}
	
	public void getGlzcqkb(){
		try {
			
			if("1".equals(elist.getFlag())){
				HttpServletRequest request = ServletActionContext.getRequest();
				HttpSession session = request.getSession();
//				System.out.println(elist.getNf());
				elist.setGydw(MyUtil.getQueryTJ((String) session.getAttribute("gydwbb"), "gydwdm"));
				List<Excel_list> l = tjbbServer.getGlzcqkb(elist);
				
				ExcelData eldata=new ExcelData();//创建一个类
				eldata.setTitleName("公路资产情况表");//设置第一行
				eldata.setSheetName("sheet1");//设置sheeet名
				eldata.setFileName("公路资产情况表");//设置文件名
				
				List<Excel_tilte> et=new ArrayList<Excel_tilte>();//创建一个list存放表头
				et.add(new Excel_tilte("项目",1,2,0,1));
				et.add(new Excel_tilte("数量单位",1,2,2,2));
				et.add(new Excel_tilte("行次",1,2,3,3));
				et.add(new Excel_tilte("数量",1,1,4,7));
				et.add(new Excel_tilte("资产（价值）",1,1,8,9));
				et.add(new Excel_tilte("其中：负债",1,1,10,11));
				et.add(new Excel_tilte("期初数",2,2,4,4));
				et.add(new Excel_tilte("增加数",2,2,5,5));
				et.add(new Excel_tilte("减少数",2,2,6,6));
				et.add(new Excel_tilte("期末数",2,2,7,7));
				et.add(new Excel_tilte("期初数",2,2,8,8));
				et.add(new Excel_tilte("期末数",2,2,9,9));
				et.add(new Excel_tilte("期初数",2,2,10,10));
				et.add(new Excel_tilte("期末数",2,2,11,11));
				et.add(new Excel_tilte("栏次",3,3,0,3));
				et.add(new Excel_tilte("1",3,3,4,4));
				et.add(new Excel_tilte("2",3,3,5,5));
				et.add(new Excel_tilte("3",3,3,6,6));
				et.add(new Excel_tilte("4",3,3,7,7));
				et.add(new Excel_tilte("5",3,3,8,8));
				et.add(new Excel_tilte("6",3,3,9,9));
				et.add(new Excel_tilte("7",3,3,10,10));
				et.add(new Excel_tilte("8",3,3,11,11));
				
				eldata.setEl(l);//将实体list放入类中
				eldata.setEt(et);//将表头内容设置到类里面
				HttpServletResponse response= getresponse();//获得一个HttpServletResponse
				Excel_export.excel_exportGlzcqkb(eldata,response);	
			}else{
				elist.setGydw(MyUtil.getQueryTJ(elist.getGydw(), "gydwdm"));
				List<Excel_list> l = tjbbServer.getGlzcqkb(elist);
				JsonUtils.write(l, getresponse().getWriter());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	
	//导入用友报表
	public void importTjbb() {
		
		System.out.println("进入方法");
		String fileType=fileuploadFileName.substring(fileuploadFileName.length()-3, fileuploadFileName.length());
		HttpServletResponse response = getresponse();
		try{
			if(!"xls".equals(fileType)&&!"xlsx".equals(fileType)){
				response.getWriter().print(fileuploadFileName+"不是系统导出的excel模版文件");
				return ;
			}
			response.setCharacterEncoding("utf-8"); 
			FileInputStream fs = new FileInputStream(this.fileupload);
			List<Map>[] dataMapArray;
			try{
				dataMapArray = ExcelReader.readExcelContent(0,20,fs,Object.class);
			}catch(Exception e){
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			//System.out.println(dataMapArray[0]);
			List<Map> data = ExcelReader.removeBlankRow(dataMapArray[0]);
			
			if(data.size()>=1) {
				//验证()
				if("bzsrzcb".equals(elist.getXmlx())) {
					if(data.get(3).get("0").equals("项目")&&data.get(3).get("1").equals("本年数")&&data.get(3).get("2").equals("上年数")&&data.size()==51) {
						List<Map> rm =new ArrayList<Map>();
						rm.add(data.get(0));rm.add(data.get(1));rm.add(data.get(2));rm.add(data.get(3));
						data.removeAll(rm);
					}else {
						response.getWriter().print(fileuploadFileName+"数据有误");
						return;
					}
				}
				else if("bycbb".equals(elist.getXmlx())) {
					
					if(data.get(2).get("0").equals("项       目")&&data.get(2).get("1").equals("合   计")&&data.get(2).get("2").equals("国     道")&&data.size()==20) {
						List<Map> rm =new ArrayList<Map>();
						rm.add(data.get(0));rm.add(data.get(1));rm.add(data.get(2));rm.add(data.get(3));rm.add(data.get(4));
						data.removeAll(rm);
					}else {
						response.getWriter().print(fileuploadFileName+"数据有误");
						return;
					}
					
				}
				
				else if("zjbdb".equals(elist.getXmlx())) {
					if(data.get(3).get("0").equals("项目")&&data.get(3).get("1").equals("金额")&&data.get(3).get("2").equals("项目")&&data.size()==28) {
						List<Map> rm =new ArrayList<Map>();
						rm.add(data.get(0));rm.add(data.get(1));rm.add(data.get(2));rm.add(data.get(3));
						data.removeAll(rm);
					}else {
						response.getWriter().print(fileuploadFileName+"数据有误");
						return;
					}
					
				}
				
				else if("srzcb".equals(elist.getXmlx())) {
					for (Map map : data) {
						System.out.println(map);
					}
					System.out.println(data.size());
					if(data.get(3).get("0").equals("项目")&&data.get(3).get("1").equals("本月数")&&data.get(3).get("2").equals("本年累计数")&&data.size()==29) {
						List<Map> rm =new ArrayList<Map>();
						rm.add(data.get(0));rm.add(data.get(1));rm.add(data.get(2));rm.add(data.get(3));
						data.removeAll(rm);
					}else {
						response.getWriter().print(fileuploadFileName+"数据有误");
						return;
					}
				}
				else if("zxqkb".equals(elist.getXmlx())) {
					
					if(data.get(2).get("0").equals("项        目")&&data.get(2).get("1").equals("行次")&&data.get(2).get("2").equals("上年结转")&&data.size()==26) {
						List<Map> rm =new ArrayList<Map>();
						rm.add(data.get(0));rm.add(data.get(1));rm.add(data.get(2));rm.add(data.get(3));
						data.removeAll(rm);
					}else {
						response.getWriter().print(fileuploadFileName+"数据有误");
						return;
					}
				}
				else if("zcfzb".equals(elist.getXmlx())) {
					
					if(data.get(3).get("0").equals("资产")&&data.get(3).get("1").equals("期末余额")&&data.get(3).get("2").equals("年初余额")&&data.size()==33) {
						List<Map> rm =new ArrayList<Map>();
						rm.add(data.get(0));rm.add(data.get(1));rm.add(data.get(2));rm.add(data.get(3));
						data.removeAll(rm);
					}else {
						response.getWriter().print(fileuploadFileName+"数据有误");
						return;
					}
				}
				else {
					response.getWriter().print(fileuploadFileName+"数据有误");
					return;
				}
			}else {
				response.getWriter().print(fileuploadFileName+"数据有误");
				return;
			}
			//处理数据
			for (int i = 0; i < data.size(); i++) {
				HttpServletRequest request = getRequest();
				HttpSession session = request.getSession();
				//			
				data.get(i).put("XH", i+1);
				data.get(i).put("XMLX", elist.getXmlx());
				data.get(i).put("GYDW", elist.getGydw());
				data.get(i).put("NF", (String) session.getAttribute("nf"));
				data.get(i).put("YF", (String) session.getAttribute("yf"));
				data.get(i).put("V_0", data.get(i).get("0").toString().trim());
				data.get(i).put("V_1", data.get(i).get("1").toString().trim());
				data.get(i).put("V_2", data.get(i).get("2").toString().trim());
				data.get(i).put("V_3", data.get(i).get("3").toString().trim());
				data.get(i).put("V_4", data.get(i).get("4").toString().trim());
				data.get(i).put("V_5", data.get(i).get("5").toString().trim());
				data.get(i).put("V_6", data.get(i).get("6").toString().trim());
				data.get(i).put("V_7", data.get(i).get("7").toString().trim());
				data.get(i).put("V_8", data.get(i).get("8").toString().trim());
				data.get(i).put("V_9", data.get(i).get("9").toString().trim());
				data.get(i).put("V_10", data.get(i).get("10").toString().trim());
				data.get(i).put("V_11", data.get(i).get("11").toString().trim());
				data.get(i).put("V_12", data.get(i).get("12").toString().trim());
				data.get(i).put("V_13", data.get(i).get("13").toString().trim());
				data.get(i).put("V_14", data.get(i).get("14").toString().trim());
				data.get(i).put("V_15", data.get(i).get("15").toString().trim());
				data.get(i).put("V_16", data.get(i).get("16").toString().trim());
				data.get(i).put("V_17", data.get(i).get("17").toString().trim());
				data.get(i).put("V_18", data.get(i).get("18").toString().trim());
				data.get(i).put("V_19", data.get(i).get("19").toString().trim());
				
				
			}
		
			//将数据插入到数据库
			boolean b=tjbbServer.importTjbb(data);
			if(b)
				response.getWriter().print(fileuploadFileName+"导入成功");
			else 
				response.getWriter().print(fileuploadFileName+"导入失败");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
	}
	
	
	/**
	 * 查询用友报表
	 */
	public void getTjbb() {
		try {
			elist.setGydw(MyUtil.getQueryTJ(elist.getGydw(), "gydw"));
			elist.setYf(MyUtil.getQueryTJ(elist.getYf(), "yf"));
			List<Excel_list> list = tjbbServer.getTjbb(elist);
			JsonUtils.write(list, getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
}
