<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MARKS DETAILS</title>
    </head>
    <body background="Images/blue.jpg" text="white">
        <table align="center">
      <tr><td><img src="Images/logo.gif" alt="Mountain View" style="width:100px;height:100px;"></td><td><h1>OAKLEY INTERNATIONAL SCHOOL</h1></td></tr>
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
    <table align="center">
    <tr><td><h1>Marks Details</h1></td></tr>
    </table>
    <table align="center" border="1">
        <%
        try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","tiger");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM STUDENTTESTS");
        ResultSetMetaData rsmd=rs.getMetaData();
        int a=rsmd.getColumnCount();
        int z=1;
        String s="";
        
       for(int c=1;c<=a;c++)
            {
                s=rsmd.getColumnName(c);
                
                %><td align="center" width="200"><%=s%></td>
         <% }
            %><tr></tr><%
        while(rs.next())
        {
            
            for(int c=1;c<=a;c++)
            {
                %><td align="center" width="200"><%=rs.getString(c)%></td><%
               
             
            }
                %>
          <tr></tr>
          <% 
         }}
catch(ClassNotFoundException cnfe){}
        catch(SQLException s){}

     %>
    </table>
    </body>
</html>
