package com.hdsx.demoui.utile.excel;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.DateUtil;

public class ExcelImportUtil {
	/**
	 * 读取Excel中的数据
	 * @param string 字段字符串，每个字段以"，"分隔，顺序与Excel文件中要对应，如：id,url,text
	 * @param sheetIndex HSSFSheet的下标
	 * @param classType 返回集合的类型对象的Class属性
	 * @param file 文件
	 * @return 返回数组
	 * @throws IOException
	 * @throws FileNotFoundException
	 * @throws Exception
	 */
	public static List readExcel(String string, int sheetIndex, Class classType,File file)throws IOException, FileNotFoundException, Exception {
		String[] split = string.split(",");
		HSSFWorkbook readWork=new HSSFWorkbook(new FileInputStream(file));
		HSSFSheet sheet = readWork.getSheetAt(sheetIndex);
		ExcelEntity excel=new ExcelEntity();
		Map<String, String> attribute=new HashMap<String, String>();
		for (int i = 0; i < split.length; i++) {
			attribute.put(new Integer(i).toString(), split[i]);
		}
		excel.setAttributes(attribute);
		return ExcelImportUtil.readerExcel(sheet, classType, 1, excel);
	}
	/**
	 * 读取Excel中的数据
	 * @param string 字段字符串，每个字段以"，"分隔，顺序与Excel文件中要对应，如：id,url,text
	 * @param sheetIndex HSSFSheet的下标
	 * @param startRow 开始行号
	 * @param classType 返回集合的类型对象的Class属性
	 * @param file 文件
	 * @return 返回数组
	 * @throws IOException
	 * @throws FileNotFoundException
	 * @throws Exception
	 */
	public static List readExcel(String string, int sheetIndex,int startRow, Class classType,File file)throws IOException, FileNotFoundException, Exception {
		try {
			String[] split = string.split(",");
			HSSFWorkbook readWork = new HSSFWorkbook(new FileInputStream(file));
			HSSFSheet sheet = readWork.getSheetAt(sheetIndex);
			ExcelEntity excel = new ExcelEntity();
			Map<String, String> attribute = new HashMap<String, String>();
			for (int i = 0; i < split.length; i++) {
				attribute.put(new Integer(i).toString(), split[i]);
			}
			excel.setAttributes(attribute);
			return ExcelImportUtil.readerExcel(sheet, classType, startRow,
					excel);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 导入读取Excel
	 * @param sheet HSSFSheet对象
	 * @param classType 实体类class属性
	 * @param startRowNumber 开始行号
	 * @param excel Excel操作对象
	 * @return 读入的数据
	 * @throws Exception
	 */
	public static List readerExcel(HSSFSheet sheet, Class classType,int startRowNumber,ExcelEntity excel) throws Exception{
		List result=new ArrayList();
		HSSFCell rowOne = sheet.getRow(0).getCell(0);
		if(rowOne.getStringCellValue().length()<10){
			startRowNumber=1;
		}else{
			int indexLast=excel.getAttributes().size()-1;
			excel.getAttributes().remove(new Integer(indexLast).toString());
		}
		for (int i = startRowNumber; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			Map<String, String> attributes = excel.getAttributes();
			Set<Entry<String,String>> entrySet = attributes.entrySet();
			//newObj是根据Class反射创建的对象
			Object newObj = classType.newInstance();
			for (Entry<String, String> entry : entrySet) {
				if(row!=null)
					newObj = getData(newObj, entry, row);
			}
			if(isNullRow(newObj,entrySet))
				result.add(newObj);
		}
		return result;
	}
	/**
	 * 读取Excel文件
	 * @param file Excel文件
	 * @param classType 实体类型
	 * @param startRowNumber 开始行号
	 * @param excel Excel信息实体
	 * @return
	 * @throws Exception
	 */
	public static List readerExcel(File file, Class classType,int startRowNumber,ExcelEntity excel) throws Exception{
		HSSFWorkbook readWork=new HSSFWorkbook(new FileInputStream(file));
		HSSFSheet sheet = readWork.getSheetAt(0);
		List result=new ArrayList();
		for (int i = startRowNumber; i <= sheet.getLastRowNum(); i++) {
			HSSFRow row = sheet.getRow(i);
			Map<String, String> attributes = excel.getAttributes();
			Set<Entry<String,String>> entrySet = attributes.entrySet();
			//newObj是根据Class反射创建的对象
			Object newObj = classType.newInstance();
			for (Entry<String, String> entry : entrySet) {
				if(row!=null)
					newObj = getData(newObj, entry, row);
			}
			if(isNullRow(newObj,entrySet))
				result.add(newObj);
		}
		return result;
	}
	/**
	 * 判断此对象是不是所有字段都为空
	 * @param newObj 获取的对象
	 * @param entrySet 字段与列的对应
	 * @return
	 */
	public static boolean isNullRow(Object newObj,Set<Entry<String,String>> entrySet){
		boolean result=false;
		try {
			for (Entry<String, String> entry : entrySet) {
				String getMethodName="get"+entry.getValue().substring(0,1).toUpperCase()+entry.getValue().substring(1);
				Method method = newObj.getClass().getMethod(getMethodName);
				Object value = method.invoke(newObj);
				if(value!=null){
					result=true;
					break;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	/**
	 * 获取对应的单元格的值，并赋值给反射创建的实体中
	 * @param obj 反射创建的实体
	 * @param entry 列与字段名对应
	 * @param row 行对象
	 * @return 
	 * @throws Exception
	 */
	public static Object getData(Object obj,Entry<String,String> entry,HSSFRow row) throws Exception{
		HSSFCell cell = row.getCell(new Integer(entry.getKey()));
		if(cell!=null){
			Object cellValue = getCellValue(cell);
			String getMethodName="set"+entry.getValue().substring(0,1).toUpperCase()+entry.getValue().substring(1);
			Method method = obj.getClass().getMethod(getMethodName,cellValue.getClass());
			if(cellValue!=null && !cellValue.toString().equals("")){
				Object invoke = method.invoke(obj, cellValue);
			}
		}
		return obj;
	}
	
	/**
	 * 判断单元格类型，并把值转为String类型返回
	 * @param cell 单元格
	 * @return 值
	 */
	private static String getCellValue(HSSFCell cell) {  
        String cellValue = "";
        if(cell==null){
        	return null;
        }
        switch (cell.getCellType()) {  
        case HSSFCell.CELL_TYPE_STRING:  
            cellValue = cell.getRichStringCellValue().getString().trim();  
            break;  
        case HSSFCell.CELL_TYPE_NUMERIC:
        	if(HSSFDateUtil.isCellDateFormatted(cell)){
        		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        		cellValue=sdf.format(DateUtil.getJavaDate(cell.getNumericCellValue()));
        	}else{
        		DecimalFormat dfDouble = new DecimalFormat("#0.000#");
        		cellValue = dfDouble.format(cell.getNumericCellValue()).replace(".000", "");
        	}
            break;  
        case HSSFCell.CELL_TYPE_BOOLEAN:  
            cellValue = String.valueOf(cell.getBooleanCellValue()).trim();  
            break;  
        case HSSFCell.CELL_TYPE_FORMULA:  
            cellValue = cell.getCellFormula();  
            break;  
        default:  
            cellValue = "";  
        }  
        return cellValue;
    }  
}
