<%@page import="java.sql.*" %>

<%!
    String mail, pwd, s1, s2;

    String url, uname, upass, driver;

    boolean flag=false;

    Connection con;
    Statement st;
    ResultSet rs;
%>

<script>
    emailFlag = false;
    passwordFlag = false;
</script>

<%
    mail = request.getParameter("t1");
    pwd = request.getParameter("t2");
    session.setAttribute("email",mail);

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
            if(rs.getString(1).equals(mail)){
                %>
                <script>
                    emailFlag = true;
                </script>
                <%
            }

            if((rs.getString(1).equals(mail)) && (rs.getString(3)).equals(pwd)){
                out.println("Welcome Admin!!");
                response.sendRedirect("AdminDetails.jsp");
                %>
                <script>
                    passwordFlag = true;
                </script>
                <%
                flag = true;
                break;
            }
        }

        rs.beforeFirst();     
        %>
        <script>
            function showAlert(){
                if(emailFlag === false){
                    alert("Email is incorrect");
                }
                else if(passwordFlag === false){
                    alert("Password is incorrect");
                }
                else{
                    alert("Email or Password is incorrect");
                }
            }
        </script>
        <%
        
        if(flag == false){
            %>
            <script>
                showAlert();
                window.location.href = "AdminLogin.html";
            </script>
            <%
        }
    }
    catch(SQLException ex){
        out.println(ex);
    }
%>