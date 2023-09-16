<!DOCTYPE html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Record page</title>
        <link rel="stylesheet" href="sytle.css">
        <!--<link href="bootstrap.min.css" rel="stylesheet" />
        --><link href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css" integrity="sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm" crossorigin="anonymous"/>
        <script src="https://kit.fontawesome.com/6d05d7d959.js" crossorigin="anonymous"></script>
    </head>

    <body>
<!------------------------------ header --------------------------->
        <!--<script  src="JavaScript.js"></script>-->
        <section style="background-color: rgb(67, 138, 138); width: 2120px; height: 80px;">
            <nav>
                <a href="index.html">
                    <img src="img/logo.png">
                </a>
                <div class="nav-links" id="navLinks">
                    <i class="fa fa-window-close" onclick="hideMenu()"></i>
                    <ul>
                        <li><a href="AdminDetails.jsp" style="margin-right: 830px; margin-bottom: 10px;">Back</a></li>
                     </ul>
                </div>
                <i class="fa fa-bars" onclick="showMenu()"></i> 
             </nav>
        </section>
<!--------------------------------- admin page code ------------------------>

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


<%@page import="java.sql.*" %>

<%!
    String url, uname, upass, driver;
    int count=0;
    String s,s1;

    Connection con;
    Statement st;
    ResultSet rs, rs1;
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

            <table border='1'>
                <tr style="background-color: yellow;">
                    <th>Serial No.</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>Password</th>
                    <th>Frirst Name</th>
                    <th>Middle Name</th>
                    <th>Last Name</th>
                    <th>Gender</th>
                    <th>Date of Birth</th>
                    <th>Category</th>
                    <th>Nationality</th>
                    <th>College Name</th>
                    <th>College Puncode</th>
                    <th>Course</th>
                    <th>Branch</th>
                    <th>Exame Name</th>
                    <th>Board Name</th>
                    <th>Seat Number</th>
                    <th>Marks Obtained</th>
                    <th>Toatl Marks</th>
                    <th>Percentage</th>
                    <th>Exam Date</th>
                    <th>House Name</th>
                    <th>City</th>
                    <th>Pincode</th>
                    <th>Taluka</th>
                    <th>District</th>
                    <th>State</th>
                </tr>
        
<%          
                   
                while(rs.next()){
                    count++;
                    out.println("<tr><td>"+count+"</td>");
                    out.println("<td>"+rs.getString("email")+"</td>");
                    out.println("<td>"+rs.getString("mobile")+"</td>");
                    out.println("<td>"+rs.getString("password")+"</td>");
                    out.println("<td>"+rs.getString("firstname")+"</td>");
                    out.println("<td>"+rs.getString("middlename")+"</td>");
                    out.println("<td>"+rs.getString("lastname")+"</td>");
                    out.println("<td>"+rs.getString("gender")+"</td>");
                    out.println("<td>"+rs.getString("dob")+"</td>");
                    out.println("<td>"+rs.getString("category")+"</td>");
                    out.println("<td>"+rs.getString("nationality")+"</td>");
                    out.println("<td>"+rs.getString("name")+"</td>");
                    out.println("<td>"+rs.getString("puncode")+"</td>");
                    out.println("<td>"+rs.getString("course")+"</td>");
                    out.println("<td>"+rs.getString("branch")+"</td>");
                    out.println("<td>"+rs.getString("examname")+"</td>");
                    out.println("<td>"+rs.getString("boardname")+"</td>");
                    out.println("<td>"+rs.getString("seatno")+"</td>");
                    out.println("<td>"+rs.getString("marksobtained")+"</td>");
                    out.println("<td>"+rs.getString("totalmarks")+"</td>");
                    out.println("<td>"+rs.getString("percentage")+"</td>");
                    out.println("<td>"+rs.getString("examdate")+"</td>");
                    out.println("<td>"+rs.getString("house")+"</td>");
                    out.println("<td>"+rs.getString("city")+"</td>");
                    out.println("<td>"+rs.getString("pincode")+"</td>");
                    out.println("<td>"+rs.getString("taluka")+"</td>");
                    out.println("<td>"+rs.getString("district")+"</td>");
                    out.println("<td>"+rs.getString("state")+"</td></tr>");

                    
                }
                count=0;

%>
            </table>

<%
        
    }
    catch(SQLException ex){
        out.println(ex);
    }
%>
