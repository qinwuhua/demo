package com.hdsx.hdmapservice.service;


import java.util.ArrayList;
import java.util.List;

import com.hdsx.hdmapservice.bean.HDPoint;

public class PerpendicularDistance {
	/**
	 * Logger for this class
	 */
	

	private static double dTolerance = 0.0001d; // 默认容差
	ArrayList<Integer> pointIndexsToKeep = new ArrayList<Integer>();

	public double perpendicularDistance(HDPoint sp, HDPoint ep, HDPoint cp) {
		// double dArea = Math.abs(0.5 * (sp.X * ep.Y + ep.X * cp.Y + cp.X *
		// sp.Y
		// - ep.X * sp.Y - cp.X * ep.Y - sp.X * cp.Y));

		double dArea = Math.abs(0.5 * (sp.getX() * ep.getY() + ep.getX()
				* cp.getY() + cp.getX() * sp.getY() - ep.getX() * sp.getY()
				- cp.getX() * ep.getY() - sp.getX() * cp.getY()));

		// double dbottom = Math.sqrt(Math.pow(sp.X - ep.X, 2)
		// + Math.pow(sp.Y - ep.Y, 2));

		double dbottom = Math.sqrt(Math.pow(sp.getX() - ep.getX(), 2)
				+ Math.pow(sp.getY() - ep.getY(), 2));
		if (dbottom == 0)
			return 0;
		double dheight = dArea / dbottom * 2;
		return dheight;
	}

	public void reduce(List<HDPoint> points, int firstPoint, int lastPoint,
			double tolerance) {
		double maxDis = 0;
		int idxFarthest = 0; // 定义最大长度及最远点的下标
		for (int i = firstPoint; i < lastPoint; i++) {
			double dis = perpendicularDistance(points.get(firstPoint),
					points.get(lastPoint), points.get(i)); // 获取当前点到起点与
			if (dis > maxDis) {// 保存最远距离
				maxDis = dis;
				idxFarthest = i;
			}
		}
		if (maxDis > tolerance && idxFarthest != 0) {// 如果最远距离大于临界值
			pointIndexsToKeep.add(idxFarthest);
			reduce(points, firstPoint, idxFarthest, tolerance);
			reduce(points, idxFarthest, lastPoint, tolerance);
		}

	}

	public void Order() {
		for (int i = 0; i < pointIndexsToKeep.size() - 1; i++) {
			for (int j = i + 1; j < pointIndexsToKeep.size(); j++) {
				if (pointIndexsToKeep.get(j) < pointIndexsToKeep.get(i)) {
					int iTemp = pointIndexsToKeep.get(j);
					pointIndexsToKeep.set(j, pointIndexsToKeep.get(i));
					pointIndexsToKeep.set(i, iTemp);
				}
			}
		}
	}

	/**
	 * 抽稀线上点
	 * 
	 * @param pnts
	 * @return
	 */
	public List<HDPoint> getSimplefied(List<HDPoint> pnts) {
		if (pnts.size() < 4)
			return pnts;

		pointIndexsToKeep.add(0);
		pointIndexsToKeep.add(pnts.size()-1);
		reduce(pnts, 0, pnts.size() - 1, dTolerance);
		// Integer[] pik=(Integer[])pointIndexsToKeep.toArray();
		Order();
		List<HDPoint> result = new ArrayList<HDPoint>();
		for (Integer idx : pointIndexsToKeep) {
			result.add(pnts.get(idx));
		}
		return result;
	}

}
