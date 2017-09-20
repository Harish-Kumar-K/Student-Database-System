<%-- 
    Document   : index1
    Created on : Jun 8, 2017, 3:42:17 PM
    Author     : 9000035-TR13
--%>

<html>
    <head>
        <title>WELCOME</title>
    </head>
    <body background="Images/blue.jpg"  text="white">
        <table align="center">
            
            <tr><td><img src="Images/logo.gif" alt="Mountain View" style="width:100px;height:100px;"></td><td><marquee><h1>OAKLEY INTERNATIONAL SCHOOL</h1></marquee></td></tr>
            </table>
        <%
        Cookie[] d=request.getCookies();
        %>
        <table align="right">
            <tr><td><%=d[1].getValue()%></td><td><form action="test1.html"><input type="submit" value="Logout"></form></td></tr>
            </table>
            <br><br>
        <hr>
        <table>    
        <tr><td><form action="login.jsp" method="post"><input type="submit" value="Register"></form></td>
            <td><form action="marksupdate.jsp" method="post"><input type="submit" value="Marks Update"></form></td>
            <td><form action="display.jsp" method="post"><input type="submit" value="Result"></form></td>
            <td></td>
        </tr>
        </table>
        <hr>
        <%
            java.util.Date date=new java.util.Date();
            int h=date.getHours();
            String g="";
            if(h>=6&&h<12)
            {
                g="Good Morning";
            }
            else if(h>=12&&h<=17)
            {
                g="Good Afternoon";
            }
            else
                g="Good Evening";
        %>
        <br><br><br><br><br>
        <div align="center"><h1><%=g%></h1></div>
        <div align="center"><h1>Welcome to Oakley International School</h1></div>
       </body>    
</html>
