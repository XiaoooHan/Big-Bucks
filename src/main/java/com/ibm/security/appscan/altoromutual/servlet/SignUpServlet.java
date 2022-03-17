package com.ibm.security.appscan.altoromutual.servlet;

import com.ibm.security.appscan.Log4AltoroJ;
import com.ibm.security.appscan.altoromutual.util.DBUtil;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class SignUpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String message = null;
        HttpSession session = req.getSession(true);

        String username = null;
        String passw = null;
        String cpassw = null;
        String firstN = null;
        String lastN = null;

        try {
            //获取请求参数
            //检查用户名是否可用
            //可用调用DBUtil保存到数据库
            //不可用：信息有误
            //System.out.println("1");
            username = req.getParameter("uid");
            passw = req.getParameter("passw");
            cpassw = req.getParameter("cpassw");
            firstN = req.getParameter("fn");
            lastN = req.getParameter("ln");

            if(firstN==null) firstN = "";
            if(lastN==null) lastN = "";

            if (username != null)
                username = username.trim().toLowerCase();
            if (passw != null)
                passw = passw.trim().toLowerCase();
            if (cpassw != null)
                cpassw = cpassw.trim().toLowerCase();

            //System.out.println(passw);
            //System.out.println(cpassw);

            if(DBUtil.isDuplicateID(username)){
                //System.out.println("Username[" + username + "] is already occupied");
                throw new Exception("SignUp Failed: the user name is duplicated.");
            }else if(!passw.equals(cpassw)){
                //System.out.println("The password entered twice is not the same");
                throw new Exception("SignUp Failed: The password entered twice is not the same.");
            }else{
                DBUtil.signUp(username,passw,firstN,lastN);
            }
        } catch (Exception ex) {
            req.getSession(true).setAttribute("loginError", ex.getLocalizedMessage());
            resp.sendRedirect("login.jsp");
            return;
        }

        req.getSession().setAttribute("message", message);
        resp.sendRedirect("login.jsp");

        return;
    }
}
