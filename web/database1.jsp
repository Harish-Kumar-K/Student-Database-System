<%-- 
    Document   : database1.jsp
    Created on : Jun 12, 2017, 10:24:59 AM
    Author     : 9000035-TR13
--%>


<%@page import="java.util.Date"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%      
        response.setContentType("text/html");
        String a=request.getParameter("name");
        String b=request.getParameter("gender");
        String c=request.getParameter("address1");
        String d1=request.getParameter("address2");
        String l=request.getParameter("address3");
        String e=request.getParameter("city");
        int f=Integer.parseInt(request.getParameter("pin"));
        int g=Integer.parseInt(request.getParameter("mobileno"));
        String h=request.getParameter("email");
        int j=Integer.parseInt(request.getParameter("class"));   
        String k=request.getParameter("section");
        try{
            
            Cookie[] d=request.getCookies();
            
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","tiger");
        Statement st=con.createStatement();
       st.executeUpdate("UPDATE STUDENTMASTER SET NAME='"+a+"',GENDER='"+b+"',ADDRESS1='"+c+"',ADDRESS2='"+d1+"',ADDRESS3='"+l+"',CITY='"+e+"',PIN="+f+",MOBILENO="+g+",EMAIL='"+h+"',SECTION='"+k+"',STUDENT_CLASS="+j+" WHERE ROLLNO="+d[2].getValue()+"");
         d[2].setMaxAge(0);
        response.addCookie(d[2]);    
          } 
        catch(ClassNotFoundException cnfe){
        out.println(cnfe.toString());}
        catch(SQLException s){
        out.println(s.toString());
        }
%>
<html>
    <head>
        <title>WELCOME</title>
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
            <tr><td><form action="login.jsp" method="post"><input type="submit" value="Register" onclick="return validation()"></form></td>
            <td><form action="marksupdate.jsp" method="post"><input type="submit" value="Marks Update"></form></td>
            <td><form action="display.jsp" method="post"><input type="submit" value="Result"></form></td>
            <td></td>
        </tr>
        </table>
        <hr>
 <table align="center">
           <tr><td><h1>Updated successfully</h1></td></tr>
           <tr><td><form action="login1.jsp" method="post"><input type="submit" value="New User"></td><tr>
       </table>
    </body>
</html>


