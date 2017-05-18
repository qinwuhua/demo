package com.hdsx.jxcsxm.utile;

import java.io.IOException;
import java.util.Map;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class GetRequestEncoding
 */
public class GetRequestEncoding implements Filter {

    /**
     * Default constructor. 
     */
    public GetRequestEncoding() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse resp = (HttpServletResponse) response;
		if (req.getMethod().equalsIgnoreCase("get")) {
			req = new MyRequest(req);
		} else {
			req.setCharacterEncoding("utf-8");
		}

		resp.setContentType("text/html;charset=utf-8");
		chain.doFilter(req, resp);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
class MyRequest extends HttpServletRequestWrapper {
	private ServletRequest request;
	private boolean isTran = false;

	public MyRequest(HttpServletRequest request) {
		super(request);// 此行不能删，有些方法是父类提供的~~~
		this.request = request;
	}

	@Override
	public String getParameter(String name) {
		try {
			String value = request.getParameter(name);
			if (value != null) {
				value = new String(value.getBytes("iso8859-1"), "utf-8");
			}
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	@Override
	public String[] getParameterValues(String name) {
		try {
			String[] values = request.getParameterValues(name);
			for (int i = 0; i < values.length; i++) {
				String v = new String(values[i].getBytes("iso8859-1"), "utf-8");
				values[i] = v;
			}
			return values;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}

	@Override
	public Map<String, String[]> getParameterMap() {
		try {
			Map<String, String[]> map = request.getParameterMap();
			if (!isTran) {
				Set<String> key = map.keySet();
				for (String k : key) {
					String[] values = map.get(k);
					for (int i = 0; i < values.length; i++) {
						String v = new String(values[i].getBytes("iso8859-1"),
								"utf-8");
						values[i] = v;
					}
				}
				isTran = true;
			}
			return map;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}

