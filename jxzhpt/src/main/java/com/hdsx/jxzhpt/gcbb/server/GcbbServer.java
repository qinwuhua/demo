package com.hdsx.jxzhpt.gcbb.server;

import java.util.List;

import com.hdsx.jxzhpt.gcbb.bean.GcgjJd;
import com.hdsx.jxzhpt.gcbb.bean.GcsjJd;
import com.hdsx.jxzhpt.gcxmybb.bean.Xmbb;

public interface GcbbServer {
	/**
	 * 工程改建进度报表查询
	 * @param xmbb
	 * @return
	 */
	List<GcgjJd> selGcgjJdbb(Xmbb xmbb);
	/**
	 * 水毁进度报表查询
	 * @param xmbb
	 * @return
	 */
	List<GcgjJd> selShuihJdbb(Xmbb xmbb);
	/**
	 * 升级进度报表
	 * @param xmbb
	 * @return
	 */
	List<GcsjJd> selGcsjJdbb(Xmbb xmbb);
}
