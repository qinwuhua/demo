package com.hdsx.jxcsxm.zcgl.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.hdsx.jxcsxm.utile.EasyUIPage;
import com.hdsx.jxcsxm.utile.JsonUtils;
import com.hdsx.jxcsxm.utile.MyFile;
import com.hdsx.jxcsxm.utile.MyUtil;
import com.hdsx.jxcsxm.utile.ResponseUtils;
import com.hdsx.jxcsxm.zcgl.bean.Zcgl;
import com.hdsx.jxcsxm.zcgl.server.ZcglServer;
import com.hdsx.webutil.struts.BaseActionSupport;
import com.opensymphony.xwork2.ModelDriven;



/**
 * 系统管理Controller层
 * @author xunq
 *
 */
@SuppressWarnings("serial")
@Scope("prototype")
@Controller
public class ZcglController extends BaseActionSupport implements ModelDriven<Zcgl>{
	
	//定义变量
	private int page = 1;
	private int rows = 10;
	@Resource(name = "zcglServerImpl")
	private ZcglServer zcglServer;
	private File uploadFj;
	private String uploadFjFileName;
	private MyFile myFile=new MyFile();
	
	public MyFile getMyFile() {
		return myFile;
	}
	public void setMyFile(MyFile myFile) {
		this.myFile = myFile;
	}
	public File getUploadFj() {
		return uploadFj;
	}
	public void setUploadFj(File uploadFj) {
		this.uploadFj = uploadFj;
	}
	public String getUploadFjFileName() {
		return uploadFjFileName;
	}
	public void setUploadFjFileName(String uploadFjFileName) {
		this.uploadFjFileName = uploadFjFileName;
	}


	private Zcgl zcgl=new Zcgl();
	@Override
	public Zcgl getModel() {
		return zcgl;
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
	public Zcgl getZcgl() {
		return zcgl;
	}
	public void setZcgl(Zcgl zcgl) {
		this.zcgl = zcgl;
	}
	
	public void queryZclist(){
		try {
			
			zcgl.setGydw(MyUtil.getQueryTJDW(zcgl.getGydw(), "gydwdm"));
			zcgl.setShzt(MyUtil.getQueryTJ(zcgl.getShzt(), "shztstr||sftx"));
			zcgl.setSsbzt(MyUtil.getQueryTJ(zcgl.getSsbzt(), "ssbztstr||sftx"));
			zcgl.setXsbzt(MyUtil.getQueryTJ(zcgl.getXsbzt(), "xsbztstr||sftx"));
			zcgl.setJsdj(MyUtil.getQueryTJ(zcgl.getJsdj(), "jsdj"));
			List<Zcgl> list=zcglServer.queryZclist(zcgl);
			int count=zcglServer.queryZclistCount(zcgl);
			EasyUIPage<Zcgl> e=new EasyUIPage<Zcgl>();
			e.setRows(list);
			e.setTotal(count);
			JsonUtils.write(e, getresponse().getWriter());	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void getsfktj(){
		ResponseUtils.write(getresponse(), ""+zcglServer.getsfktj(zcgl));
	}
	
	public void insertZcgl(){
		ResponseUtils.write(getresponse(), ""+zcglServer.insertZcgl(zcgl));
	}
	
	public void plsbshzc(){
		String tj=MyUtil.getQueryTJ(zcgl.getId(), "id");
		tj=tj.substring(4, tj.length());
		zcgl.setId(tj);
		ResponseUtils.write(getresponse(), ""+zcglServer.plsbshzc(zcgl));
	}
	
	
	//上传附件
	public void uploadFj() {
		try {
			HttpServletResponse response = getresponse();
			String fileurl = "D:\\江西财审项目附件\\fj\\" + zcgl.getXmlx() + "\\";
			File file = new File(fileurl);
			if (uploadFj != null) {
				String fileMd5 = MyUtil.getFileMD5(uploadFj);
				MyFile mFile = new MyFile();
				mFile.setFid(zcgl.getId());
				mFile.setFilemd5(fileMd5);
				mFile.setFilename(uploadFjFileName);
				mFile.setXmlx(zcgl.getXmlx());
				mFile.setFileurl("D:\\江西财审项目附件/fj/" + zcgl.getXmlx() + "/"
						+ fileMd5 + uploadFjFileName);
				//查询该文件是否存在，子虚比较md5在数据库是否已存在，存在就有，不存在就没有。
				MyFile result = zcglServer.queryFjByMd5(mFile);
				if (result != null) {
					mFile.setFileurl(result.getFileurl());
					//添加数据库
					zcglServer.insertFile(mFile);
					response.getWriter().print(uploadFjFileName+"上传成功！");
				} else {
					//添加数据库
					zcglServer.insertFile(mFile);
					uploadFile(file, fileMd5 + uploadFjFileName);
					response.getWriter().print(uploadFjFileName+"上传成功！");
				}

			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	//文件上传
	private void uploadFile(File file,String fileName) throws 	FileNotFoundException,IOException {
		if(!file.exists()){
			file.mkdirs();
		}
		InputStream is = new FileInputStream(uploadFj); 
		File saveFile =new File(file, fileName);
		OutputStream os = new FileOutputStream(saveFile);
		//设置缓存  
		byte[] buffer = new byte[1024]; 
		int length = 0;
		while((length= is.read(buffer))>0){
			os.write(buffer,0,length);
		}
		is.close();
		os.flush();
		os.close();
	}
	//查询附件
	public void queryFjByfid() {
		try {
			JsonUtils.write(zcglServer.queryFjByfid(myFile), getresponse().getWriter());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//下载附件
	public void downFile() {
		//通过文件id查询文件
		MyFile m=zcglServer.queryFjByid(myFile);
		File f=new File(m.getFileurl());
		try {
			HttpServletResponse response = getresponse();
			OutputStream out = response.getOutputStream();
			response.setContentType("application/x-download");
			response.addHeader("Content-Disposition",
					"attachment;filename="
							+ new String(m.getFilename().getBytes("GBK"),
									"ISO-8859-1"));
			byte[] buffer = new byte[1024];
			InputStream is = new FileInputStream(f);
			int length = 0;
			while ((length = is.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
			out.write(buffer);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//删除文件
	public void deleteFjByfidorid() {
		try {
			//首先判断是id还是fid
			List<MyFile> l=new ArrayList<MyFile>();
			if("id".equals(myFile.getFlag())) {
				myFile.setId(myFile.getFid());
				l=zcglServer.queryFileByid(myFile);
			}else {
				l=zcglServer.queryFileByfid(myFile);
			}
			if(l.size()>0)
			for (MyFile m : l) {
				//是否有别的文件。
				List<MyFile> m1=zcglServer.queryFileBymd5(m);
				if(m1.size()>0) {
					//删除数据库即可
					zcglServer.deleteFileByid(m);
					
				}else {
					//删除数据库和本地
					zcglServer.deleteFileByid(m);
					File f=new File(m.getFileurl());
					if(f.exists()) {//判断文件是否存在  
						f.delete();
					}
					
				}
				
			}
			
			ResponseUtils.write(getresponse(), "true");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	//复制数据
	public void copydatabyyear() {
		try {
			boolean bl=zcglServer.copydatabyyear(zcgl);
			ResponseUtils.write(getresponse(), bl+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//添加
	public void insertZcglqt() {
		try {
			boolean bl=zcglServer.insertZcglqt(zcgl);
			ResponseUtils.write(getresponse(), bl+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
