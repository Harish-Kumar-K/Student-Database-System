 <%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

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
       
        <table align="center" border="2">
            <%
             try{String a="MID";
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","tiger");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM SUBJECTTESTS WHERE TERM='FINAL'");
        ResultSetMetaData rsmd=rs.getMetaData();
        int b=rsmd.getColumnCount();
        String s="";
       
            for(int c=1;c<=b;c++)
            {
                s=rsmd.getColumnName(c);
                
                %><td align="center" width="200"><%=s%></td>
         <% }
            %><tr></tr><%
        while(rs.next())
        {
            
            for(int c=1;c<=b;c++)
            {
                %><td align="center" width="200"><%=rs.getString(c)%></td><% 
            }
            %>
            <tr></tr>
            <%    
        }
        }
        catch(ClassNotFoundException cnfe){
        out.println(cnfe.toString());}
        catch(SQLException s){
        out.println(s.toString());
        }
        %>
        </table>
</html>

