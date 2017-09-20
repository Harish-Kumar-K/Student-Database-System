<%-- 
    Document   : edit
    Created on : Jun 10, 2017, 11:52:21 AM
    Author     : 9000035-TR13
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login1
    Created on : Jun 9, 2017, 1:55:37 PM
    Author     : 9000035-TR13
--%>

<%-- 
    Document   : login.jsp
    Created on : Jun 9, 2017, 10:37:46 AM
    Author     : 9000035-TR13
--%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>WELCOME</title>
        <script type="text/javascript">
            function validation()
            {
                var a=document.getElementById("name").value;
                var c=document.getElementById("pin").value;
                var d=document.getElementById("mobileno").value;
                var e=document.getElementById("class").value;
                var f=document.getElementById("city").value;
                var b=document.getElementById("address1").value;
                var t=document.getElementById("gender").value;
                var m=document.getElementsByName("gender").value;
                if(a==""||a==null)
                {
                    alert("Name field is mandatory");
                    return false;
                }
                if(b==""||b==null)
                {
                    alert("Address1 field is mandatory");
                    return false;
                }
                if(f==""||f==null)
                {
                    alert("City field is mandatory");
                    return false;
                }
                if(c==""||c==null)
                {
                    alert("Pin Code field is mandatory");
                    return false;
                }
                if(c.length>=7)
                {    alert("Enter correct PIN code");
                    return false;
                }
                if(d==""||d==null)
                {
                    alert("Mobile no. field is mandatory");
                    return false;
                }
                if(d.length>=11)
                {    alert("Enter correct Mobile Number");
                    return false;
                }
                if(e>=11)
                {    alert("Enter correct class");
                    return false;
                }
                if(e==""||e==null)
                {
                    alert("Class field is mandatory");
                    return false;
                }
                if(t==""||t=null)
                {
                    alert("Select gender");
                    return false;
                }
               if(m[0].checked==false&&m[1].checked==false)
               {
                   alert("Select gender");
                   return false;
               }
                 return true;
            }
        </script>
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
        
 <form action="database1.jsp" method="post" onSubmit="return validation()">
            <br><br>
            <table align="center"><tr><td><h1>STUDENT REGISTRATION FORM</h1></td></tr></table><br><br>
            <table align="center">
                <% try{String l="";
            String a=request.getParameter("row");
           /*Cookie[] cookies = request.getCookies();
    if (cookies != null)
        for (Cookie cookie : cookies) {
            cookie.setValue("");
            cookie.setPath("/");
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }   */    
            Cookie v1=new Cookie("row",a);
            response.addCookie(v1);  
            
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","tiger");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM STUDENTMASTER WHERE ROLLNO="+a);
        while(rs.next())
            
        {
             
%>
            
                <tr><td>Name:</td><td><input type="text" name="name" id="name" value="<%=rs.getString(2)%>"></td><td></td></tr>
                <tr><td>Gender:</td><td>
                        <select name="gender"> 
                            <% if(rs.getString(3).equalsIgnoreCase("M")) { %>
                        <option value="M" selected>M</option>
                        <option value="F">F</option>
                        <% } else { %>
                        <option value="M" >M</option>
                        <option value="F" selected>F</option>
                        <% } %>
                        </select>
                        </td><td></td></tr>
                <tr><td>Address1:</td><td><input type="text" name="address1" id="address1" value="<%=rs.getString(4)%>"></td><td></td></tr>
                <tr><td>Address2:</td><td><input type="text" name="address2" id="address2" value="<%=rs.getString(5)%>"></td><td></td></tr>
                <tr><td>Address3:</td><td><input type="text" name="address3" id="address3" value="<%=rs.getString(6)%>"></td><td></td></tr>
                <tr><td>City:</td><td><input type="text" name="city" id="city" value="<%=rs.getString(7)%>"></td><td></td></tr>
                <tr><td>Pin:</td><td><input type="number" name="pin" id="pin" value="<%=rs.getString(8)%>"></td><td></td></tr>
                <tr><td>Mobile Number:</td><td><input type="number" name="mobileno" id="mobileno" value="<%=rs.getString(9)%>"></td><td></td></tr>
                <tr><td>Email:</td><td><input type="text" name="email" id="email" value="<%=rs.getString(10)%>"></td><td></td></tr>
                <tr><td>Class:</td><td><input type="number" name="class" id="class" value="<%=rs.getString(12)%>"></td><td></td></tr>
                <tr><td>Section:</td><td><input type="text" name="section" id="section" value="<%=rs.getString(11)%>"></td><td></td></tr>
                <tr><td></td><td align="center"><input type="submit" value="Update" onClick="return validation() "></td><td></td></tr>
           <% }
    
    }
               catch(ClassNotFoundException cnfe){
        out.println(cnfe.toString());}
        catch(SQLException s){
        out.println(s.toString());
        }
           
           %>
            </table>
        </form>
      
    </body>
</html>

