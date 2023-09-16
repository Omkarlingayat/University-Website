
<!DOCTYPE html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Profile Page</title>
        <link rel="stylesheet" type="text/css" href="sytle.css">
        <!--<link href="bootstrap.min.css" rel="stylesheet" />
        --><link href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous"/>
        <script src="https://kit.fontawesome.com/6d05d7d959.js" crossorigin="anonymous"></script>
    </head>

    <body>
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
                        <li><a href="Index.html">HOME</a></li>
                        <li><a href="AboutUs.html">ABOUT</a></li>
                        <li><a href="Course.html">COURSE</a></li>
                        <li><a href="Blog.html">BLOG</a></li>
                        <li><a href="ContactUs.html">CONTACT</a></li>
                     </ul>
                </div>
                <i class="fa fa-bars" onclick="showMenu()"></i> 
             </nav>
       </section>


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

<%@page import = "java.sql.*"";%>

<%!
    String url, uname, upass, driver, s;

    Connection con;
    Statement st;
    ResultSet rs;

%>

<%
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

        rs = st.executeQuery("SELECT l.email, l.mobile, l.password, s.firstname, s.middlename, s.lastname, s.gender, s.dob, s.category, s.nationality, c.name, c.puncode, c.course, c.branch, e.examname, e.boardname, e.seatno, e.marksobtained, e.totalmarks, e.percentage, e.examdate, a.house, a.city, a.pincode, a.taluka, a.district, a.state FROM login l INNER JOIN student s ON l.email = s.email INNER JOIN college c ON l.email = c.email INNER JOIN examdetails e ON l.email = e.email INNER JOIN address a ON l.email = a.email");

%>

<!------------------------------------- form section ------------------------------------------------>
<section>
    <div class="leftside">
        <h2>Welcome</h2>

<%
    while(rs.next())
    {
        out.println(rs.getString("firstname"));
        out.println(rs.getString("middlename"));
        out.println(rs.getString("lastname"));
    }
%>
    </div>
    <div class="rightside">
        <h2>Welcome</h2>
    </div>
</section>



<%
        
    }
    catch(SQLException ex){
        out.println(ex);
    }
%>

