package com.ibm.security.appscan.altoromutual.servlet;

import com.ibm.security.appscan.altoromutual.model.Account;
import com.ibm.security.appscan.altoromutual.model.Trading;
import com.ibm.security.appscan.altoromutual.model.User;
import com.ibm.security.appscan.altoromutual.util.OperationsUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class StockAnalysisServlet extends HttpServlet {

    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        String accountName = req.getParameter("listAccounts");
        if (accountName == null){
            resp.sendRedirect(req.getContextPath()+"/bank/main.jsp");
            return;
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/bank/stockHistory?acctId=" + accountName);
        dispatcher.forward(req, resp);

    }
}
