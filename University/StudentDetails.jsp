<%@page import="java.sql.*" %>

<%
    String name,email,mobile;
    String url, uname, upass, driver;
    String s, s1, s2, s3, s4;

    Connection con;
    Statement st;

%>

<%
    name = (String) session.getAttribute("name");
    email = (String) session.getAttribute("email");
    mobile = session.getAttribute("phone").toString();
    
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

        s = "insert into student (email, mobile) values ('"+email+"','"+mobile+"')";
        st.executeUpdate(s);
        
        s1 = "insert into college (email) value ('" +email+ "')";
        st.executeUpdate(s1);
        
        s2 = "insert into address (email) value ('" +email+ "')";
        st.executeUpdate(s2);

        s3 = "insert into examdetails (email) value ('" +email+ "')";
        st.executeUpdate(s3);

        s4 = "insert into login (email, mobile, username) values ('"+email+"','"+mobile+"','" +name+ "')";
        st.executeUpdate(s4);
    }
    catch(SQLException ex){
        out.println(ex);
    }

%>


<!DOCTYPE html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Student Details Form Page</title>
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
        <section class="header">
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

<!------------------------------------- form section ------------------------------------------------>

<section>
    <h5 style="text-align: center; color: yellow; margin-top: 5%; font-size: 25px; font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
    ">Hello <%=name%>! please fill this form...</h5>
    <form method="post" action="StudentForm.jsp">
        <div class="border">
            <div>
                <!-------------------------------- student infromation ---------------------------------------------------------->
                <h3 style="margin-top: 10px">Student Infromation</h3>
                <input type="text" name="t1" placeholder="First Name" required/><br>
                <input type="text" name="t2" placeholder="Middle Name" required/><br>
                <input type="text" name="t3" placeholder="Last Name" required/><br>
                <div class="radio" required>
                    <input type="radio" name="gender" value="male"> &nbsp;Male&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="female"> &nbsp;Female&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="gender" value="other"> &nbsp;Other<br>
                </div>
                
                DOB &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" name="dob" min="1900-12-01" max="2020-12-01" style="width: 125px;" required><br>
                Natoionlity &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="nationality" style="margin-top: 15px;" class="selector" required>
                    <option value="">-Select-</option>
                    <option value="American">American</option>
                    <option value="British">British</option>
                    <option value="Canadian">Canadian</option>
                    <option value="French">French</option>
                    <option value="German">German</option>
                    <option value="Indian">Indian</option>
                    <option value="Spanish">Spanish</option>
                    <option value="Italian">Italian</option>
                    <option value="Japanese">Japanese</option>
                    <option value="Australin">Australin</option>
                </select><br>

                Category &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<select name="category" style="margin-top: 15px;" class="selector" required>
                    <option value="">-Select-</option>
                    <option value="OPEN">OPEN</option>
                    <option value="SC">SC</option>
                    <option value="ST">ST</option>
                    <option value="OBC">OBC</option>
                    <option value="SBC">SBC</option>
                    <option value="EWS">EWS</option>
                    <option value="SEBC">SEBC</option>
                </select><br><br><hr class="hrline">


                <!--------------------------------------- college information --------------------------------------------------->

                <h3 style="margin-top: 10px;">College Infromation</h3>
                <input type="text" name="t4" placeholder="College Name" required/><br>
                <input type="text" name="t5" placeholder="College Puncode" required/><br>
                <input type="text" name="t6" placeholder="College City" required/><br>

                Course &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <select name="t7" style="margin-top: 15px;" class="selector" required>
                    <option value="">-Select-</option>
                    <option value="B.Com">B.Com</option>
                    <option value="B.Tech">B.Tech</option>
                    <option value="B.E.">B.E.</option>
                    <option value="B.Sc.Computer Science">B.Sc.Computer Science</option>
                    <option value="M.Com">M.Com</option>
                    <option value="M.Sc.Wine Technology">M.Sc.Wine Technology</option>
                    <option value="M.Sc.Computer Science">M.Sc.Computer Science</option>
                </select>
                <br>

                Branch &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <select name="t8" style="margin-top: 15px;" class="selector" required>
                    <option value="">-Select-</option>
                    <option value="Computer Science">Computer Science</option>
                    <option value="Infromation Technology">Infromation Technology</option>
                    <option value="Electronics and Telecommunication">Electronics and Telecommunication</option>
                    <option value="Mechanical">Mechanical</option>
                    <option value="Civil">Civil</option>
                    <option value="None">None</option>
                </select><br>

                Year &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <select name="t9" style="margin-top: 15px;" class="selector" required>
                    <option value="">-Select-</option>
                    <option value="First year">First year</option>
                    <option value="Second year">Second year</option>
                    <option value="Third year">Third year</option>
                    <option value="Fourth year">Fourth year</option>
                </select><br><br><hr class="hrline">

                <!---------------------------------------- address infromation ------------------------------------------------>
                <h3 style="margin-top: 10px;">Student Address</h3>
                <input type="text" name="t10" placeholder="House Name" required/><br>
                <input type="text" name="t11" placeholder="City" required/><br>
                <input type="text" name="t12" placeholder="Pincode" required/><br>
                <input type="text" name="t13" placeholder="Taluka" required/><br>
                <input type="text" name="t14" placeholder="District" required/><br>
                <input type="text" name="t15" placeholder="State" required/><br><br><hr class="hrline">

                <!----------------------------------- preveious examination details ---------------------------------------->
                
                <h3 style="margin-top: 10px;">Previous Examination Details</h3>
                <input type="text" name="t16" placeholder="Course / Exam Name" required/><br>
                <input type="text" name="t17" placeholder="Board / University Name" required/><br>
                <input type="text" name="t18" placeholder="Seat Number" required/><br>
                <input type="text" name="t19" placeholder="Marks Obtained" required/><br>
                <input type="text" name="t20" placeholder="Marks Out Of" required/><br>
                <input type="text" name="t21" placeholder="Percentage" required/><br>
                
                Result Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="date" id="date-input" name="t22" min="2000-01-01" max="2023-12-31" placeholder="Result date" style="width: 125px;" required>
            
                <br><br><button type="submit" class="submitbutton" style="margin-top: 20px;">Submit</button>
            </div>
    </form>
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



