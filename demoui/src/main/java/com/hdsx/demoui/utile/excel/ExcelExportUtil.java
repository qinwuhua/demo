package com.hdsx.demoui.utile.excel;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;

/**
 * 导出Excel工具类
 * @author renhao
 *
 */
public class ExcelExportUtil {
	/**
	 * 导出Excel数据
	 * @param excelData Excel要导出的数据
	 * @param fileName 导出后的文件名称
	 * @param fieidAndTitle 字段和列标题的对应，格式如下：<fieid=,title=,hidden=>
	 * @param response HttpServletResponse对象
	 */
	public static void excelWrite(List<Object> excelData, String fileName,String fieidAndTitle,HttpServletResponse response) {
		Pattern pattern = Pattern.compile("(<[^>]*>)");
		Matcher matcher = pattern.matcher(fieidAndTitle);
		int index=0;
		List<Map<String, Object>> properties = new ArrayList();//存储字段和属性对应集合
		//按照上面格式,遍历字符串获取数据
		while(matcher.find()){
			String[] replaceAll = matcher.group().replaceAll("<", "").replaceAll(">", "").split(",");
			Map<String, Object> property= new HashMap<String, Object>();
			property.put("index", index);
			for (String string : replaceAll) {
				property.put(string.substring(0,string.indexOf("=")), string.substring(string.indexOf("=")+1));
			}
			properties.add(property);
			index++;
		}
		ExcelTitleCell [] title= new ExcelTitleCell[index];//表头标题数组
		Map<String, String> attribute=new HashMap<String, String>();//字段与列的对应
		//循环上步中获取的数据，设置表头标题集合和字段的对应
		for (Map<String, Object> item : properties) {
			boolean hidden = item.get("hidden")==null ? false : new Boolean(item.get("hidden").toString()).booleanValue();
			int width = item.get("width")==null ? 15 : Integer.parseInt(item.get("width").toString());
			title[Integer.parseInt(item.get("index").toString())]=new ExcelTitleCell(item.get("title").toString(),hidden, new ExcelCoordinate(0, (short)Integer.parseInt(item.get("index").toString())),width);
			attribute.put(item.get("index").toString(), item.get("fieid").toString());
		}
		ExcelEntity excel=new ExcelEntity(fileName,title,attribute,excelData);
		ExcelExportUtil.excelWrite(excel, fileName, response);
	}
	/**
	 * Map的List集合导出Excel
	 * @param fileds 字段
	 * @param filedNames 字段名称
	 * @param fileName 文件名称
	 * @param data 数据
	 * @throws UnsupportedEncodingException 
	 */
	public static void excelWriter(String fileds,String filedNames,String fileName,List<Map<String, String>> data,HttpServletResponse response) throws UnsupportedEncodingException{
		try {
			String[] filedArray = fileds.split(",");
			String[] filedNameArray = filedNames.split(",");
			ExcelTitleCell [] title= new ExcelTitleCell[filedArray.length];//表头标题数组
			for (int i = 0; i < filedNameArray.length; i++) {
				title[i]= new ExcelTitleCell(filedNameArray[i], false, new ExcelCoordinate(0,(short)i),15);
			}
			//创建Excel工作对象
			HSSFWorkbook wb = new HSSFWorkbook();
			//设置Excel的sheet对象
			HSSFSheet sheet = wb.createSheet(fileName);
			int rowNumber=0;
			//居中样式
			HSSFCellStyle styleCenter = wb.createCellStyle(); 
			styleCenter.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			/**设置单元格格式为文本格式*/
			HSSFDataFormat format = wb.createDataFormat();
			styleCenter.setDataFormat(format.getFormat("@"));
			
			rowNumber = createTitle(sheet,title,rowNumber,styleCenter);
			rowNumber++;
			for(int i= 0;i<data.size();i++){
				HSSFRow row = sheet.createRow(i+rowNumber);
				Map<String, String> item = data.get(i);
				for (int j = 0; j < filedArray.length; j++) {
					HSSFCell createCell = row.createCell(j);
					createCell.setCellValue(item.get(filedArray[j].substring(filedArray[j].indexOf("as ")+3).toUpperCase()));
					createCell.setCellStyle(styleCenter);//设置单元格格式为"文本"
					createCell.setCellType(HSSFCell.CELL_TYPE_STRING);
				}
			}
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(fileName.getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			wb.write(out);
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 导出Excel文件
	 * @param excel ExcelEntity Excel实体类
	 * @param fileName 导出的文件名称
	 * @param response HttpServletResponse对象
	 * @throws Exception
	 */
	public static void excelWrite(ExcelEntity excel,String fileName,HttpServletResponse response){
		try{
			//创建Excel工作对象
			HSSFWorkbook wb = new HSSFWorkbook();
			//设置Excel的sheet对象
			HSSFSheet sheet = wb.createSheet(excel.getSheetName());
			int rowNumber=0;
			//居中样式
			HSSFCellStyle styleCenter = wb.createCellStyle(); 
			styleCenter.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			/**设置单元格格式为文本格式*/
			HSSFDataFormat format = wb.createDataFormat();
			styleCenter.setDataFormat(format.getFormat("@"));
			
			//创建表头
			rowNumber = createTitle(sheet,excel.getTitleArray(),rowNumber,styleCenter);
			rowNumber++;
			createMainBody(sheet,excel.getAttributes(),excel.getExcelData(),rowNumber,styleCenter);
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(fileName.getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			wb.write(out);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void excelWritelock(ExcelEntity excel,String fileName,HttpServletResponse response){
		try{
			//创建Excel工作对象
			HSSFWorkbook wb = new HSSFWorkbook();
			//设置Excel的sheet对象
			HSSFSheet sheet = wb.createSheet(excel.getSheetName());
			int rowNumber=0;
			//居中样式
			HSSFCellStyle styleCenter = wb.createCellStyle(); 
			HSSFCellStyle styleCenterlock = wb.createCellStyle();
			/**设置单元格格式为文本格式*/
			HSSFDataFormat format = wb.createDataFormat();
			styleCenter.setDataFormat(format.getFormat("@"));
			styleCenterlock.setLocked(true);
			styleCenter.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			styleCenterlock.setAlignment(HSSFCellStyle.ALIGN_CENTER);
			
			styleCenter.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框
			styleCenter.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框
			styleCenter.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框
			styleCenter.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框
			//创建表头
			rowNumber = createTitle(sheet,excel.getTitleArray(),rowNumber,styleCenter,styleCenterlock);
			rowNumber++;
			createMainBody(sheet,excel.getAttributes(),excel.getExcelData(),rowNumber,styleCenter);
			response.setContentType("octets/stream");
			response.addHeader("Content-Disposition", "attachment;filename="+ new String(fileName.getBytes("gb2312"), "ISO-8859-1")+ ".xls");
			OutputStream out = response.getOutputStream();
			wb.write(out);
			out.flush();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	/**
	 * 创建Excel表头
	 * @param sheet sheet对象
	 * @param titleArray 表头集合，为 ExcelTitleCell的数组
	 * @param styleCenter 对齐样式
	 */
	@SuppressWarnings("deprecation")
	public static int createTitle(HSSFSheet sheet,ExcelTitleCell [] titleArray,int rowNumber,HSSFCellStyle styleCenter){
		HSSFRow title=sheet.createRow(0);
		for (ExcelTitleCell cell : titleArray) {
			HSSFCell createCell=null;
			//如果开始的单元格坐标不为null
			if(cell.getStartCell()!=null){
				//如果结束单元格坐标不为null，则进行合并单元格
				if(cell.getEndCell()!=null){
					sheet.addMergedRegion(
							new Region(cell.getStartCell().getX_index(), cell.getStartCell().getY_index(), 
									cell.getEndCell().getX_index(), cell.getEndCell().getY_index()));
					//设置行号为标头占有的最大行
					if(rowNumber<cell.getEndCell().getX_index())
						rowNumber=cell.getEndCell().getX_index();
				}
				//根据开始的单元格坐标创建单元格
				createCell = title.createCell(cell.getStartCell().getY_index());
				createCell.setCellStyle(styleCenter);
				//设置值
				createCell.setCellValue(cell.getCellTitleName());
			}
			sheet.setColumnHidden((int)cell.getStartCell().getY_index(), cell.isHidden());
			sheet.setColumnWidth(cell.getStartCell().getY_index(), cell.getWidth()*256);
		}
		return rowNumber;
	}
	
	
	@SuppressWarnings("deprecation")
	public static int createTitle(HSSFSheet sheet,ExcelTitleCell [] titleArray,int rowNumber,HSSFCellStyle styleCenter,HSSFCellStyle styleCenterlock){
		HSSFRow title=sheet.createRow(0);
		for (ExcelTitleCell cell : titleArray) {
			HSSFCell createCell=null;
			//如果开始的单元格坐标不为null
			if(cell.getStartCell()!=null){
				//如果结束单元格坐标不为null，则进行合并单元格
				if(cell.getEndCell()!=null){
					sheet.addMergedRegion(
							new Region(cell.getStartCell().getX_index(), cell.getStartCell().getY_index(), 
									cell.getEndCell().getX_index(), cell.getEndCell().getY_index()));
					//设置行号为标头占有的最大行
					if(rowNumber<cell.getEndCell().getX_index())
						rowNumber=cell.getEndCell().getX_index();
				}
				//根据开始的单元格坐标创建单元格
				createCell = title.createCell(cell.getStartCell().getY_index());
				if(cell.isLock())
					createCell.setCellStyle(styleCenterlock);
				else
				createCell.setCellStyle(styleCenter);
				//设置值
				createCell.setCellValue(cell.getCellTitleName());
			}
			sheet.setColumnHidden((int)cell.getStartCell().getY_index(), cell.isHidden());
			sheet.setColumnWidth(cell.getStartCell().getY_index(), cell.getWidth()*256);
		}
		return rowNumber;
	}
	
	/**
	 * 创建主体信息部分
	 * @param sheet Excel的sheet对象
	 * @param attributes Excel列与属性对应集合。key为对应的列的下标，value为对应的属性名称
	 * @param data 数据集合
	 * @param startRowNumber 开始行号
	 * @param styleCenter 对齐样式
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	public static void createMainBody(HSSFSheet sheet,Map<String, String> attributes,List<Object> data,int startRowNumber,HSSFCellStyle styleCenter) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		for(int i= 0;i<data.size();i++){
			HSSFRow row = sheet.createRow(i+startRowNumber);
			Set<Entry<String,String>> entrySet = attributes.entrySet();
			for (Entry<String, String> attribute : entrySet) {
				HSSFCell cell = row.createCell(new Integer(attribute.getKey()));
				Object attributeValue = getValueByAttributeName(data.get(i),attribute.getValue());
				if(attributeValue!=null){
					cell.setCellValue(attributeValue.toString());
				}
				cell.setCellStyle(styleCenter);
			}
		}
	}
	
	/**
	 * 获取实体中对应的属性值
	 * @param obj 实体对象
	 * @param attributeName 属性名
	 * @return
	 * @throws NoSuchMethodException
	 * @throws SecurityException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	public static Object getValueByAttributeName(Object obj,String attributeName) throws NoSuchMethodException, SecurityException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		String getMethodName="get"+attributeName.substring(0,1).toUpperCase()+attributeName.substring(1);
		Method method = obj.getClass().getMethod(getMethodName,null);
		Object invoke = method.invoke(obj, null);
		return invoke;
	}
}
