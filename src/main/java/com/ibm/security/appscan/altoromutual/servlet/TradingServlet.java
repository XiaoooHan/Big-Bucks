package com.ibm.security.appscan.altoromutual.servlet;

import com.ibm.security.appscan.altoromutual.util.DBUtil;
import com.ibm.security.appscan.altoromutual.util.ServletUtil;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import yahoofinance.Stock;
import yahoofinance.YahooFinance;

public class TradingServlet extends HttpServlet{
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getRequestURL().toString().endsWith("showAccount")){
            String symbol = req.getParameter("listAccounts");
        }
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getRequestURL().toString().endsWith("doTrade")) {
            String message = null;
            HttpSession session = request.getSession(true);

            if (!ServletUtil.isLoggedin(request)) {
                response.sendRedirect("login.jsp");
                return;
            }

            String action = request.getParameter("action");
            String symbol = request.getParameter("ticket");
            int amount = Integer.valueOf(request.getParameter("amount"));
            long accountID = Long.parseLong(request.getParameter("fromAccount"));

            Stock stock = YahooFinance.get(symbol);
            double price = stock.getQuote().getPrice().doubleValue();
            if (action.equals("buy")) {
                try {
                    DBUtil.addTrading(accountID, action, symbol, price, amount);
                    DBUtil.setPortfolio(accountID,symbol,price,amount,action);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else if(action.equals("sell")){
                try {
                    DBUtil.addTrading(accountID, action, symbol, price, amount);
                    DBUtil.setPortfolio(accountID,symbol,price,amount,action);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            message = "success!";
            request.getSession().setAttribute("message", message);
            response.sendRedirect("Stock.jsp");

            return;
        }
    }
}
