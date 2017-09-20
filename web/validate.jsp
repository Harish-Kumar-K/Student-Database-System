<%@page import="java.sql.Driver"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
     try{
  
        response.setContentType("text/html");
        String username=request.getParameter("UN");
        String password=request.getParameter("PW");
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","SYSTEM","tiger");
        Statement st=con.createStatement();
        ResultSet rs=st.executeQuery("select * from LOGIN");
        int c=0;
       /* Cookie[] cookies = request.getCookies();
    if(cookies!=null)
    for (int i = 0; i < cookies.length; i++) {
        
        out.println("In the deletion of Cookies");
    cookies[i].setMaxAge(0);*/
    
        while(rs.next())
        {if(rs.getString(1).equals(username)&&rs.getString(2).equals(password))
        {
           c=1;
           break;
        }}
        if(c==1)
        {   
            Cookie v=new Cookie("UN",username);
            response.addCookie(v);
            
            response.sendRedirect("index1.jsp");
            
        }
        else
        {
            response.sendRedirect("wrong.jsp");
        }  
        }
        
        catch(ClassNotFoundException cnfe)
        {
            out.write("Class not found");
        }
        catch(SQLException se)
        {
            out.write("SqlException");
        }
     
%>


