package com.hdsx.demoui.utile;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

/**
 * 操作Excel表格的功能类
 */
public class ExcelReader {
    private static POIFSFileSystem fs;
    private static HSSFWorkbook wb;
    private static HSSFSheet sheet;
    private static HSSFRow row;
    private static int startCol;
    public static int colnum;
    /**
     * 读取Excel表格表头的内容
     * @param InputStream
     * @return String 表头内容的数组
     */
    private static String[] readExcelTitle(InputStream is) {
        try {
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
        } catch (IOException e) {
            e.printStackTrace();
        }
        
        sheet = wb.getSheetAt(0);
        
        row = sheet.getRow(0);
        // 标题总列数
        int colNum = row.getPhysicalNumberOfCells();
        System.out.println("colNum:" + colNum);
        String[] title = new String[colNum];
        for (int i = 0; i < colNum; i++) {
            //title[i] = getStringCellValue(row.getCell((short) i));
            title[i] = getCellFormatValue(row.getCell((short) i));
        }
        return title;
    }

    /**
     * 读取Excel数据内容
     * @param InputStream
     * @return Map 包含单元格数据内容的Map对象
     * @throws Exception1 
     * @throws IsNotNumberException 
     * @throws IllegalAccessException 
     * @throws InstantiationException 
     */
    public  static List<Map>[] readExcelContent(int start,int cols,InputStream is,Class clazz) {
    	startCol=start;
    	colnum=cols;
        List<Map>[] excelContent = new ArrayList[5];
        String str = "";
        try {
        	
            fs = new POIFSFileSystem(is);
            wb = new HSSFWorkbook(fs);
            for(int i = 0; i < 5; i++){
        		try{
        			sheet = wb.getSheetAt(i);
        		}catch(Exception e){}
        		List<Map> content = new ArrayList<Map>();
        		excelContent[i]= getContent(clazz, content);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return excelContent; 
    }

	private static List<Map> getContent(Class clazz, List<Map> content) {
		String str;
		boolean IsNotNumber=false;
		
        // 得到总行数
        int rowNum = sheet.getLastRowNum();
        row = sheet.getRow(2);
        /*int colNum=colnum;
        try{
        	 colNum = row.getPhysicalNumberOfCells();
        	 System.out.println("colNum========="+colNum);
        	 if(colNum!=31 && colNum!=20){
        		 Exception1 e=new Exception1();
        		 throw e;
        	 }
        }catch(NullPointerException e){
        	System.out.println("表格到此没有数据");
        	return null;
        }*/
        // 正文内容应该从第二行开始,第一行为表头的标题
        for (int i = startCol; i <= rowNum; i++) {
            row = sheet.getRow(i);
            int j = 0;
            Map m = new HashMap();
            while (j < colnum) {
            	try {
					Object object = clazz.newInstance();
				} catch (Exception e) {
					System.out.println(clazz.getName()+"此类不正确");
				}
            	String value;
            	try{
            		value=getCellFormatValue(row.getCell((short) j)).trim();
            	}catch(Exception e){
            		System.out.println("数据读取玩");
            		return null;
            	}
            	/*if(j>4){
        			if(!isDouble(value)){
        				IsNotNumberException e1=new IsNotNumberException((i-2)+"",(j+1)+"");
        				throw e1;
            		}
            	}*/
                m.put(""+j, value);
                j++;
            }
            content.add(m);
            str = "";
        }
        return content;
	}
	public static boolean isDouble(String str) {    
	    Pattern pattern = Pattern.compile("^[-\\+]?[.\\d]*$");    
	    return pattern.matcher(str).matches();    
	}
    /**
     * 获取单元格数据内容为字符串类型的数据
     * 
     * @param cell Excel单元格
     * @return String 单元格数据内容
     */
    private static String getStringCellValue(HSSFCell cell) {
        String strCell = "";
        switch (cell.getCellType()) {
        case HSSFCell.CELL_TYPE_STRING:
            strCell = cell.getStringCellValue();
            break;
        case HSSFCell.CELL_TYPE_NUMERIC:
            strCell = String.valueOf(cell.getNumericCellValue());
            break;
        case HSSFCell.CELL_TYPE_BOOLEAN:
            strCell = String.valueOf(cell.getBooleanCellValue());
            break;
        case HSSFCell.CELL_TYPE_BLANK:
            strCell = "";
            break;
        default:
            strCell = "";
            break;
        }
        if (strCell.equals("") || strCell == null) {
            return "";
        }
        if (cell == null) {
            return "";
        }
        return strCell;
    }

    /**
     * 获取单元格数据内容为日期类型的数据
     * 
     * @param cell
     *            Excel单元格
     * @return String 单元格数据内容
     */
    private static String getDateCellValue(HSSFCell cell) {
        String result = "";
        try {
            int cellType = cell.getCellType();
            if (cellType == HSSFCell.CELL_TYPE_NUMERIC) {
                Date date = cell.getDateCellValue();
                result = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
                        + "-" + date.getDate();
            } else if (cellType == HSSFCell.CELL_TYPE_STRING) {
                String date = getStringCellValue(cell);
                result = date.replaceAll("[年月]", "-").replace("日", "").trim();
            } else if (cellType == HSSFCell.CELL_TYPE_BLANK) {
                result = "";
            }
        } catch (Exception e) {
            System.out.println("日期格式不正确!");
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 根据HSSFCell类型设置数据
     * @param cell
     * @return
     */
    private static String getCellFormatValue(HSSFCell cell) {
        String cellvalue = "";
        if (cell != null) {
            // 判断当前Cell的Type
            switch (cell.getCellType()) {
            // 如果当前Cell的Type为NUMERIC
            case HSSFCell.CELL_TYPE_NUMERIC:
            case HSSFCell.CELL_TYPE_FORMULA: {
                // 判断当前的cell是否为Date
                if (HSSFDateUtil.isCellDateFormatted(cell)) {
                    // 如果是Date类型则，转化为Data格式
                    
                    //方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
                    //cellvalue = cell.getDateCellValue().toLocaleString();
                    
                    //方法2：这样子的data格式是不带带时分秒的：2011-10-12
                    Date date = cell.getDateCellValue();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    cellvalue = sdf.format(date);
                    
                }
                // 如果是纯数字
                else {
                    // 取得当前Cell的数值
                    cellvalue = String.valueOf(cell.getNumericCellValue());
                }
                break;
            }
            // 如果当前Cell的Type为STRIN
            case HSSFCell.CELL_TYPE_STRING:
                // 取得当前的Cell字符串
                cellvalue = cell.getRichStringCellValue().getString();
                break;
            // 默认的Cell值
            default:
                cellvalue = " ";
            }
        } else {
            cellvalue = "";
        }
        return cellvalue;

    }

/*    public static void main(String[] args) throws InstantiationException, IllegalAccessException {
        try {
            // 对读取Excel表格标题测试
            InputStream is = new FileInputStream("C:\\Users\\Renzm\\Desktop\\自定义报表.xls");
            ExcelReader excelReader = new ExcelReader();
            String[] title = excelReader.readExcelTitle(is);
            System.out.println("获得Excel表格的标题:");
            for (String s : title) {
                System.out.print(s + " ");
            }

            // 对读取Excel表格内容测试
            InputStream is2 = new FileInputStream("C:\\Users\\Renzm\\Desktop\\自定义报表.xls");
            List map = excelReader.readExcelContent(is2,ExcelReader.class);
            System.out.println("获得Excel表格的内容:");
            for (int i = 1; i <= map.size(); i++) {
                System.out.println(map.get(i));
            }

        } catch (FileNotFoundException e) {
            System.out.println("未找到指定路径的文件!");
            e.printStackTrace();
        }
    }*/
    /**
     * 如果excel中有空白行而且被读取后，再从集合中将空白行数据去除
     * 条件是：一行中每个单元格都为空值时才会移除该行数据，否则就当做是正确数据对待
     */
    public static List<Map> removeBlankRow(List<Map> data){
    	List<Map> lastData = new ArrayList<Map>();
    	boolean [] position = new boolean[data.size()];
		for(int j=0;j<data.size();j++){
			Map map = data.get(j);
			int len = map.keySet().size();
			Set set = map.keySet();
			Iterator iter = set.iterator();
			int i=0;
			while(iter.hasNext()){
				String key = iter.next().toString();
				String value=map.get(""+key+"").toString();
				if(value!=null && (!"".equals(value)))
					break;
				if(i==len-1){
					position[j]=true;
				}
				i++;
			}
		}
		for(int i=0;i<position.length;i++){
			if(!position[i]){
				lastData.add(data.get(i));
			}
		}
    	return lastData;
    }


public static List<Map<String,String>> removeBlankRow2(List<Map> data){
	List<Map<String,String>> lastData = new ArrayList<Map<String,String>>();
	HashSet<Map<String,String>> hash;
	boolean [] position = new boolean[data.size()];
	for(int j=0;j<data.size();j++){
		Map map = data.get(j);
		int len = map.keySet().size();
		Set set = map.keySet();
		Iterator iter = set.iterator();
		int i=0;
		while(iter.hasNext()){
			String key = iter.next().toString();
			String value=map.get(""+key+"").toString();
			if(value!=null && (!"".equals(value)))
				break;
			if(i==len-1){
				position[j]=true;
			}
			i++;
		}
	}
	for(int i=0;i<position.length;i++){
		if(!position[i]){
			lastData.add(data.get(i));
		}
	}
	hash = new HashSet<Map<String,String>>(lastData);
	lastData.clear();
	lastData.addAll(hash);
	return lastData;
}
}