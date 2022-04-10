<%--
  Created by IntelliJ IDEA.
  User: xiaohan
  Date: 4/7/22
  Time: 5:43 PM
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
        <%@ page import="com.ibm.security.appscan.altoromutual.model.Trading" %>
        <%@ page import="com.ibm.security.appscan.altoromutual.util.DBUtil" %>
        <%@ page import="java.text.SimpleDateFormat" %>
        <div class="fl" style="width: 99%;">

            <h1>Today's Trading Detail
            </h1>

            <table border="0">
                <TR valign="top">
                <tr>
                    <td>Time</td>
                    <td>SYMBOL</td>
                    <td>ACTION</td>
                    <td>PRICE</td>
                    <td>AMOUNT</td>
                    <td>VALUE</td>
                </tr>
                <td>
                        <%
                            Trading[] tradings = DBUtil.adminGetTradings();
                            for (Trading trading: tradings){
                                double dblVal = trading.getValue();
                                double dblPrice = trading.getPrice();
                                String dollarFormatv = (dblVal<1)?"$0.00":"$.00";
                                String dollarFormatp = (dblPrice<1)?"$0.00":"$.00";
                                String value = new DecimalFormat(dollarFormatv).format(dblVal);
                                String price = new DecimalFormat(dollarFormatp).format(dblPrice);
                                String date = new SimpleDateFormat("yyyy-MM-dd").format(trading.getDate());
                        %>
                    <tr><td width=84><%=date%></td><td width=84><%=trading.getSymbol()%></td><td width=84><%=trading.getTradingType()%></td><td width=84><%=price%></td><td width=84><%=trading.getAmount()%></td><td width=84><%=value%></td></tr>
                        <% } %>
            </table></DIV>
    </td>

    </tr>
    </table>
</div>
</td>
</div>

<jsp:include page="/footer.jspf"/>


