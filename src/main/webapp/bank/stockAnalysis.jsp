<%--
  Created by IntelliJ IDEA.
  User: xiaohan
  Date: 3/31/22
  Time: 10:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">
        <%@page import="com.ibm.security.appscan.altoromutual.model.Account"%>
        <div class="fl" style="width: 99%;">

            <%
                com.ibm.security.appscan.altoromutual.model.User user = (com.ibm.security.appscan.altoromutual.model.User)request.getSession().getAttribute("user");
            %>

            <h1>Welcome to Stock Analysis Board
            </h1>


                <table border="0">

                    <TR valign="top">
                        <script type="text/javascript">
                            function jump1(){
                                //window.location.href='/user/stockAnalysisServlet?action=list';
                                window.location.href='stockHistory.jsp';
                            }
                        </script>
                        <td>
                            <input type="button" onclick="jump1()" value="Trading History">
                        </td>
                    </tr>

                </table>

        </div>
    </td>
</div>

<jsp:include page="/footer.jspf"/>
