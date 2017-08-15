package com.hdsx.jxcsxm.zcgl.server;

import java.util.List;

import com.hdsx.jxcsxm.utile.MyFile;
import com.hdsx.jxcsxm.zcgl.bean.Zcgl;



public interface ZcglServer {

	List<Zcgl> queryZclist(Zcgl zcgl);

	int queryZclistCount(Zcgl zcgl);

	boolean getsfktj(Zcgl zcgl);

	boolean insertZcgl(Zcgl zcgl);

	boolean plsbshzc(Zcgl zcgl);

	MyFile queryFjByMd5(MyFile mFile);

	boolean insertFile(MyFile mFile);

	List<MyFile> queryFjByfid(MyFile myFile);

	MyFile queryFjByid(MyFile myFile);

	List<MyFile> queryFileByid(MyFile myFile);

	List<MyFile> queryFileByfid(MyFile myFile);

	List<MyFile> queryFileBymd5(MyFile m);

	boolean deleteFileByid(MyFile m);

	boolean copydatabyyear(Zcgl zcgl);

	boolean insertZcglqt(Zcgl zcgl);

	List<Zcgl> queryZcqtlist(Zcgl zcgl);

	int queryZcqtlistCount(Zcgl zcgl);

	boolean deleteZcqt(Zcgl zcgl);

	boolean updateZcglqt(Zcgl zcgl);

	boolean plsbshzcqt(Zcgl zcgl);
	
}
