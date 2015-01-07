package com.hdsx.jxzhpt.lwxm.xmjck.server;

import java.util.List;

import com.hdsx.jxzhpt.lwxm.xmjck.bean.Jckzhfz;

public interface JckzhfzServer {
	boolean insertZhfz(Jckzhfz zhfz);
	List<Jckzhfz> selectZhfzList();
	Jckzhfz selectZhfzById(Jckzhfz zhfz);
	boolean updateZhfzById(Jckzhfz zhfz);
	List<Jckzhfz> selectGpsroad(Jckzhfz zhfz);
	boolean deleteZhfzById(String delstr);
	boolean xgJckZhfzShzt(Jckzhfz zhfz);
}
