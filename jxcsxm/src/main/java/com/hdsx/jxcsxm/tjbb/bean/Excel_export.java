package com.hdsx.jxcsxm.tjbb.bean;

import java.beans.PropertyDescriptor;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 * 功能：导出excel<br/>
 * 调用：方法excel_export<br/>
 * 需要参数：ExcelData   HttpServletResponse<br/>
 * @author qwh
 *
 */
public class Excel_export {
	
	public static void excel_export(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xlsx");
		OutputStream out = response.getOutputStream();
		
		XSSFWorkbook wb = new XSSFWorkbook();  
		XSSFSheet sheet = null;
		int x=0,y=10000;
			for(int k=0;k<el.getEl().size()/10000.0;k++){
				if(x>el.getEl().size()) break;
				sheet=wb.createSheet(el.getSheetName()+k);
				
				XSSFRow row = sheet.createRow((int) 0); 
				XSSFCellStyle style = wb.createCellStyle();
				XSSFCellStyle style1 = wb.createCellStyle();
				XSSFCellStyle style2 = wb.createCellStyle();
				XSSFCellStyle style3 = wb.createCellStyle();
				XSSFCellStyle temp = wb.createCellStyle();
				style.setBorderTop(XSSFCellStyle.BORDER_THIN);
			    style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			    style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			    style.setBorderRight(XSSFCellStyle.BORDER_THIN);
			    style1.setBorderTop(XSSFCellStyle.BORDER_THIN);
			    style1.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			    style1.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			    style1.setBorderRight(XSSFCellStyle.BORDER_THIN);
			    style2.setBorderTop(XSSFCellStyle.BORDER_THIN);
			    style2.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			    style2.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			    style2.setBorderRight(XSSFCellStyle.BORDER_THIN);
			    style3.setBorderTop(XSSFCellStyle.BORDER_THIN);
			    style3.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			    style3.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			    style3.setBorderRight(XSSFCellStyle.BORDER_THIN);
				style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				style1.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				style1.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				style1.setFillForegroundColor(IndexedColors.LIGHT_TURQUOISE.getIndex());
				style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
				style2.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				style2.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				style3.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				style3.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				XSSFCell cell = row.createCell((short) 0);
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				row.setHeightInPoints(30f);
				XSSFFont font= wb.createFont();
				XSSFFont font1= wb.createFont();
				XSSFFont font2= wb.createFont();
				font.setFontName("楷体");
		        font.setFontHeightInPoints((short) 20);// 设置字体大小
				font1.setFontName("宋体");
		        font1.setFontHeightInPoints((short) 10);// 设置字体大小
		        font2.setFontName("宋体");
		        font2.setFontHeightInPoints((short) 15);// 设置字体大小
		        font2.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);//粗体显示
		        //font2.setColor(XSSFFont.COLOR_RED);
		        style.setFont(font1);
		        style2.setFont(font);
		        style3.setFont(font2);
				cell.setCellValue(el.getTitleName());
				cell.setCellStyle(style2); 

				List<Excel_tilte> et = el.getEt();
				int maxy=0;
				int maxx=0;
				int minx=1;
				row = sheet.createRow((int) 1);
				for (Excel_tilte excel_tilte : et) {
					
					row.setHeightInPoints(20f);
					int x1=excel_tilte.getX1();
					int x2=excel_tilte.getX2();
					int y1=excel_tilte.getY1();
					int y2=excel_tilte.getY2();
					if(y2>maxy){
						maxy=y2;
					}
					if(x2>maxx){
						maxx=x2;
					}
					if(x1>minx){
						minx=x1;
						row = sheet.createRow((int) x1);
					}
					cell = row.createCell((short) y1);
					cell.setCellValue(excel_tilte.getName());  
					cell.setCellStyle(style1);
					
					
				}
				for (int i = 0; i <=maxy ; i++) {
					sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
					//sheet.autoSizeColumn((short)i); 自动适应宽度
				}
				for (Excel_tilte excel_tilte : et){
					int x1=excel_tilte.getX1();
					int x2=excel_tilte.getX2();
					int y1=excel_tilte.getY1();
					int y2=excel_tilte.getY2();
					if(x1!=x2||y1!=y2){
						CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
						sheet.addMergedRegion(range);
						setRegionStyle(style1,range,sheet);
					}
				}
				CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
				sheet.addMergedRegion(range);
				setRegionStyle(style2,range,sheet);
				
				
				
				List<Excel_list> l= null;
				if(y>el.getEl().size()){
					l=el.getEl().subList(x, el.getEl().size());
				}else{
					l=el.getEl().subList(x, y);
				}
				x=y;
				y=y+y;
				List<Excel_list> el2 = l;
				
				for (int i = 0; i < el2.size(); i++)  
		        {  
		            row = sheet.createRow((int) i + maxx+1);  
		            Excel_list trqk1 = (Excel_list) el2.get(i);  
		            // 第四步，创建单元格，并设置值  
		            //System.out.println(trqk1.getSfhj());
		            if("是".equals(trqk1.getSfhj())){
		            	temp=style3;
		            }
		            else{
		            	temp=style;
		            }
		            	
		            for (int j = 0; j <= maxy; j++) {
		            	cell = row.createCell((short) j);
		            	cell.setCellType(XSSFCell.CELL_TYPE_STRING);
		            	for(int f=0;f<100;f++){
		            		if(j==f){
								PropertyDescriptor pd = new PropertyDescriptor("V_"+j, trqk1.getClass());  
								Method rM = pd.getReadMethod();//获得读方法  
								String num = (String) rM.invoke(trqk1);//因为知道是int类型的属性,所以转换成integer就是了。。也可以不转换直接打印 
		            			cell.setCellValue(num);  
			                    cell.setCellStyle(temp);
		            		}
		            	}
		            	
					}
		        }
				
			}	
			
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
		
