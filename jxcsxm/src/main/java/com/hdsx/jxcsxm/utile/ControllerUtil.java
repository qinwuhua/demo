package com.hdsx.jxcsxm.utile;

import java.lang.reflect.Field;
import java.util.List;

import javax.servlet.http.HttpServletResponse;



/**
 * Controller层工具类
 * @author renzm
 *
 */
public class ControllerUtil{
	/**
	 * 将构造方法私有化，防止new对象
	 */
	private ControllerUtil(){
		
	}
	
	/**
	 * 用于返回datagrid需要的list类型的json字符串
	 * @param list 查询结果的list
	 * @param totalCount 符合条件的数据总条数
	 */
	public static  <T>  void retEup(List<T> list,int totalCount,HttpServletResponse response){
		EasyUIPage<T> ep = new EasyUIPage<T>();
		ep.setTotal(totalCount);
		ep.setRows(list);
		try {
			JsonUtils.write(ep, response.getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 将true或false以字符串形式返回前台
	 * @param bl
	 */
	public static void retTOrF(Boolean bl,HttpServletResponse response){
		if(bl){
			ResponseUtils.write(response, "true");
		}else{
			ResponseUtils.write(response, "false");
		}
	}
	/**
	 * 用于将普通bean以字符串形式返回前台
	 * @param t
	 */
	public static <T> void retBean(T t,HttpServletResponse response){
		try {
			JsonUtils.write(t, response.getWriter());
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查看bean的属性值
	 * @param bean
	 */
	public static <T>  void checkFiledNull(T bean,boolean IsNull, boolean IsNotNull){
		if(!(IsNull || IsNotNull)){
			try {
				throw new Exception(new java.lang.IllegalArgumentException().toString());
			} catch (Exception e1) {
				System.out.println("参数不合法！");
				return;
			}
		}
		Field[] fields = bean.getClass().getDeclaredFields();
		String fieldIsNull = "";
		String fieldIsNotNull = "";
		for(Field  field : fields){
			try {
				 Object fieldValue = field.get(bean);
				 if(fieldValue != null)
					 fieldIsNotNull += field.getName() + " : " + fieldValue.toString() + "'\n'";
				 else
					 fieldIsNull += field.getName() + " : is NULL '\n'";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(IsNull)
			System.out.println(fieldIsNull);
		if(IsNotNull)
			System.out.println(fieldIsNotNull);
		
	}
	
}
