<%@page import="java.sql.*"  %>

<%!
    String mail, pwd, s;
    String url, uname, upass, driver;

    Connection con;
    Statement st;

%>

<%
    mail = request.getParameter("t1");
    pwd = request.getParameter("t2");
    
    driver = "com.mysql.cj.jdbc.Driver";
    url = "jdbc:mysql://localhost:3306/University";
    uname = "root";
    upass = "Password@123";

    try{
        Class.forName(driver);
    }
    catch(ClassNotFoundException ex){
        out.println(ex);
    }

    try{
        con = DriverManager.getConnection(url, uname, upass);
        st = con.createStatement();

        s = "update login set password = '" +pwd+ "', confirmpassword = '" +pwd+ "' where email = '" +mail+ "'";
        st.executeUpdate(s);
        out.println("Thank you");
        response.sendRedirect("EnrollStudent.html");
    }
    catch(SQLException ex){
        out.println(ex);
    }
%>