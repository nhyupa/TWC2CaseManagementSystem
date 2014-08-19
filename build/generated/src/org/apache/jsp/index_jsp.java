package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Login Page</title>\n");
      out.write("        \n");
      out.write("        <!-- Bootstrap v3.1.1 -->\n");
      out.write("        <link rel=\"stylesheet\" href=\"stylesheets/bootstrap.css\"/>\n");
      out.write("        \n");
      out.write("        <!-- Bootstrap v3.1.1 -->\n");
      out.write("        <script src=\"javascript/bootstrap.min.js\"></script>\n");
      out.write("        \n");
      out.write("        <script language=\"javascript\">\n");
      out.write("            function onSubmit() {\n");
      out.write("                document.form1.action =\"LoginServlet\";\n");
      out.write("            }\n");
      out.write("            function onForgetPassword() {\n");
      out.write("                document.form1.action = \"ForgetPasswordServlet\";\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <body>\n");
      out.write("        <div class=\"container\" align=\"center\">\n");
      out.write("            <div style=\"height:10px;\"></div>\n");
      out.write("            <div class=\"row1\" style=\"width:360px;height:300px;\">\n");
      out.write("                <!--TWC2 logo-->\n");
      out.write("                <span class=\"col-xs-4\"><img src=\"image/logo_camans_360w.gif\"/></span>  \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            <div class=\"row2\" style=\"width:360px;height:200px;\">\n");
      out.write("                <!--login-->\n");
      out.write("                <form name=\"form1\" method=\"post\">\n");
      out.write("                    <div class=\"form-group \">\n");
      out.write("                        <label for=\"exampleInputEmail1\" style=\"margin-right:180px;\">Username</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" style=\"margin-left:3px; width:110%;\" name=\"username\"  >\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"exampleInputPassword1\" style=\"margin-right:180px;\">Password</label>\n");
      out.write("                        <input type=\"password\" class=\"form-control\" style=\"margin-left:3px; width:110%;\" name=\"pass\">\n");
      out.write("                    </div>\n");
      out.write("                    \n");
      out.write("                    <div style=\"margin-left:20px;\">\n");
      out.write("                        <button class=\"btn btn-primary\" style=\"background-color:rgb 176.172.231; font-weight:bold;\" onclick=\"onSubmit();\">LOGIN</button>\n");
      out.write("                        <button class=\"btn btn-primary\" style=\"background-color:rgb 176.172.231; font-weight:bold;\" onclick=\"onForgetPassword();\" >FORGET PASSWORD?</button>\n");
      out.write("                    </div>\n");
      out.write("                </form>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("            ");
 if (session.getAttribute("msgAuth") != null) {
                String msg = (String) session.getAttribute("msgAuth");
      out.write("\n");
      out.write("            <label style=\"color:red\">");
      out.print(msg);
      out.write("</label> ");
}
      out.write("\n");
      out.write("            ");
session.removeAttribute("msgAuth");
      out.write("\n");
      out.write("            \n");
      out.write("             ");
 if (session.getAttribute("msgAuthFailed") != null) {
                String msg = (String) session.getAttribute("msgAuthFailed");
      out.write("\n");
      out.write("            <label style=\"color:red\">");
      out.print(msg);
      out.write("</label> ");
}
      out.write("\n");
      out.write("            ");
session.removeAttribute("msgAuthFailed");
      out.write("\n");
      out.write("   \n");
      out.write("            ");
 if (session.getAttribute("errorMsg") != null) {
                String msg = (String) session.getAttribute("errorMsg");
      out.write("\n");
      out.write("            <label style=\"color:red\">");
      out.print(msg);
      out.write("</label> ");
}
      out.write("\n");
      out.write("            ");
session.removeAttribute("errorMsg");
      out.write("\n");
      out.write("            \n");
      out.write("            ");
 if (session.getAttribute("notificationMsg") != null) {
                String msg = (String) session.getAttribute("notificationMsg");
      out.write("\n");
      out.write("            <label style=\"color:red\">");
      out.print(msg);
      out.write("</label> ");
}
      out.write("\n");
      out.write("            ");
request.removeAttribute("msgAuth");
      out.write("\n");
      out.write("            \n");
      out.write("            ");
 if (session.getAttribute("logoutMsg") != null) {
                String msg = (String) session.getAttribute("logoutMsg");
      out.write("\n");
      out.write("            <label style=\"color:red\">");
      out.print(msg);
      out.write("</label> ");
}
      out.write("\n");
      out.write("            ");
request.removeAttribute("logoutMsg");
      out.write("\n");
      out.write("            \n");
      out.write("             ");
 if (session.getAttribute("logout") != null) {
                String msg = (String) session.getAttribute("logout");
      out.write("\n");
      out.write("            <label style=\"color:red\">");
      out.print(msg);
      out.write("</label> ");
}
      out.write("\n");
      out.write("            ");
request.removeAttribute("logout");
      out.write("\n");
      out.write("            \n");
      out.write("        </div><!-- end of container-->\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
