<%--
  Created by IntelliJ IDEA.
  User: xiaohan
  Date: 4/10/22
  Time: 12:48 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="com.ibm.security.appscan.altoromutual.api.ChartAPI"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<jsp:include page="header.jspf"/>


<div id="wrapper" style="width: 99%;">
    <jsp:include page="/bank/membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">
        <div class="fl" style="width: 99%;">
            <%
                String symbol = request.getParameter("symbol");

                ChartAPI chartAPI = new ChartAPI();
                String priceFileName= null;
                String returnFileName= null;
                String autoCorrFileName= null;
                String histFileName= null;
                String cumRetFileName= null;
                String dailyPctFileName= null;
                String CAPMFileName= null;
                try {
                    priceFileName = ServletUtilities.saveChartAsPNG(chartAPI.createChart(symbol,1), 600, 400, null);
                    returnFileName = ServletUtilities.saveChartAsPNG(chartAPI.createReturnChart(symbol,1), 600, 400, null);
                    autoCorrFileName = ServletUtilities.saveChartAsPNG(chartAPI.createAutocorrelationChart(symbol,1), 600, 400, null);
                    histFileName = ServletUtilities.saveChartAsPNG(chartAPI.createHistChart(symbol,1), 600, 400, null);
                    cumRetFileName = ServletUtilities.saveChartAsPNG(chartAPI.createCumReturnChart(symbol,1),600, 400, null);
                    dailyPctFileName = ServletUtilities.saveChartAsPNG(chartAPI.createDailyReturnChart(symbol,1), 600, 400, null);
                    CAPMFileName = ServletUtilities.saveChartAsPNG(chartAPI.createCAPMChart(symbol,1), 600, 400, null);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
            <h1><%=symbol%> Historical Charts</h1>
            <form method="post" name="chart" action="chart" id="chart">
                <input type="submit" value="Back to Chart">
            </form>
            <img src="DisplayChart?filename=<%=priceFileName %>" alt="API exceeds limit"
                 width="400" height="250" />
            <img src="DisplayChart?filename=<%=returnFileName %>" alt="API exceeds limit"
                 width="400" height="250" />
            <img src="DisplayChart?filename=<%=autoCorrFileName %>" alt="API exceeds limit"
                 width="400" height="250" />
            <img src="DisplayChart?filename=<%=histFileName %>" alt="API exceeds limit"
                 width="400" height="250" />
            <img src="DisplayChart?filename=<%=cumRetFileName %>" alt="API exceeds limit"
                 width="400" height="250" />
            <img src="DisplayChart?filename=<%=dailyPctFileName %>" alt="API exceeds limit"
                 width="400" height="250" />
            <img src="DisplayChart?filename=<%=CAPMFileName %>" alt="API exceeds limit"
                 width="400" height="250" />
        </div>
    </td>
</div>
<jsp:include page="footer.jspf"/>
