<%--
  Created by IntelliJ IDEA.
  User: xiaohan
  Date: 4/7/22
  Time: 5:42 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="/bank/membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">
        <%@page import="com.ibm.security.appscan.altoromutual.model.Account"%>
        <%@page import="java.text.DecimalFormat"%>
        <%@ page import="com.ibm.security.appscan.altoromutual.model.Portfolio" %>
        <%@ page import="com.ibm.security.appscan.altoromutual.util.DBUtil" %>
        <div class="fl" style="width: 99%;">

            <%
                com.ibm.security.appscan.altoromutual.model.User user = (com.ibm.security.appscan.altoromutual.model.User)request.getSession().getAttribute("user");
                Account[] accounts = user.getAccounts();
            %>

            <h1>View All Holding Stocks
            </h1>

            <table border="0">
                <TR valign="top">
                <tr>
                    <td>ACCOUNT</td>
                    <td>SYMBOL</td>
                    <td>AMOUNT</td>
                    <td>PRICE</td>
                    <td>VALUE</td>
                </tr>
                <%
                    Portfolio[] portfolios = DBUtil.adminGetPortfolio();
                    for (Portfolio portfolio: portfolios){
                        double dblVal = portfolio.getValue();
                        double dblPrice = portfolio.getPrice();
                        String dollarFormatv = (dblVal<1)?"$0.00":"$.00";
                        String dollarFormatp = (dblPrice<1)?"$0.00":"$.00";
                        String value = new DecimalFormat(dollarFormatv).format(dblVal);
                        String price = new DecimalFormat(dollarFormatp).format(dblPrice);
                %>
                <tr><td width=84><%=portfolio.getAccountId()%></td><td width=84><%=portfolio.getSymbol()%></td><td width=84><%=portfolio.getAmount()%></td><td width=84><%=price%></td><td width=84><%=value%></td></tr>
                <% } %>

            </table></DIV>
    </td>

    </tr>
    </table>
</div>
</td>
</div>

<jsp:include page="/footer.jspf"/>