	public static void excel_exportyybb(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xlsx");
		OutputStream out = response.getOutputStream();
		
		XSSFWorkbook wb = new XSSFWorkbook();  
		XSSFSheet sheet = null;
		int x=0,y=10000;
			for(int k=0;k<el.getEl().size()/10000.0;k++){
				if(x>el.getEl().size()) break;
				sheet=wb.createSheet(el.getSheetName()+k);
				
				XSSFRow row = sheet.createRow((int) 0); 
				XSSFCellStyle style = wb.createCellStyle();
				XSSFCellStyle style1 = wb.createCellStyle();
				XSSFCellStyle style2 = wb.createCellStyle();
				XSSFCellStyle style3 = wb.createCellStyle();
				XSSFCellStyle style4 = wb.createCellStyle();
				XSSFCellStyle temp = wb.createCellStyle();
				style.setBorderTop(XSSFCellStyle.BORDER_THIN);
			    style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			    style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			    style.setBorderRight(XSSFCellStyle.BORDER_THIN);
			    style1.setBorderTop(XSSFCellStyle.BORDER_THIN);
			    style1.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			    style1.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			    style1.setBorderRight(XSSFCellStyle.BORDER_THIN);
			    style2.setBorderTop(XSSFCellStyle.BORDER_NONE);
			    style2.setBorderBottom(XSSFCellStyle.BORDER_NONE);
			    style2.setBorderLeft(XSSFCellStyle.BORDER_NONE);
			    style2.setBorderRight(XSSFCellStyle.BORDER_NONE);
			    style3.setBorderTop(XSSFCellStyle.BORDER_THIN);
			    style3.setBorderBottom(XSSFCellStyle.BORDER_THIN);
			    style3.setBorderLeft(XSSFCellStyle.BORDER_THIN);
			    style3.setBorderRight(XSSFCellStyle.BORDER_THIN);
				style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				style1.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				style1.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				style1.setFillForegroundColor(IndexedColors.LIGHT_TURQUOISE.getIndex());
				style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
				style2.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				style2.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				style3.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				style3.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				style4.setBorderTop(XSSFCellStyle.BORDER_NONE);
			    style4.setBorderBottom(XSSFCellStyle.BORDER_NONE);
			    style4.setBorderLeft(XSSFCellStyle.BORDER_NONE);
			    style4.setBorderRight(XSSFCellStyle.BORDER_NONE);
			    style4.setAlignment(XSSFCellStyle.ALIGN_CENTER);
				style4.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
				XSSFCell cell = row.createCell((short) 0);
				cell.setCellType(XSSFCell.CELL_TYPE_STRING);
				row.setHeightInPoints(30f);
				XSSFFont font= wb.createFont();
				XSSFFont font1= wb.createFont();
				XSSFFont font2= wb.createFont();
				font.setFontName("楷体");
		        font.setFontHeightInPoints((short) 20);// 设置字体大小
				font1.setFontName("宋体");
		        font1.setFontHeightInPoints((short) 10);// 设置字体大小
		        font2.setFontName("宋体");
		        font2.setFontHeightInPoints((short) 15);// 设置字体大小
		        font2.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);//粗体显示
		        //font2.setColor(XSSFFont.COLOR_RED);
		        style.setFont(font1);
		        style2.setFont(font);
		        style3.setFont(font2);
		        style4.setFont(font1);
				cell.setCellValue(el.getTitleName());
				cell.setCellStyle(style2); 

				List<Excel_tilte> ett = el.getEtt();
				int maxy=0;
				int maxx=0;
				int minx=1;
				row = sheet.createRow((int) 1);
				for (Excel_tilte excel_tilte : ett) {
					
					row.setHeightInPoints(20f);
					int x1=excel_tilte.getX1();
					int x2=excel_tilte.getX2();
					int y1=excel_tilte.getY1();
					int y2=excel_tilte.getY2();
					if(y2>maxy){
						maxy=y2;
					}
					if(x2>maxx){
						maxx=x2;
					}
					if(x1>minx){
						minx=x1;
						row = sheet.createRow((int) x1);
					}
					cell = row.createCell((short) y1);
					cell.setCellValue(excel_tilte.getName());  
					cell.setCellStyle(style4);
					
					
				}
				for (int i = 0; i <=maxy ; i++) {
					sheet.setColumnWidth(i, 32 * 250);//设置固定宽度150
					//sheet.autoSizeColumn((short)i); 自动适应宽度
				}
				for (Excel_tilte excel_tilte : ett){
					int x1=excel_tilte.getX1();
					int x2=excel_tilte.getX2();
					int y1=excel_tilte.getY1();
					int y2=excel_tilte.getY2();
					if(x1!=x2||y1!=y2){
						CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
						sheet.addMergedRegion(range);
						setRegionStyle(style4,range,sheet);
					}
				}
				
				
				//----------------------
				List<Excel_tilte> et = el.getEt();
				
				row = sheet.createRow((int) maxx+1);
				for (Excel_tilte excel_tilte : et) {
					
					row.setHeightInPoints(20f);
					int x1=excel_tilte.getX1();
					int x2=excel_tilte.getX2();
					int y1=excel_tilte.getY1();
					int y2=excel_tilte.getY2();
					if(y2>maxy){
						maxy=y2;
					}
					if(x2>maxx){
						maxx=x2;
					}
					if(x1>minx){
						minx=x1;
						row = sheet.createRow((int) x1);
					}
					cell = row.createCell((short) y1);
					cell.setCellValue(excel_tilte.getName());  
					cell.setCellStyle(style1);
					
					
				}
				for (int i = 0; i <=maxy ; i++) {
					sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
					//sheet.autoSizeColumn((short)i); 自动适应宽度
				}
				for (Excel_tilte excel_tilte : et){
					int x1=excel_tilte.getX1();
					int x2=excel_tilte.getX2();
					int y1=excel_tilte.getY1();
					int y2=excel_tilte.getY2();
					if(x1!=x2||y1!=y2){
						CellRangeAddress ranges= new CellRangeAddress(x1,x2,y1,y2);
						sheet.addMergedRegion(ranges);
						setRegionStyle(style1,ranges,sheet);
					}
				}
				CellRangeAddress ranges = new CellRangeAddress(0,0,0,maxy);
				sheet.addMergedRegion(ranges);
				setRegionStyle(style2,ranges,sheet);
				
				
				List<Excel_list> l= null;
				if(y>el.getEl().size()){
					l=el.getEl().subList(x, el.getEl().size());
				}else{
					l=el.getEl().subList(x, y);
				}
				x=y;
				y=y+y;
				List<Excel_list> el2 = l;
				
				for (int i = 0; i < el2.size(); i++)  
		        {  
		            row = sheet.createRow((int) i + maxx+1);  
		            Excel_list trqk1 = (Excel_list) el2.get(i);  
		            // 第四步，创建单元格，并设置值  
		           // System.out.println(trqk1.getSfhj());
		            if("是".equals(trqk1.getSfhj())){
		            	temp=style3;
		            }
		            else{
		            	temp=style;
		            }
		            	
		            for (int j = 0; j <= maxy; j++) {
		            	cell = row.createCell((short) j);
		            	cell.setCellType(XSSFCell.CELL_TYPE_STRING);
		            	for(int f=0;f<100;f++){
		            		if(j==f){
								PropertyDescriptor pd = new PropertyDescriptor("V_"+j, trqk1.getClass());  
								Method rM = pd.getReadMethod();//获得读方法  
								String num = (String) rM.invoke(trqk1);//因为知道是int类型的属性,所以转换成integer就是了。。也可以不转换直接打印 
		            			cell.setCellValue(num);  
			                    cell.setCellStyle(temp);
		            		}
		            	}
					}
		        }
				
			}	
			
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//
	public static void excel_exportGlzcqkb(ExcelData el,HttpServletResponse response) throws Exception{
		try{
		response.setContentType("octets/stream");
		response.addHeader("Content-Disposition", "attachment;filename="+ new String(el.getFileName().trim().getBytes("gb2312"), "ISO-8859-1")+ ".xlsx");
		OutputStream out = response.getOutputStream();
		XSSFWorkbook wb = new XSSFWorkbook();  
		XSSFSheet sheet = wb.createSheet(el.getSheetName());
		XSSFRow row = sheet.createRow((int) 0); 
		XSSFCellStyle style = wb.createCellStyle();
		XSSFCellStyle style1 = wb.createCellStyle();
		XSSFCellStyle style2 = wb.createCellStyle();
		style.setBorderTop(XSSFCellStyle.BORDER_THIN);
	    style.setBorderBottom(XSSFCellStyle.BORDER_THIN);
	    style.setBorderLeft(XSSFCellStyle.BORDER_THIN);
	    style.setBorderRight(XSSFCellStyle.BORDER_THIN);
	    style1.setBorderTop(XSSFCellStyle.BORDER_THIN);
	    style1.setBorderBottom(XSSFCellStyle.BORDER_THIN);
	    style1.setBorderLeft(XSSFCellStyle.BORDER_THIN);
	    style1.setBorderRight(XSSFCellStyle.BORDER_THIN);
	    style2.setBorderTop(XSSFCellStyle.BORDER_THIN);
	    style2.setBorderBottom(XSSFCellStyle.BORDER_THIN);
	    style2.setBorderLeft(XSSFCellStyle.BORDER_THIN);
	    style2.setBorderRight(XSSFCellStyle.BORDER_THIN);
		style.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		style1.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		style1.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		style1.setFillForegroundColor(IndexedColors.LIGHT_TURQUOISE.getIndex());
		style1.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(XSSFCellStyle.ALIGN_CENTER);
		style2.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
		XSSFCell cell = row.createCell((short) 0);
		cell.setCellType(XSSFCell.CELL_TYPE_STRING);
		row.setHeightInPoints(30f);
		XSSFFont font= wb.createFont();
		XSSFFont font1= wb.createFont();
		font.setFontName("楷体");
        font.setFontHeightInPoints((short) 18);// 设置字体大小
		font1.setFontName("宋体");
        font1.setFontHeightInPoints((short) 10);// 设置字体大小
        style.setFont(font1);
        style2.setFont(font);
		cell.setCellValue(el.getTitleName());
		cell.setCellStyle(style2); 

		List<Excel_tilte> et = el.getEt();
		int maxy=0;
		int maxx=0;
		int minx=1;
		row = sheet.createRow((int) 1);
		for (Excel_tilte excel_tilte : et) {
			
			row.setHeightInPoints(20f);
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(y2>maxy){
				maxy=y2;
			}
			if(x2>maxx){
				maxx=x2;
			}
			if(x1>minx){
				minx=x1;
				row = sheet.createRow((int) x1);
			}
			cell = row.createCell((short) y1);
			cell.setCellValue(excel_tilte.getName());  
			cell.setCellStyle(style1);
			
			
		}
		for (int i = 0; i <=maxy ; i++) {
			sheet.setColumnWidth(i, 32 * 150);//设置固定宽度150
			//sheet.autoSizeColumn((short)i); 自动适应宽度
		}
		for (Excel_tilte excel_tilte : et){
			int x1=excel_tilte.getX1();
			int x2=excel_tilte.getX2();
			int y1=excel_tilte.getY1();
			int y2=excel_tilte.getY2();
			if(x1!=x2||y1!=y2){
				CellRangeAddress range = new CellRangeAddress(x1,x2,y1,y2);
				sheet.addMergedRegion(range);
				setRegionStyle(style1,range,sheet);
			}
		}
		CellRangeAddress range = new CellRangeAddress(0,0,0,maxy);
		sheet.addMergedRegion(range);
		setRegionStyle(style2,range,sheet);
		
		List<Integer> l1=new ArrayList<Integer>();
		List<Integer> l2=new ArrayList<Integer>();
		List<Integer> l3=new ArrayList<Integer>();
		List<Integer> l4=new ArrayList<Integer>();
		List<Excel_list> el2 = el.getEl();
		int flag1=0;int flag2=0;
		for (int i = 0; i < el2.size(); i++)  
        {  
			
			
			
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
            if("合计".equals(trqk1.getV_0())){
            	l1.add((int) i + maxx+1);
            	l2.add((int) i + maxx+1);
            	l3.add(0);
            	l4.add(1);
            }
            if("等外公路".equals(trqk1.getV_0())){
            	l1.add((int) i + maxx+1);
            	l2.add((int) i + maxx+1);
            	l3.add(0);
            	l4.add(1);
            }
            if("等级公路".equals(trqk1.getV_0())){
            	flag1=(int) i + maxx+1;
            	flag2++;
            }
            
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	cell.setCellType(XSSFCell.CELL_TYPE_STRING);
            	for(int f=0;f<100;f++){
            		if(j==f){
						PropertyDescriptor pd = new PropertyDescriptor("V_"+j, trqk1.getClass());  
						Method rM = pd.getReadMethod();//获得读方法  
						String num = (String) rM.invoke(trqk1);//因为知道是int类型的属性,所以转换成integer就是了。。也可以不转换直接打印 
            			cell.setCellValue(num);  
	                    cell.setCellStyle(style);
            		}
            	}
            	
			}
        }  
		if(flag2>0){
			l1.add(flag1-flag2+1);
			l2.add(flag1);
			l3.add(0);
			l4.add(0);
		}
		for (int i = 0; i < l1.size(); i++) {
			CellRangeAddress ranges = new CellRangeAddress(l1.get(i),l2.get(i),l3.get(i),l4.get(i));
			sheet.addMergedRegion(ranges);
			setRegionStyle(style,ranges,sheet);
		}
		
		
		
		wb.write(out);
 		out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	
	
	
	/**
	  * 设置合并单元格格式
	  * @param sheet
	  * @param region
	  * @param cs
	  */
	private static void setRegionStyle(CellStyle cs, CellRangeAddress region, Sheet sheet){  
      
      for(int i=region.getFirstRow();i<=region.getLastRow();i++){     
          Row row=sheet.getRow(i);  
          if(row==null) row=sheet.createRow(i);  
          for(int j=region.getFirstColumn();j<=region.getLastColumn();j++){  
              Cell cell=row.getCell(j);  
              if( cell==null){  
                  cell=row.createCell(j);  
                  cell.setCellValue("");  
              }  
               cell.setCellStyle(cs);  
          }  
      }  
  } 
	
	
}
