<%-- 
    Document   : login.jsp
    Created on : Jun 9, 2017, 10:37:46 AM
    Author     : 9000035-TR13
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
              
                return true;
            }
            function check()
            {
                if(document.getElementById("row").checked)
                {
                 return true;   
                }
                else
                {
                    alert("Select record to edit");
                    return false;
                }
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
        <div align="center">
            <form action="login1.jsp" method="post"><h1><input type="submit" value="New Student Registration"></h1></form>
        </div>
        <form action="edit.jsp" method="post" onsubmit="return check()">
       <div style="overflow-y:scroll; height:110px;">
           
         <table align="center" border="1"> 
    <%
        try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","tiger");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT ROLLNO,NAME,GENDER,STUDENT_CLASS,SECTION FROM STUDENTMASTER");
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
                %> <td><input type="radio" name="row" id="row" value="<%=rs.getString(1)%>"></td>
          <tr></tr>
          <% 
         }}
catch(ClassNotFoundException cnfe){}
        catch(SQLException s){}

     %>
         </table>
       </div><br>
     <div align="center">
         <input type="submit" value="Edit">
     </div>   
       </form>
    </body>
</html>

