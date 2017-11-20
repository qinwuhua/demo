package com.hdsx.jxcsxm.tjbb.bean;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
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
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
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


		List<Excel_list> el2 = el.getEl();
		for (int i = 0; i < el2.size(); i++)  
        {  
            row = sheet.createRow((int) i + maxx+1);  
            Excel_list trqk1 = (Excel_list) el2.get(i);  
            // 第四步，创建单元格，并设置值  
         
            for (int j = 0; j <= maxy; j++) {
            	cell = row.createCell((short) j);
            	cell.setCellType(XSSFCell.CELL_TYPE_STRING);
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            	}
            	if(j==1){
            		cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
            	}
            	if(j==21){
            		cell.setCellValue(trqk1.getV_21());  
                    cell.setCellStyle(style);
            	}
            	if(j==22){
            		cell.setCellValue(trqk1.getV_22());  
                    cell.setCellStyle(style);
            	}
            	
            	if(j==23){
            		cell.setCellValue(trqk1.getV_23());  
                    cell.setCellStyle(style);
            	}if(j==24){
            		cell.setCellValue(trqk1.getV_24());  
                    cell.setCellStyle(style);
            	}
            	if(j==25){
            		cell.setCellValue(trqk1.getV_25());  
                    cell.setCellStyle(style);
            	}
            	if(j==26){
            		cell.setCellValue(trqk1.getV_26());  
                    cell.setCellStyle(style);
            	}
            	if(j==27){
            		cell.setCellValue(trqk1.getV_27());  
                    cell.setCellStyle(style);
            	}
            	if(j==28){
            		cell.setCellValue(trqk1.getV_28());  
                    cell.setCellStyle(style);
            	}
            	if(j==29){
            		cell.setCellValue(trqk1.getV_29());  
                    cell.setCellStyle(style);
            	}
            	if(j==30){
            		cell.setCellValue(trqk1.getV_30());  
                    cell.setCellStyle(style);
            	}
            	if(j==31){
            		cell.setCellValue(trqk1.getV_31());  
                    cell.setCellStyle(style);
            	}
            	if(j==32){
            		cell.setCellValue(trqk1.getV_32());  
                    cell.setCellStyle(style);
            	}
            	if(j==33){
            		cell.setCellValue(trqk1.getV_33());  
                    cell.setCellStyle(style);
            	}
            	if(j==34){
            		cell.setCellValue(trqk1.getV_34());  
                    cell.setCellStyle(style);
            	}
            	if(j==35){
            		cell.setCellValue(trqk1.getV_35());  
                    cell.setCellStyle(style);
            	}
            	if(j==36){
            		cell.setCellValue(trqk1.getV_36());  
                    cell.setCellStyle(style);
            	}
            	if(j==37){
            		cell.setCellValue(trqk1.getV_37());  
                    cell.setCellStyle(style);
            	}
            	if(j==38){
            		cell.setCellValue(trqk1.getV_38());  
                    cell.setCellStyle(style);
            	}
            	if(j==39){
            		cell.setCellValue(trqk1.getV_39());  
                    cell.setCellStyle(style);
            	}
            	if(j==40){
            		cell.setCellValue(trqk1.getV_40());  
                    cell.setCellStyle(style);
            	}
            	if(j==41){
            		cell.setCellValue(trqk1.getV_41());  
                    cell.setCellStyle(style);
            	}
            	if(j==42){
            		cell.setCellValue(trqk1.getV_42());  
                    cell.setCellStyle(style);
            	}
            	if(j==43){
            		cell.setCellValue(trqk1.getV_43());  
                    cell.setCellStyle(style);
            	}
            	if(j==44){
            		cell.setCellValue(trqk1.getV_44());  
                    cell.setCellStyle(style);
            	}
            	if(j==45){
            		cell.setCellValue(trqk1.getV_45());  
                    cell.setCellStyle(style);
            	}
            	if(j==46){
            		cell.setCellValue(trqk1.getV_46());  
                    cell.setCellStyle(style);
            	}
            	if(j==47){
            		cell.setCellValue(trqk1.getV_47());  
                    cell.setCellStyle(style);
            	}
            	if(j==48){
            		cell.setCellValue(trqk1.getV_48());  
                    cell.setCellStyle(style);
            	}
            	if(j==49){
            		cell.setCellValue(trqk1.getV_49());  
                    cell.setCellStyle(style);
            	}
            	if(j==50){
            		cell.setCellValue(trqk1.getV_50());  
                    cell.setCellStyle(style);
            	}
            	if(j==51){
            		cell.setCellValue(trqk1.getV_51());  
                    cell.setCellStyle(style);
            	}
            	if(j==52){
            		cell.setCellValue(trqk1.getV_52());  
                    cell.setCellStyle(style);
            	}
            	if(j==53){
            		cell.setCellValue(trqk1.getV_53());  
                    cell.setCellStyle(style);
            	}
            	if(j==54){
            		cell.setCellValue(trqk1.getV_54());  
                    cell.setCellStyle(style);
            	}
            	if(j==55){
            		cell.setCellValue(trqk1.getV_55());  
                    cell.setCellStyle(style);
            	}
            	if(j==56){
            		cell.setCellValue(trqk1.getV_56());  
                    cell.setCellStyle(style);
            	}
            	if(j==57){
            		cell.setCellValue(trqk1.getV_57());  
                    cell.setCellStyle(style);
            	}
            	if(j==58){
            		cell.setCellValue(trqk1.getV_58());  
                    cell.setCellStyle(style);
            	}
            	if(j==59){
            		cell.setCellValue(trqk1.getV_59());  
                    cell.setCellStyle(style);
            	}
            	if(j==60){
            		cell.setCellValue(trqk1.getV_60());  
                    cell.setCellStyle(style);
            	}
            	if(j==61){
            		cell.setCellValue(trqk1.getV_61());  
                    cell.setCellStyle(style);
            	}
            	if(j==62){
            		cell.setCellValue(trqk1.getV_62());  
                    cell.setCellStyle(style);
            	}
            	if(j==63){
            		cell.setCellValue(trqk1.getV_63());  
                    cell.setCellStyle(style);
            	}
            	if(j==64){
            		cell.setCellValue(trqk1.getV_64());  
                    cell.setCellStyle(style);
            	}
            	if(j==65){
            		cell.setCellValue(trqk1.getV_65());  
                    cell.setCellStyle(style);
            	}
            	if(j==66){
            		cell.setCellValue(trqk1.getV_66());  
                    cell.setCellStyle(style);
            	}if(j==67){
            		cell.setCellValue(trqk1.getV_67());  
                    cell.setCellStyle(style);
            	}
            	if(j==68){
            		cell.setCellValue(trqk1.getV_68());  
                    cell.setCellStyle(style);
            	}
            	if(j==69){
            		cell.setCellValue(trqk1.getV_69());  
                    cell.setCellStyle(style);
            	}
            	if(j==70){
            		cell.setCellValue(trqk1.getV_70());  
                    cell.setCellStyle(style);
            	}
            	if(j==71){
            		cell.setCellValue(trqk1.getV_71());  
                    cell.setCellStyle(style);
            	}
            	if(j==72){
            		cell.setCellValue(trqk1.getV_72());  
                    cell.setCellStyle(style);
            	}
            	if(j==73){
            		cell.setCellValue(trqk1.getV_73());  
                    cell.setCellStyle(style);
            	}
            	if(j==74){
            		cell.setCellValue(trqk1.getV_74());  
                    cell.setCellStyle(style);
            	}
            	if(j==75){
            		cell.setCellValue(trqk1.getV_75());  
                    cell.setCellStyle(style);
            	}
            	if(j==76){
            		cell.setCellValue(trqk1.getV_76());  
                    cell.setCellStyle(style);
            	}
            	if(j==77){
            		cell.setCellValue(trqk1.getV_77());  
                    cell.setCellStyle(style);
            	}
            	if(j==78){
            		cell.setCellValue(trqk1.getV_78());  
                    cell.setCellStyle(style);
            	}
            	if(j==79){
            		cell.setCellValue(trqk1.getV_79());  
                    cell.setCellStyle(style);
            	}
            	if(j==80){
            		cell.setCellValue(trqk1.getV_80());  
                    cell.setCellStyle(style);
            	}
            	if(j==81){
            		cell.setCellValue(trqk1.getV_81());  
                    cell.setCellStyle(style);
            	}
            	if(j==82){
            		cell.setCellValue(trqk1.getV_82());  
                    cell.setCellStyle(style);
            	}
            	if(j==83){
            		cell.setCellValue(trqk1.getV_83());  
                    cell.setCellStyle(style);
            	}
            	if(j==84){
            		cell.setCellValue(trqk1.getV_84());  
                    cell.setCellStyle(style);
            	}
            	if(j==85){
            		cell.setCellValue(trqk1.getV_85());  
                    cell.setCellStyle(style);
            	}
            	if(j==86){
            		cell.setCellValue(trqk1.getV_86());  
                    cell.setCellStyle(style);
            	}
            	if(j==87){
            		cell.setCellValue(trqk1.getV_87());  
                    cell.setCellStyle(style);
            	}
            	if(j==88){
            		cell.setCellValue(trqk1.getV_88());  
                    cell.setCellStyle(style);
            	}
            	if(j==89){
            		cell.setCellValue(trqk1.getV_89());  
                    cell.setCellStyle(style);
            	}
            	if(j==90){
            		cell.setCellValue(trqk1.getV_90());  
                    cell.setCellStyle(style);
            	}
            	if(j==91){
            		cell.setCellValue(trqk1.getV_91());  
                    cell.setCellStyle(style);
            	}
            	if(j==92){
            		cell.setCellValue(trqk1.getV_92());  
                    cell.setCellStyle(style);
            	}
            	if(j==93){
            		cell.setCellValue(trqk1.getV_93());  
                    cell.setCellStyle(style);
            	}
            	if(j==94){
            		cell.setCellValue(trqk1.getV_94());  
                    cell.setCellStyle(style);
            	}
            	if(j==95){
            		cell.setCellValue(trqk1.getV_95());  
                    cell.setCellStyle(style);
            	}
            	if(j==96){
            		cell.setCellValue(trqk1.getV_96());  
                    cell.setCellStyle(style);
            	}
            	if(j==97){
            		cell.setCellValue(trqk1.getV_97());  
                    cell.setCellStyle(style);
            	}
            	if(j==98){
            		cell.setCellValue(trqk1.getV_98());  
                    cell.setCellStyle(style);
            	}
            	if(j==99){
            		cell.setCellValue(trqk1.getV_99());  
                    cell.setCellStyle(style);
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
		style1.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.getIndex());
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
            	if(j==0){
            		cell.setCellValue(trqk1.getV_0());  
                    cell.setCellStyle(style);
            	}
            	if(j==1){
            		cell.setCellValue(trqk1.getV_1());  
                    cell.setCellStyle(style);
            	}
            	if(j==2){
            		cell.setCellValue(trqk1.getV_2());  
                    cell.setCellStyle(style);
            	}
            	if(j==3){
            		cell.setCellValue(trqk1.getV_3());  
                    cell.setCellStyle(style);
            	}
            	if(j==4){
            		cell.setCellValue(trqk1.getV_4());  
                    cell.setCellStyle(style);
            	}
            	if(j==5){
            		cell.setCellValue(trqk1.getV_5());  
                    cell.setCellStyle(style);
            	}
            	if(j==6){
            		cell.setCellValue(trqk1.getV_6());  
                    cell.setCellStyle(style);
            	}
            	if(j==7){
            		cell.setCellValue(trqk1.getV_7());  
                    cell.setCellStyle(style);
            	}
            	if(j==8){
            		cell.setCellValue(trqk1.getV_8());  
                    cell.setCellStyle(style);
            	}
            	if(j==9){
            		cell.setCellValue(trqk1.getV_9());  
                    cell.setCellStyle(style);
            	}
            	if(j==10){
            		cell.setCellValue(trqk1.getV_10());  
                    cell.setCellStyle(style);
            	}
            	if(j==11){
            		cell.setCellValue(trqk1.getV_11());  
                    cell.setCellStyle(style);
            	}
            	if(j==12){
            		cell.setCellValue(trqk1.getV_12());  
                    cell.setCellStyle(style);
            	}
            	if(j==13){
            		cell.setCellValue(trqk1.getV_13());  
                    cell.setCellStyle(style);
            	}
            	if(j==14){
            		cell.setCellValue(trqk1.getV_14());  
                    cell.setCellStyle(style);
            	}
            	if(j==15){
            		cell.setCellValue(trqk1.getV_15());  
                    cell.setCellStyle(style);
            	}
            	if(j==16){
            		cell.setCellValue(trqk1.getV_16());  
                    cell.setCellStyle(style);
            	}
            	if(j==17){
            		cell.setCellValue(trqk1.getV_17());  
                    cell.setCellStyle(style);
            	}
            	if(j==18){
            		cell.setCellValue(trqk1.getV_18());  
                    cell.setCellStyle(style);
            	}
            	if(j==19){
            		cell.setCellValue(trqk1.getV_19());  
                    cell.setCellStyle(style);
            	}
            	if(j==20){
            		cell.setCellValue(trqk1.getV_20());  
                    cell.setCellStyle(style);
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
