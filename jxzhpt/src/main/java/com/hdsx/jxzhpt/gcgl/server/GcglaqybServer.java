package com.hdsx.jxzhpt.gcgl.server;

import java.util.List;

import com.hdsx.jxzhpt.gcgl.bean.Gcglabgc;
import com.hdsx.jxzhpt.gcgl.bean.Gcglaqyb;
import com.hdsx.jxzhpt.gcgl.bean.Gcglsh;
import com.hdsx.jxzhpt.gcgl.bean.Gcglwqgz;
import com.hdsx.jxzhpt.gcgl.bean.Gcglyhdzx;
import com.hdsx.jxzhpt.gcgl.bean.Gcglzhfz;

public interface GcglaqybServer {

	Boolean insertAqybb(Gcglaqyb gcglaqyb);

	int selectaqyblistCount(Gcglaqyb gcglaqyb);

	List<Gcglaqyb> selectaqyblist(Gcglaqyb gcglaqyb);

}
