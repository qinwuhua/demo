/*package com.hdsx.ExcelRead;*/
package com.hdsx.hdmapservice.utile;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.hdsx.jxcsxm.utile.DealShape2;




/**
 * 用于测试jdbc连接数据库
 * @author renzm
 *
 */
class JdbcConntion {
	private static Connection con = null;
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		query();
		//insert(null);
	}
	/**
	 * 获得连接
	 * @return
	 */
	private static  Connection newConnection() { 
		
		try { 
			 Class.forName("oracle.jdbc.driver.OracleDriver").newInstance(); 
			 //Properties pro =getPro("jdbc.properties");
			 String url ="jdbc:oracle:thin:@192.168.1.120:1521:orcl";
			 String username = "xjjck";
			 String password = "xjjck";
			 con = DriverManager.getConnection (url,username,password);
		} 
		catch (Exception e) { 
			System.out.println(e);
		} 
		return con; 

	} 
	public Connection getCon() {
		if(con == null){ 
			synchronized(JdbcConntion.class){ 
				if(null == con){ 
						con = newConnection(); 
					} 
				} 
		}
		return con;
	}
	public void setCon(Connection con) {
		this.con = con;
	}
	/**
	 * 查询表
	 */
    static List<String> query() {
    	Connection conn = newConnection();
        String sql = "select shape from webroadline t where rownum = 1";
        PreparedStatement pstmt;
        List<String> xzqhList = null;
        try {
            pstmt = conn.prepareStatement(sql);
           // 建立一个结果集,用来保存查询出来的结果
            ResultSet rs = pstmt.executeQuery();
            byte[] shape = null;
            while (rs.next()) {
            	shape = rs.getBytes("shape");
            }
            DealShape2 d = new DealShape2();
            d.getXyHashMapList("G216", shape, 500, 873.6);
            rs.close();
            pstmt.close();
            conn.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return xzqhList;
        
    }
    
	/**
	 * 查询表
	 */
    static boolean insert(List<Map<String,Object>> mapList, String tablename) {
    	Connection conn = newConnection();
    	boolean b = false;
    	try {
			conn.setAutoCommit(false);
			Statement pstmt = con.createStatement();
	        for(Map<String,Object> map : mapList){
	        	String insertSql = createSql(map, tablename);
				pstmt.addBatch(insertSql);
	        }
			pstmt.executeBatch();
			conn.commit();
			b = true;
		} catch (SQLException e) {
			e.printStackTrace();
			try {
				conn.rollback();
				
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			if(conn != null){
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
        return b;
    }
    /**
     * 创建sql
     * @param map
     * @return
     */
    private static String createSql(Map<String,Object> map, String tablename){
    	
    	String sql = "insert into "+tablename+" values (";
    	for(int i = 0; i < map.size(); i++){
    		String temp = (String)map.get(""+i);
    		if(i != map.size()-1)
    			sql += "'" + temp + "',";
    		else
    			sql += "'" + temp + "')";
    	}
    	return sql;	
    }
    /**
     * 根据配置文件生成url
     * @return
     */
     static Properties getPro(String fileName){
        Properties prop = new Properties();
        InputStream in = JdbcConntion.class.getResourceAsStream(fileName);
        try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
        return prop;
    }

    

}
