
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home Fix</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:400,600" rel="stylesheet">	
  <style>

     .navbar {
    margin-bottom: 0px;
    background-color: grey;
    z-index: 9999;
    border: 0;
    font-size: 14px !important;
    line-height: 1.42857143 !important;
    letter-spacing: 4px;
    border-radius: 0;
    padding:5px;
    height:100px;
}

.navbar li a, .navbar .navbar-brand {
    color: white !important;
	font-weight:bold;
        	
}

.navbar-nav li a:hover, .navbar-nav li.active a {
    color: #f4511e !important;
    background-color: #fff !important;
}

.navbar-default .navbar-toggle {
    border-color: transparent;
    color: #fff !important;
}
 #bar{
      background-color:red;
	  height:1px;
	  width:210px;
	  margin-left:43%;
	  
	  display:block;
 }

 .table-bordered{
    
 }
  </style>
</head>
<body>
 <% 
           String uname = "";
           Object o=session.getAttribute("name");
            
            %>

     <nav class="navbar navbar-default">
  <div class="container" >
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
      <a href="#"><img src="logo.png" height="200" style="position:relative; margin-top:-20%;margin-left:-80%;padding:0px;"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-left">
        <li><a href="customers.jsp">Customers</a></li>
        <li><a href="update.html">Update</a></li>
        <li><a href="wokers.jsp">Workers</a></li>
        <li><a href="admain.jsp">Bookings</a></li>
      <li style="margin-left:180px"><a href="logout.jsp">Logout</a></li>
      </ul>
        <%  
                if(o==null){
                   session.invalidate();
                  
                }
                else{
                       String kane = (String)o;
                       uname=kane;
                 out.print("<span style='margin-left:5px;margin-right:2px;margin-top:8px;position:absolute;color:white;border:1px solid white;padding:5px;width:130px;font-weight:bold;'>"
                         + " Hello "+kane+"</span>");
             
                }
           %>
    </div>
  </di
</nav>

           
      <%@ page import="java.util.*" %>
<%@ page import="java.sql.*;" %>
<%@ page import="java.io.*;" %>

        <%  
       
     response.setContentType("text/html");
     try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/suraj?autoReconnect=true&useSSL=false","root","oogy");
        PreparedStatement ps= conn.prepareStatement("select * from book");

          
            
           ResultSet rs=ps.executeQuery();
        
            if(!rs.isBeforeFirst() ){
              out.print("No Bookings yet");
            
            }
            else{
                while(rs.next()){  
                  
                  %>
                  <table class="table table-bordered table-hover">
                      <tr>
                          <td>
                  <%
            
                out.print("book id: "+rs.getInt(8)+"</td>"+"<td>"+"Name: "+rs.getString(3)+"</td>"+"<td>"+"Service: "+rs.getString(2)+"</td>"+"<td>"+"mobile: "+ rs.getString(4)+"</td>"+"<td>"+"Email: "+rs.getString(5)+"</td>"+"<td>"+"Status: "+rs.getString(7)+"</td>"+"</tr>");
                
                 out.print("</table>");
                }
            }
           
               
            
                
           
 }
     catch(Exception e){
         out.print(e);
     }
     
%> 
         
</body>
</html>