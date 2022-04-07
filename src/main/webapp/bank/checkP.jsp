<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: xiaohan
  Date: 4/6/22
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">

        <tr>
            <td>SYMBOL</td>
            <td>AMOUNT</td>
            <td>PRICE</td>
            <td>VALUE</td>
        </tr>

        <c: forEach items="${requestScope.portfolios}" var="portfolio">
            <tr>
                <td>${portfolio.getSymbol()}</td>
                <td>${portfolio.getAmount()}</td>
                <td>${portfolio.getPrice()}</td>
                <td>${portfolio.getValue()}</td>

            </tr>
        </c:>

    </td>

    </tr>
    </table>
</div>
</td>
</div>

<jsp:include page="/footer.jspf"/>

