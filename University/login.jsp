<%@page import="java.sql.*" %>

<%!
    String username, email, password;
    String driver, url, uname, upass, s, s1;
    boolean flag = false;    
    Connection con;
    Statement st;
    ResultSet rs;

%>

<script>
    emailFlag = false;
    passwordFlag = false;
</script>

<%
    driver = "com.mysql.cj.jdbc.Driver";
    url = "jdbc:mysql://localhost:3306/University";
    uname = "root";
    upass = "Password@123";

    email = request.getParameter("t1");
    password = request.getParameter("t2");
    session.setAttribute("email",email);

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
            if(rs.getString(1).equals(email)){
                %>
                <script>
                    emailFlag = true;
                </script>
                <%
            }

            if((rs.getString(1).equals(email)) && (rs.getString(3).equals(password))){
                username = rs.getString(5);
                response.sendRedirect("StudentProfile.jsp");
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
        <script type="text/Javascript">
            function showAlert() {
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
            window.location.href = "Login.html";
        </script>
    
 <%          
        }
    }
    catch(SQLException ex){
        out.println(ex);
    }
%>