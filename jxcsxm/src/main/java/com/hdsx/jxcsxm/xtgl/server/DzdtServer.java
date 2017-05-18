package com.hdsx.jxcsxm.xtgl.server;

import java.util.List;

import com.hdsx.jxcsxm.xtgl.bean.Dzdt;
import com.hdsx.jxcsxm.xtgl.bean.Param;
import com.hdsx.jxcsxm.xtgl.bean.ProgBean;

public interface DzdtServer {

	List<Dzdt> selLines(Dzdt dzdt);

	List<Param> xmlxCountTj(Param param);

	List<ProgBean> selectExistLxProgramList(ProgBean param);

	List<Param> selectExistQlProgramList(Param param);

	int selectExistLxProgramListCount(Param param);

	int selectExistQlProgramListCount(Param param);
	
}
