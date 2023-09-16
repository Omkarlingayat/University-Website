<%@page import="java.sql.*" %>

<%!
    String username, email, password;
    String driver, url, uname, upass, s, s1;
    boolean flag = false;

    Connection con;
    Statement st;
    ResultSet rs;

%>

<%
    driver = "com.mysql.cj.jdbc.Driver";
    url = "jdbc:mysql://localhost:3306/University";
    uname = "root";
    upass = "Password@123";

    email = request.getParameter("t1");
    password = request.getParameter("t2");

    try{
        Class.forName(driver);
    }
    catch(ClassNotFoundException ex){
        out.println(ex);
    }

    try{
        con = DriverManager.getConnection(url, uname, upass);
        st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        s = "select * from login";
        rs = st.executeQuery(s);

        while(rs.next()){
           
            if((rs.getString(1).equals(email)) && (rs.getString(3).equals(password))){
                username = rs.getString(5);
                response.sendRedirect("StudentProfile.jsp");
                flag = true;
                break;
            }
        }

        rs.beforeFirst();     
        if(flag == false){
                       
            while(rs.next()){
                String mail = rs.getString(1);
                String pwd = rs.getString(3);
                
                if((mail.equals(email)) && (pwd != password)){
                    out.println("Password is incorrect");
                    break;
                }              
            }
        }

        
        
    }
    catch(SQLException ex){
        out.println(ex);
    }
%>