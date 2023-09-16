<%@page import="java.sql.*" %>

<%!
    String mail, pwd, s1, s2;

    String url, uname, upass, driver;

    boolean flag=false;

    Connection con;
    Statement st;
    ResultSet rs;
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
        st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

        s1 = "select * from adminlogin";
        rs = st.executeQuery(s1);

        while(rs.next()){
            if((rs.getString(1).equals(mail)) && (rs.getString(3)).equals(pwd)){
                out.println("Welcome Admin!!");
                response.sendRedirect("Admin.jsp");
                flag = true;
                break;
            }
        }

        rs.beforeFirst();     
        if(flag == false){
                       
            while(rs.next()){
                String umail = rs.getString(1);
                String upwd = rs.getString(3);
                
                if((mail.equals(mail)) && (upwd != pwd)){
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