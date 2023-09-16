
<!DOCTYPE html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Profile Page</title>
        <link rel="stylesheet" type="text/css" href="sytle.css">
        <!--<link href="bootstrap.min.css" rel="stylesheet" />
        --><link href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous"/>
        <script src="https://kit.fontawesome.com/6d05d7d959.js" crossorigin="anonymous"></script>
    </head>

    <body style="background-color: aquamarine;">
<!------------------------------ header --------------------------->
        <!--<script  src="JavaScript.js"></script>-->
        <section style="background-color:  rgb(67, 138, 138);">
            <nav>
                <a href="index.html">
                    <img src="img/logo.png">
                </a>
                <div class="nav-links" id="navLinks">
                    <i class="fa fa-window-close" onclick="hideMenu()"></i>
                    <ul>
                        <li><a href="EnrollStudent.html">Enroll Studnet</a></li>
                        <li><a href="StudentRecord.jsp">Student Record</a></li>
                        <li><a href="Index.html">Log Out</a></li>
                     </ul>
                </div>
                <i class="fa fa-bars" onclick="showMenu()"></i> 
             </nav>
       </section>


<%@page import = "java.sql.*"%>

<%!
    String url, uname, upass, driver, s,mail;

    Connection con;
    Statement st;
    ResultSet rs;

%>

<%
    mail = (String) session.getAttribute("email");
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

        rs = st.executeQuery("SELECT email, mobile, password, firstName, middleName, lastName FROM adminlogin;");

%>

<!------------------------------------- form section ------------------------------------------------>
<section>
            
<%

    while(rs.next())
    {     
        if(rs.getString("email").equals(mail)){
%>
        <h2 style="color: rgb(248, 31, 2); margin-left: 50px; margin-top: 20px;">Welcome</h2>
        <h3 style="color: #a623c5; margin-top: 40px; margin-left: 20px; text-align: left;">
<%
            out.println(rs.getString("firstname"));
            out.println(rs.getString("middlename"));
            out.println(rs.getString("lastname"));
            out.println("</h3>");
            break;
        }
    }
%>
    
<%        
    }
    catch(SQLException ex){
        out.println(ex);
    }
%>

<!------------------------ Java Script for toggle menu---------------->
<script>
    var navLinks = document.getElementById("navLinks");
function showMenu(){
    navLinks.style.right = "0";
}
function hideMenu(){
    navLinks.style.right = "-200px";    
}
</script>

</body>
</html>
