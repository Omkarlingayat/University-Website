<%@page import="java.sql.*" %>

<%!
    String mail, username, mobile;
    String driver, url, uname, upass, s, s1;

    Connection con;
    Statement st;
    ResultSet rs;
%>

<%
    mail = request.getParameter("t2");
    username = request.getParameter("t1");
    mobile = request.getParameter("t3");

    out.println(mail+"  "+uname+"  "+"  "+mobile);

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
        con = DriverManager.getConnection(url,uname,upass);
        st = con.createStatement();

        s1 = "select * from student";
        rs = st.executeQuery(s1);

        int temp = 0;
        while(rs.next()){
            if(rs.getString(8).equals(mail)){
                temp++;
                break;
            }
        }

        out.println("temp = "+temp);
        if(temp == 0){
            session.setAttribute("name",username);
            session.setAttribute("email",mail);
            session.setAttribute("phone",mobile);

            response.sendRedirect("StudentDetails.jsp");
            out.println("Account created!");
        }
        else{
            out.println("This Email Id is already exist, enter another Email Id. temp = "+temp);
        }

    }
    catch(SQLException ex){
        out.println(ex);
    }

%>