package com.hdsx.demoui.utile;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
@Scope("prototype")
@Controller
public class InitServlet extends HttpServlet {
    public static String rootPath;
	@Override
	public void init() throws ServletException {
		rootPath=getServletContext().getRealPath("/widget/anyChart/dataXml");
	}

	/**
	 * 
	 */
	private static final long serialVersionUID = -5538944554964040959L;

}
