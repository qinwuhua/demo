package com.hdsx.jxcsxm.zcgl.server.impl;




import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import com.hdsx.dao.query.base.BaseOperate;
import com.hdsx.jxcsxm.utile.MyFile;
import com.hdsx.jxcsxm.zcgl.bean.Zcgl;
import com.hdsx.jxcsxm.zcgl.server.ZcglServer;



@Service
public class ZcglServerImpl extends BaseOperate  implements ZcglServer{

	public ZcglServerImpl() {
		super("zcgl", "jdbc");
	}

	@Override
	public List<Zcgl> queryZclist(Zcgl zcgl) {
		return queryList("queryZclist", zcgl);
	}

	@Override
	public int queryZclistCount(Zcgl zcgl) {
		return queryOne("queryZclistCount", zcgl);
	}

	@Override
	public boolean getsfktj(Zcgl zcgl) {
		int a=queryOne("getsfktj", zcgl);
		return a>0;
	}

	@Override
	public boolean insertZcgl(Zcgl zcgl) {
		boolean bl=false;
		if("1".equals(zcgl.getSfbj())){
			bl=update("updateZcgl", zcgl)>0;
		}else{
			zcgl.setSfbj("1");
			bl=insert("insertZcgl", zcgl)>0;
		}
		
		return bl;
	}

	@Override
	public boolean plsbshzc(Zcgl zcgl) {
		return update("plsbshzc", zcgl)>0;
	}

	@Override
	public MyFile queryFjByMd5(MyFile mFile) {
		return queryOne("queryFjByMd5", mFile);
	}

	@Override
	public boolean insertFile(MyFile mFile) {
		return insert("insertFile", mFile)==1;
	}

	@Override
	public List<MyFile> queryFjByfid(MyFile myFile) {
		return queryList("queryFjByfid",myFile);
	}

	@Override
	public MyFile queryFjByid(MyFile myFile) {
		return queryOne("queryFjByid", myFile);
	}

	@Override
	public List<MyFile> queryFileByid(MyFile myFile) {
		return queryList("queryFjByid",myFile);
	}

	@Override
	public List<MyFile> queryFileByfid(MyFile myFile) {
		return queryList("queryFjByfid", myFile);
	}

	@Override
	public List<MyFile> queryFileBymd5(MyFile m) {
		return queryList("queryFileBymd5",m);
	}

	@Override
	public boolean deleteFileByid(MyFile m) {
		return delete("deleteFileByid", m)==1;
	}

	@Override
	public boolean copydatabyyear(Zcgl zcgl) {
		List<Zcgl> l=queryList("queryListzcqtbynf",zcgl);
		if(l.size()>0) {
			int i=0;
			String str="";
			for (Zcgl zc : l) {
				if(i==0)
				str+="'"+zc.getXmbm()+"'";
				else
				str+=",'"+zc.getXmbm()+"'";
			}
			zcgl.setXmbm(str);
			insert("copydatabyyear", zcgl);
			insert("copydatabyyearfj", zcgl);
			
			
			
		}
		
		
		
		
		return false;
	}

	@Override
	public boolean insertZcglqt(Zcgl zcgl) {
		return insert("insertZcglqt", zcgl)==1;
	}

	@Override
	public List<Zcgl> queryZcqtlist(Zcgl zcgl) {
		return queryList("queryZcqtlist",zcgl);
	}

	@Override
	public int queryZcqtlistCount(Zcgl zcgl) {
		return queryOne("queryZcqtlistCount", zcgl);
	}

	@Override
	public boolean deleteZcqt(Zcgl zcgl) {
		//先删本地文件
		
		List<MyFile> l=new ArrayList<MyFile>();
		l=queryList("queryZcqtwj",zcgl);
		
		if(l.size()>0)
		for (MyFile m : l) {
			//是否有别的文件。
			List<MyFile> m1=queryList("queryFileBymd5",m);
			if(m1.size()>0) {
				//删除数据库即可
				delete("deleteFileByid",m);
			
			}else {
				//删除数据库和本地
				delete("deleteFileByid",m);
				File f=new File(m.getFileurl());
				if(f.exists()) {//判断文件是否存在  
					f.delete();
				}
				
			}
			
		}
		return delete("deleteZcqt",zcgl)>0;
	}

	@Override
	public boolean updateZcglqt(Zcgl zcgl) {
		return update("updateZcglqt", zcgl)>0;
	}

	@Override
	public boolean plsbshzcqt(Zcgl zcgl) {
		return update("plsbshzcqt", zcgl)>0;
	}

	
	
}
