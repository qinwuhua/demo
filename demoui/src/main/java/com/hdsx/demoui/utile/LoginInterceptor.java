package com.hdsx.demoui.utile;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
@Component
public class LoginInterceptor extends AbstractInterceptor {

	private static final long serialVersionUID = 1L;

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		// 取得请求相关的ActionContext实例
		ActionContext ctx = invocation.getInvocationContext();
		Map session = ctx.getSession();
		String user = (String) session.get("username");

		// 如果没有登陆，或者登陆所有的用户名不是yuewei，都返回重新登陆

		if (user != null) {
			return invocation.invoke();
		}
		return Action.LOGIN;

	}

}
