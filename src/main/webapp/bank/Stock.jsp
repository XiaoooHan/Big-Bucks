<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%
    /**
     This application is for demonstration use only. It contains known application security
     vulnerabilities that were created expressly for demonstrating the functionality of
     application security testing tools. These vulnerabilities may present risks to the
     technical environment in which the application is installed. You must delete and
     uninstall this demonstration application upon completion of the demonstration for
     which it is intended.

     IBM DISCLAIMS ALL LIABILITY OF ANY KIND RESULTING FROM YOUR USE OF THE APPLICATION
     OR YOUR FAILURE TO DELETE THE APPLICATION FROM YOUR ENVIRONMENT UPON COMPLETION OF
     A DEMONSTRATION. IT IS YOUR RESPONSIBILITY TO DETERMINE IF THE PROGRAM IS APPROPRIATE
     OR SAFE FOR YOUR TECHNICAL ENVIRONMENT. NEVER INSTALL THE APPLICATION IN A PRODUCTION
     ENVIRONMENT. YOU ACKNOWLEDGE AND ACCEPT ALL RISKS ASSOCIATED WITH THE USE OF THE APPLICATION.

     IBM AltoroJ
     (c) Copyright IBM Corp. 2008, 2013 All Rights Reserved.
     */
%>

<jsp:include page="/header.jspf"/>

<div id="wrapper" style="width: 99%;">
    <jsp:include page="membertoc.jspf"/>
    <td valign="top" colspan="3" class="bb">
        <%@page import="com.ibm.security.appscan.altoromutual.model.Account"%>

        <%
            com.ibm.security.appscan.altoromutual.model.User user = (com.ibm.security.appscan.altoromutual.model.User)request.getSession().getAttribute("user");
        %>

        <div class="fl" style="width: 99%;">


        <h1>Welcome to BigBucks Trading Board</h1>




            <form action="doTrade" method="post" name="trade" id="trade" onsubmit="return (confirminput(trade));">
                <table>

                    <tr>
                        <td>From Account:</td>
                        <td>
                            <select size="1" id="fromAccount" name="fromAccount">
                                <%
                                    for (Account account: user.getAccounts()){
                                        out.println("<option value=\""+account.getAccountId()+"\" >" + account.getAccountId() + " " + account.getAccountName() + "</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            Action
                        </td>
                        <td>
                            <select name="action" id="action">
                                <option value="0">Choose an action</option>
                                <option value="buy">Buy</option>
                                <option value="sell">Sell</option>
                            </select>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            Ticket:
                        </td>
                        <td>
                            <input type="text" id="ticket" name="ticket" value="" style="width: 150px;">
                        </td>
                        <td>
                        </td>
                    </tr>


                    <tr>
                        <td>
                            Amount:
                        </td>
                        <td>
                            <input type="text" id="amount" name="amount" style="width: 150px;">
                        </td>
                    </tr>


                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" name="btnSubmit" value="submit">
                        </td>
                    </tr>


                </table>
            </form>

        </div>

        <script type="text/javascript">
            function setfocus() {
                if (document.trade.ticket.value=="") {
                    document.trade.ticket.focus();
                } else {
                    document.trade.amount.focus();
                }
            }

            function confirminput(myform) {
                if (!(myform.ticket.value.length)) {
                    myform.reset();
                    myform.ticket.focus();
                    alert ("You must enter a valid Ticket");
                    return (false);
                }

                if(!(myform.amount.value.length)){
                    myform.amount.focus();
                    alert ("You must enter a valid Amount");
                    return (false);
                }

                if(!(myform.action.value.length)){
                    myform.reset();
                    myform.action.focus();
                    alert ("You must choose an valid action");
                }

            }
            window.onload = setfocus;
        </script>
    </td>
</div>

<jsp:include page="/footer.jspf"/>
