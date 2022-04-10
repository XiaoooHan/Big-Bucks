<%--
  Created by IntelliJ IDEA.
  User: xiaohan
  Date: 4/7/22
  Time: 5:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="/bank/membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">
        <%@page import="com.ibm.security.appscan.altoromutual.util.ServletUtil"%>
        <h1>Manage Trading Risks</h1>
        <table border="0">
            <TR valign="top">
                <script type="text/javascript">
                    function jump1(){
                        window.location.href='holdings.jsp';
                    }
                    function jump2(){
                        window.location.href='tradingDetail.jsp';
                    }
                    function jump3(){
                        window.location.href='riskReturn.jsp';
                    }
                </script>
                <td><input type="button" onclick="jump1()" value="View All Holding Stocks" width="180"></td>
                <td><input type="button" onclick="jump2()" value="Today's Trading Detail"width="180"></td>
                <td><input type="button" onclick="jump3()" value="Analyze Overall Risk-Return"width="180"></td>
            </tr>


        </table>

    </td>
</div>

<jsp:include page="/footer.jspf"/>
