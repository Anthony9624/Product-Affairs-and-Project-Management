package cn.managesystem.web;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class GenericEncodingFilter implements Filter {
  public void destroy() {
  }

  public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
      throws IOException, ServletException {

    HttpServletRequest httpServletRequest = (HttpServletRequest) request;

    HttpServletRequest myrequest = new MyRequest(httpServletRequest);
    chain.doFilter(myrequest, response);
  }

  public void init(FilterConfig filterConfig) throws ServletException {
  }

}

class MyRequest extends HttpServletRequestWrapper {

  private HttpServletRequest request;

  private boolean hasEncode;

  public MyRequest(HttpServletRequest request) {
    super(request);
    this.request = request;
  }

  @Override
  public Map getParameterMap() {
    String method = request.getMethod();
    if (method.equalsIgnoreCase("post")) {
      try {
        request.setCharacterEncoding("utf-8");
        return request.getParameterMap();
      } catch (UnsupportedEncodingException e) {
        e.printStackTrace();
      }
    } else if (method.equalsIgnoreCase("get")) {
      Map<String, String[]> parameterMap = request.getParameterMap();
      if (!hasEncode) {
        for (String parameterName : parameterMap.keySet()) {
          String[] values = parameterMap.get(parameterName);
          if (values != null) {
            for (int i = 0; i < values.length; i++) {
              try {
                values[i] = new String(values[i].getBytes("UTF-8"), "UTF-8");
              } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
              }
            }
          }
        }
        hasEncode = true;
      }
      return parameterMap;
    }

    return super.getParameterMap();
  }

  @Override
  public String getParameter(String name) {
    Map<String, String[]> parameterMap = getParameterMap();
    String[] values = parameterMap.get(name);
    if (values == null) {
      return null;
    }
    return values[0];
  }

  @Override
  public String[] getParameterValues(String name) {
    Map<String, String[]> parameterMap = getParameterMap();
    String[] values = parameterMap.get(name);
    return values;
  }

}