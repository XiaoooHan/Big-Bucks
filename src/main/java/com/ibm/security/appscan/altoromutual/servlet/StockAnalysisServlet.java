package com.ibm.security.appscan.altoromutual.servlet;

import com.ibm.security.appscan.altoromutual.model.Account;
import com.ibm.security.appscan.altoromutual.model.Portfolio;
import com.ibm.security.appscan.altoromutual.model.Trading;
import com.ibm.security.appscan.altoromutual.model.User;
import com.ibm.security.appscan.altoromutual.util.DBUtil;
import com.ibm.security.appscan.altoromutual.util.OperationsUtil;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;

public class StockAnalysisServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String symbol = (String) req.getSession().getAttribute("symbol");

        RequestDispatcher dispatcher = req.getRequestDispatcher("/bank/viewHistory.jsp?symbol=" + symbol);
        dispatcher.forward(req, resp);
    }
}
