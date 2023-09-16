<%@page import="java.sql.*" %>

<%!
    String fname, mname, lname, gender, dob, nationality, category, mail,mail1;
    String cname, puncode, city, course, branch, year;
    String house, area, pincode, taluka, district, state;
    String exam, board, seat, marks, totalMarks, percentage, resulDate;

    String s, s1, s2, s3;

    Connection con;
    Statement st;

    String url, uname, upass, driver;
%>

<%
    mail = (String) session.getAttribute("email");
    mail1 = "lahu12@gmail.com";
    fname = request.getParameter("t1");
    mname = request.getParameter("t2");
    lname = request.getParameter("t3");
    gender = request.getParameter("gender");
    dob = request.getParameter("dob");
    nationality = request.getParameter("nationality");
    category = request.getParameter("category");
    
    cname = request.getParameter("t4");
    puncode = request.getParameter("t5");
    city = request.getParameter("t6");
    course = request.getParameter("t7");
    branch = request.getParameter("t8");
    year = request.getParameter("t9");

    house = request.getParameter("t10");
    area = request.getParameter("t11");
    pincode = request.getParameter("t12");
    taluka = request.getParameter("t13");
    district = request.getParameter("t14");
    state = request.getParameter("t15");
    
    exam = request.getParameter("t16");
    board = request.getParameter("t17");
    seat = request.getParameter("t18");
    marks =  request.getParameter("t19");
    totalMarks = request.getParameter("t20");
    percentage = request.getParameter("t21");
    resulDate = request.getParameter("t22");


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
        
        s = "update student set firstname = '" +fname+ "', middlename = '" +mname+ "', lastname = '" +lname+ "', gender='"
        +gender+ "', dob='" +dob+ "', nationality = '" +nationality+ "', category = '" +category+ "' where email = '"+mail+"'";  

        st.executeUpdate(s);

        s1 = "update college set name = '" +cname+ "', puncode = '" +puncode+ "', city = '" +city+ "', course = '" 
        +course+ "', branch = '" +branch+ "', year = '" +year+"' where email = '" +mail+ "'";

        st.executeUpdate(s1);

        s2 = "update address set house = '" +house+ "', city = '" + area+ "', pincode = '" +pincode+ "', taluka = '" +taluka+
        "', district = '" +district+ "', state = '" +state+ "' where email = '" +mail+ "'";

        st.executeUpdate(s2);

        s3 = "update examdetails set examname = '" +exam+ "', boardname = '" +board+ "', seatno = '" +seat+ "', marksobtained = "
        +marks+ ", totalMarks = " +totalMarks+ ", percentage = " +percentage+ ", examdate = '" +resulDate+ "' where email = '" +mail+"'";

        st.executeUpdate(s3);

        out.println("record inserted successfully");
    }
    catch(SQLException ex){
        out.println(ex);
    }
%>