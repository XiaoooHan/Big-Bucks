<%--
  Created by IntelliJ IDEA.
  User: xiaohan
  Date: 4/7/22
  Time: 2:34 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">

        <%@ page import="java.util.Calendar" %>
        <%@ page import="yahoofinance.histquotes.HistoricalQuote" %>
        <%@ page import="java.util.List" %>
        <%@ page import="com.ibm.security.appscan.altoromutual.api.YahooAPI" %>
        <%@ page import="java.math.BigDecimal" %>
        <%@ page import="java.text.SimpleDateFormat" %>
        <%@ page import="java.sql.Timestamp" %>
        <div class="fl" style="width: 99%;">


            <h1>View Historical SPY Data</h1>

            <table border="0">
                <TR valign="top">
                <tr>
                    <td>TIME</td>
                    <td>SYMBOL</td>
                    <td>OPEN</td>
                    <td>CLOSE</td>
                    <td>HIGH</td>
                    <td>LOW</td>
                    <td>ADJUST</td>

                </tr>

                <%
                    YahooAPI yahooAPI = new YahooAPI();
                    List<HistoricalQuote> history = yahooAPI.getHistory("SPY", 5);
                    for (HistoricalQuote quote : history) {

                        String symbolQ = quote.getSymbol();
                        BigDecimal close = quote.getClose();
                        BigDecimal open = quote.getOpen();
                        BigDecimal high = quote.getHigh();
                        BigDecimal low = quote.getLow();
                        BigDecimal adj = quote.getAdjClose();
                        Timestamp timestamp = yahooAPI.convertDATE(quote.getDate());
                        String date = new SimpleDateFormat("yyyy-MM-dd").format(timestamp);
                %>


                <tr><td width=84><%=date%></td><td width=84><%=symbolQ%></td><td width=84><%=open%></td><td width=84><%=close%></td><td width=84><%=high%></td><td width=84><%=low%></td><td width=84><%=adj%></td></tr>
                <% } %>

            </table></DIV>
    </td>

    </tr>
    </table>
</div>
</td>
</div>

<jsp:include page="/footer.jspf"/>

